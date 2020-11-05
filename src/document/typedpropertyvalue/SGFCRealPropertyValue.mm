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
#import "../../../include/SGFCRealPropertyValue.h"
#import "../../interface/internal/SGFCRealPropertyValueInternalAdditions.h"
#import "../../interface/internal/SGFCSinglePropertyValueInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcPropertyValueFactory.h>
#import <libsgfcplusplus/ISgfcRealPropertyValue.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

#pragma mark - Class extension

@interface SGFCRealPropertyValue()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcRealPropertyValue> _wrappedRealPropertyValue;
}
@end

@implementation SGFCRealPropertyValue

#pragma mark - Initialization and deallocation

+ (instancetype) realPropertyValueWithRealValue:(SGFCReal)realValue
{
  return [[self alloc] initWithRealValue:realValue];
}

- (instancetype) initWithRawValue:(NSString*)rawValue
{
  // TODO Attempt to convert to an SGFCReal
  return [self initWithRealValue:0.0];
}

- (instancetype) initWithRealValue:(SGFCReal)realValue
{
  // Create the actual wrapped object so that we can take the raw value from it.
  // Don't assign it to the member variable yet in case the superclass
  // initializer has a problem.
  auto wrappedRealPropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateRealPropertyValue(
    [SGFCMappingUtility fromSgfcKitReal:realValue]);

  // Call designated initializer of superclass (SGFCSinglePropertyValue).
  // The superclass creates a useless wrapped object which we are going to
  // overwrite in a moment.
  self = [super initWithRawValue:[SGFCMappingUtility toSgfcKitString:wrappedRealPropertyValue->GetRawValue()]];
  if (! self)
    return nil;

  _wrappedRealPropertyValue = wrappedRealPropertyValue;

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object.
  [self setWrappedSinglePropertyValue:_wrappedRealPropertyValue];

  return self;
}

- (instancetype) initWithWrappedRealPropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcRealPropertyValue>)wrappedRealPropertyValue
{
  if (wrappedRealPropertyValue == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedRealPropertyValue\" is nullptr"];

  self = [self initWithRealValue:0.0];
  if (! self)
    return nil;

  _wrappedRealPropertyValue = wrappedRealPropertyValue;

  [self setWrappedSinglePropertyValue:_wrappedRealPropertyValue];

  return self;
}

- (void) dealloc
{
  _wrappedRealPropertyValue = nullptr;
}

#pragma mark - SGFCSinglePropertyValue overrides

- (SGFCRealPropertyValue*) toRealValue
{
  return self;
}

#pragma mark - Public API

- (SGFCReal) realValue
{
  try
  {
    return [SGFCMappingUtility toSgfcKitReal:_wrappedRealPropertyValue->GetRealValue()];
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseInvalidOperationExceptionWithCStringReason:exception.what()];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return 0.0;
  }
}

#pragma mark - Internal API - SGFCRealPropertyValueInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcRealPropertyValue>) wrappedRealPropertyValue
{
  return _wrappedRealPropertyValue;
}

@end
