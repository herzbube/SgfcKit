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
#import "../../../include/SGFCNumberPropertyValue.h"
#import "../../interface/internal/SGFCNumberPropertyValueInternalAdditions.h"
#import "../../interface/internal/SGFCSinglePropertyValueInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcNumberPropertyValue.h>
#import <libsgfcplusplus/ISgfcPropertyValueFactory.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

#pragma mark - Class extension

@interface SGFCNumberPropertyValue()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcNumberPropertyValue> _wrappedNumberPropertyValue;
}
@end

@implementation SGFCNumberPropertyValue

#pragma mark - Initialization and deallocation

+ (instancetype) numberPropertyValueWithNumberValue:(SGFCNumber)numberValue
{
  return [[self alloc] initWithNumberValue:numberValue];
}

- (instancetype) initWithRawValue:(NSString*)rawValue
{
  // TODO Attempt to convert to an SGFCNumber
  return [self initWithNumberValue:0];
}

- (instancetype) initWithNumberValue:(SGFCNumber)numberValue
{
  // Create the actual wrapped object so that we can take the raw value from it.
  // Don't assign it to the member variable yet in case the superclass
  // initializer has a problem.
  auto wrappedNumberPropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateNumberPropertyValue(
    [SGFCMappingUtility fromSgfcKitNumber:numberValue]);

  // Call designated initializer of superclass (SGFCSinglePropertyValue).
  // The superclass creates a useless wrapped object which we are going to
  // overwrite in a moment.
  self = [super initWithRawValue:[SGFCMappingUtility toSgfcKitString:wrappedNumberPropertyValue->GetRawValue()]];
  if (! self)
    return nil;

  _wrappedNumberPropertyValue = wrappedNumberPropertyValue;

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object.
  [self setWrappedSinglePropertyValue:_wrappedNumberPropertyValue];

  return self;
}

- (instancetype) initWithWrappedNumberPropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcNumberPropertyValue>)wrappedNumberPropertyValue
{
  if (wrappedNumberPropertyValue == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedNumberPropertyValue\" is nullptr"];

  self = [self initWithNumberValue:0];
  if (! self)
    return nil;

  _wrappedNumberPropertyValue = wrappedNumberPropertyValue;

  [self setWrappedSinglePropertyValue:_wrappedNumberPropertyValue];

  return self;
}

- (void) dealloc
{
  _wrappedNumberPropertyValue = nullptr;
}

#pragma mark - SGFCSinglePropertyValue overrides

- (SGFCNumberPropertyValue*) toNumberValue
{
  return self;
}

#pragma mark - Public API

- (SGFCNumber) numberValue
{
  try
  {
    return [SGFCMappingUtility toSgfcKitNumber:_wrappedNumberPropertyValue->GetNumberValue()];
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseInvalidOperationExceptionWithCStringReason:exception.what()];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return 0;
  }
}

#pragma mark - Internal API - SGFCNumberPropertyValueInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcNumberPropertyValue>) wrappedNumberPropertyValue
{
  return _wrappedNumberPropertyValue;
}

@end
