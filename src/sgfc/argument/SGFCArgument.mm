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
#import "../../interface/internal/SGFCArgumentInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcArgument.h>

#pragma mark - Class extension

@interface SGFCArgument()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcArgument> _wrappedArgument;
}

- (id) initWithWrappedArgument:(std::shared_ptr<LibSgfcPlusPlus::ISgfcArgument>)wrappedArgument NS_DESIGNATED_INITIALIZER;

@end

@implementation SGFCArgument

#pragma mark - Initialization and deallocation

- (id) init
{
  // Always raising an exception is intended. This guards against the library
  // client attempting to manually allocate/initialize an SGFCArgument.
  [SGFCExceptionUtility raiseInvalidOperationExceptionWithReason:@"SGFCArgument cannot be instantiated from outside of the library"];

  // Dummy return to make compiler happy (compiler does not see that an
  // exception is raised)
  return [self initWithWrappedArgument:nullptr];
}

- (id) initWithWrappedArgument:(std::shared_ptr<LibSgfcPlusPlus::ISgfcArgument>)wrappedArgument
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  if (wrappedArgument == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedArgument\" is nullptr"];

  _wrappedArgument = wrappedArgument;

  return self;
}

- (void) dealloc
{
  _wrappedArgument = nullptr;
}

#pragma mark - Public API

- (SGFCArgumentType) argumentType
{
  return [SGFCMappingUtility toSgfcKitArgumentType:_wrappedArgument->GetArgumentType()];
}

- (BOOL) hasIntegerTypeParameter
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedArgument->HasIntegerTypeParameter()];
}

- (NSInteger) integerTypeParameter
{
  return [SGFCMappingUtility toSgfcKitInteger:_wrappedArgument->GetIntegerTypeParameter()];
}

- (BOOL) hasPropertyTypeParameter
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedArgument->HasPropertyTypeParameter()];
}

- (SGFCPropertyType) propertyTypeParameter
{
  return [SGFCMappingUtility toSgfcKitPropertyType:_wrappedArgument->GetPropertyTypeParameter()];
}

- (NSString*) toString
{
  return [SGFCMappingUtility toSgfcKitString:_wrappedArgument->ToString()];
}

#pragma mark - Internal API - SGFCArgumentInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcArgument>) wrappedArgument
{
  return _wrappedArgument;
}

@end
