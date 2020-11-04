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
#import "../../../include/SGFCStonePropertyValue.h"
#import "../../interface/internal/SGFCSinglePropertyValueInternalAdditions.h"
#import "../../interface/internal/SGFCStonePropertyValueInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcStonePropertyValue.h>
#import <libsgfcplusplus/ISgfcPropertyValueFactory.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

// System includes
#import <Foundation/NSString.h>

#pragma mark - Class extension

@interface SGFCStonePropertyValue()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcStonePropertyValue> _wrappedStonePropertyValue;
}
@end

@implementation SGFCStonePropertyValue

#pragma mark - Initialization and deallocation

+ (SGFCStonePropertyValue*) stonePropertyValueWithStoneValue:(NSString*)stoneValue
{
  return [[SGFCStonePropertyValue alloc] initWithStoneValue:stoneValue];
}

- (id) initWithRawValue:(NSString*)rawValue
{
  return [self initWithStoneValue:rawValue];
}

- (id) initWithStoneValue:(NSString*)stoneValue
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:stoneValue
                                                 invalidArgumentName:@"stoneValue"];

  // Create the actual wrapped object so that we can take the raw value from it.
  // Don't assign it to the member variable yet in case the superclass
  // initializer has a problem.
  auto wrappedStonePropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateStonePropertyValue(
    [SGFCMappingUtility fromSgfcKitString:stoneValue]);

  // Call designated initializer of superclass (SGFCSinglePropertyValue).
  // The superclass creates a useless wrapped object which we are going to
  // overwrite in a moment.
  self = [super initWithRawValue:[SGFCMappingUtility toSgfcKitString:wrappedStonePropertyValue->GetRawValue()]];
  if (! self)
    return nil;

  _wrappedStonePropertyValue = wrappedStonePropertyValue;

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object.
  [self setWrappedSinglePropertyValue:_wrappedStonePropertyValue];

  return self;
}

- (id) initWithWrappedStonePropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcStonePropertyValue>)wrappedStonePropertyValue
{
  if (wrappedStonePropertyValue == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedStonePropertyValue\" is nullptr"];

  self = [self initWithStoneValue:@""];
  if (! self)
    return nil;

  _wrappedStonePropertyValue = wrappedStonePropertyValue;

  [self setWrappedSinglePropertyValue:_wrappedStonePropertyValue];

  return self;
}

- (void) dealloc
{
  _wrappedStonePropertyValue = nullptr;
}

#pragma mark - SGFCSinglePropertyValue overrides

- (SGFCStonePropertyValue*) toStoneValue
{
  return self;
}

#pragma mark - Public API

- (NSString*) stoneValue
{
  try
  {
    return [SGFCMappingUtility toSgfcKitString:_wrappedStonePropertyValue->GetRawStoneValue()];
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseInvalidOperationExceptionWithCStringReason:exception.what()];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return nil;
  }
}

- (SGFCGoStonePropertyValue*) toGoStoneValue
{
  return nil;
}

#pragma mark - Internal API - SGFCStonePropertyValueInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcStonePropertyValue>) wrappedStonePropertyValue
{
  return _wrappedStonePropertyValue;
}

- (void) setWrappedStonePropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcStonePropertyValue>)wrappedStonePropertyValue
{
  if (wrappedStonePropertyValue == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedStonePropertyValue\" is nullptr"];

  [self setWrappedSinglePropertyValue:wrappedStonePropertyValue];
  _wrappedStonePropertyValue = wrappedStonePropertyValue;
}

@end
