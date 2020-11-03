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
#import "../../../include/SGFCConstants.h"
#import "../../../include/SGFCDoublePropertyValue.h"
#import "../../interface/internal/SGFCSinglePropertyValueInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcDoublePropertyValue.h>
#import <libsgfcplusplus/ISgfcPropertyValueFactory.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

// System includes
#import <Foundation/NSString.h>

#pragma mark - Class extension

@interface SGFCDoublePropertyValue()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcDoublePropertyValue> _wrappedDoublePropertyValue;
}
@end

@implementation SGFCDoublePropertyValue

#pragma mark - Initialization and deallocation

+ (SGFCDoublePropertyValue*) doublePropertyValueWithDoubleValue:(SGFCDouble)doubleValue
{
  return [[SGFCDoublePropertyValue alloc] initWithDoubleValue:doubleValue];
}

- (id) initWithRawValue:(NSString*)rawValue
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:rawValue
                                                 invalidArgumentName:@"rawValue"];

  SGFCDouble doubleValue;
  if ([rawValue isEqualToString:SGFCDoubleNormalString])
    doubleValue = SGFCDoubleNormal;
  else if ([rawValue isEqualToString:SGFCDoubleEmphasizedString])
    doubleValue = SGFCDoubleEmphasized;
  else
    doubleValue = SGFCDoubleNormal;

  return [self initWithDoubleValue:doubleValue];
}

- (id) initWithDoubleValue:(SGFCDouble)doubleValue
{
  // Create the actual wrapped object so that we can take the raw value from it.
  // Don't assign it to the member variable yet in case the superclass
  // initializer has a problem.
  auto wrappedDoublePropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateDoublePropertyValue(
    [SGFCMappingUtility fromSgfcKitDouble:doubleValue]);

  // Call designated initializer of superclass (SGFCSinglePropertyValue).
  // The superclass creates a useless wrapped object which we are going to
  // overwrite in a moment.
  self = [super initWithRawValue:[SGFCMappingUtility toSgfcKitString:wrappedDoublePropertyValue->GetRawValue()]];
  if (! self)
    return nil;

  _wrappedDoublePropertyValue = wrappedDoublePropertyValue;

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object.
  [self setWrappedSinglePropertyValue:_wrappedDoublePropertyValue];

  return self;
}

- (void) dealloc
{
  _wrappedDoublePropertyValue = nullptr;
}

#pragma mark - SGFCSinglePropertyValue overrides

- (SGFCDoublePropertyValue*) toDoubleValue
{
  return self;
}

#pragma mark - Public API

- (SGFCDouble) doubleValue
{
  try
  {
    return [SGFCMappingUtility toSgfcKitDouble:_wrappedDoublePropertyValue->GetDoubleValue()];
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseInvalidOperationExceptionWithCStringReason:exception.what()];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return SGFCDoubleNormal;
  }
}

@end
