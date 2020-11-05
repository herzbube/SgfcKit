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
#import "../../../include/SGFCMovePropertyValue.h"
#import "../../interface/internal/SGFCMovePropertyValueInternalAdditions.h"
#import "../../interface/internal/SGFCSinglePropertyValueInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcMovePropertyValue.h>
#import <libsgfcplusplus/ISgfcPropertyValueFactory.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

// System includes
#import <Foundation/NSString.h>

#pragma mark - Class extension

@interface SGFCMovePropertyValue()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcMovePropertyValue> _wrappedMovePropertyValue;
}
@end

@implementation SGFCMovePropertyValue

#pragma mark - Initialization and deallocation

+ (instancetype) movePropertyValueWithMoveValue:(NSString*)moveValue
{
  return [[self alloc] initWithMoveValue:moveValue];
}

- (instancetype) initWithRawValue:(NSString*)rawValue
{
  return [self initWithMoveValue:rawValue];
}

- (instancetype) initWithMoveValue:(NSString*)moveValue
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:moveValue
                                                 invalidArgumentName:@"moveValue"];

  // Create the actual wrapped object so that we can take the raw value from it.
  // Don't assign it to the member variable yet in case the superclass
  // initializer has a problem.
  auto wrappedMovePropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateMovePropertyValue(
    [SGFCMappingUtility fromSgfcKitString:moveValue]);

  // Call designated initializer of superclass (SGFCSinglePropertyValue).
  // The superclass creates a useless wrapped object which we are going to
  // overwrite in a moment.
  self = [super initWithRawValue:[SGFCMappingUtility toSgfcKitString:wrappedMovePropertyValue->GetRawValue()]];
  if (! self)
    return nil;

  _wrappedMovePropertyValue = wrappedMovePropertyValue;

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object.
  [self setWrappedSinglePropertyValue:_wrappedMovePropertyValue];

  return self;
}

- (instancetype) initWithWrappedMovePropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcMovePropertyValue>)wrappedMovePropertyValue
{
  if (wrappedMovePropertyValue == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedMovePropertyValue\" is nullptr"];

  self = [self initWithMoveValue:@""];
  if (! self)
    return nil;

  _wrappedMovePropertyValue = wrappedMovePropertyValue;

  [self setWrappedSinglePropertyValue:_wrappedMovePropertyValue];

  return self;
}

- (void) dealloc
{
  _wrappedMovePropertyValue = nullptr;
}

#pragma mark - SGFCSinglePropertyValue overrides

- (SGFCMovePropertyValue*) toMoveValue
{
  return self;
}

#pragma mark - Public API

- (NSString*) moveValue
{
  try
  {
    return [SGFCMappingUtility toSgfcKitString:_wrappedMovePropertyValue->GetRawMoveValue()];
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseInvalidOperationExceptionWithCStringReason:exception.what()];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return nil;
  }
}

- (SGFCGoMovePropertyValue*) toGoMoveValue
{
  return nil;
}

#pragma mark - Internal API - SGFCMovePropertyValueInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcMovePropertyValue>) wrappedMovePropertyValue
{
  return _wrappedMovePropertyValue;
}

- (void) setWrappedMovePropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcMovePropertyValue>)wrappedMovePropertyValue
{
  if (wrappedMovePropertyValue == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedMovePropertyValue\" is nullptr"];

  [self setWrappedSinglePropertyValue:wrappedMovePropertyValue];
  _wrappedMovePropertyValue = wrappedMovePropertyValue;
}

@end
