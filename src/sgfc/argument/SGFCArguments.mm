// -----------------------------------------------------------------------------
// Copyright 2020 Patrick Näf (herzbube@herzbube.ch)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// -----------------------------------------------------------------------------

// Project includes
#import "../../../include/SGFCArgument.h"
#import "../../../include/SGFCArguments.h"
#import "../../interface/internal/SGFCArgumentInternalAdditions.h"
#import "../../interface/internal/SGFCArgumentsInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcArguments.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

// System includes
#import <Foundation/NSArray.h>

#pragma mark - Class extension

@interface SGFCArguments()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcArguments> _wrappedArguments;
}

@property(nonatomic, strong, readwrite) NSArray* arguments;

@end

@implementation SGFCArguments

#pragma mark - Initialization and deallocation

+ (SGFCArguments*) emptyArguments
{
  return [[SGFCArguments alloc] init];
}

- (id) init
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  _wrappedArguments = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreateSgfcArguments();
  self.arguments = [NSMutableArray arrayWithCapacity:0];

  return self;
}

- (void) dealloc
{
  _wrappedArguments = nullptr;
  self.arguments = nil;
}

#pragma mark - Public API

- (BOOL) hasArguments
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedArguments->HasArguments()];
}

- (void) addArgumentWithType:(SGFCArgumentType)argumentType
{
  auto mappedArgumentType = [SGFCMappingUtility fromSgfcKitArgumentType:argumentType];

  try
  {
    _wrappedArguments->AddArgument(mappedArgumentType);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }

  [self addWrapperForNewlyAddedArgument];
}

- (void) addArgumentWithType:(SGFCArgumentType)argumentType
            withIntParameter:(NSInteger)parameter
{
  auto mappedArgumentType = [SGFCMappingUtility fromSgfcKitArgumentType:argumentType];
  auto mappedParameter = [SGFCMappingUtility fromSgfcKitInteger:parameter];

  try
  {
    _wrappedArguments->AddArgument(mappedArgumentType, mappedParameter);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }

  [self addWrapperForNewlyAddedArgument];
}

- (void) addArgumentWithType:(SGFCArgumentType)argumentType
   withPropertyTypeParameter:(SGFCPropertyType)parameter
{
  auto mappedArgumentType = [SGFCMappingUtility fromSgfcKitArgumentType:argumentType];
  auto mappedParameter = [SGFCMappingUtility fromSgfcKitPropertyType:parameter];

  try
  {
    _wrappedArguments->AddArgument(mappedArgumentType, mappedParameter);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }

  [self addWrapperForNewlyAddedArgument];
}

- (void) clearArguments
{
  _wrappedArguments->ClearArguments();
  [(NSMutableArray*)_arguments removeAllObjects];
}

#pragma mark - Internal API

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcArguments>) wrappedArguments
{
  return _wrappedArguments;
}

#pragma mark - Private API

- (void) addWrapperForNewlyAddedArgument
{
  auto wrappedArgument = _wrappedArguments->GetArguments().back();
  SGFCArgument* argument = [[SGFCArgument alloc] initWithWrappedArgument:wrappedArgument];
  [(NSMutableArray*)_arguments addObject:argument];
}

@end
