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
#import "../../../include/SGFCColorPropertyValue.h"
#import "../../interface/internal/SGFCSinglePropertyValueInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcColorPropertyValue.h>
#import <libsgfcplusplus/ISgfcPropertyValueFactory.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

#pragma mark - Class extension

@interface SGFCColorPropertyValue()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcColorPropertyValue> _wrappedColorPropertyValue;
}
@end

@implementation SGFCColorPropertyValue

#pragma mark - Initialization and deallocation

+ (SGFCColorPropertyValue*) colorPropertyValueWithColorValue:(SGFCColor)colorValue
{
  return [[SGFCColorPropertyValue alloc] initWithColorValue:colorValue];
}

- (id) initWithColorValue:(SGFCColor)colorValue
{
  // Create the actual wrapped object so that we can take the raw value from it.
  // Don't assign it to the member variable yet in case the superclass
  // initializer has a problem.
  auto wrappedColorPropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateColorPropertyValue(
    [SGFCMappingUtility fromSgfcKitColor:colorValue]);

  // Call designated initializer of superclass (SGFCSinglePropertyValue).
  // The superclass creates a useless wrapped object which we are going to
  // overwrite in a moment.
  self = [super initWithRawValue:[SGFCMappingUtility toSgfcKitString:wrappedColorPropertyValue->GetRawValue()]];
  if (! self)
    return nil;

  _wrappedColorPropertyValue = wrappedColorPropertyValue;

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object.
  [self setWrappedSinglePropertyValue:_wrappedColorPropertyValue];

  return self;
}

- (void) dealloc
{
  _wrappedColorPropertyValue = nullptr;
}

#pragma mark - Public API

- (SGFCColorPropertyValue*) toColorValue
{
  return self;
}

- (SGFCColor) colorValue
{
  try
  {
    return [SGFCMappingUtility toSgfcKitColor:_wrappedColorPropertyValue->GetColorValue()];
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseInvalidOperationExceptionWithCStringReason:exception.what()];
  }
}

@end
