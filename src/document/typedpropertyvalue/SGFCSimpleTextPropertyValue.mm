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
#import "../../../include/SGFCSimpleTextPropertyValue.h"
#import "../../interface/internal/SGFCSinglePropertyValueInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcPropertyValueFactory.h>
#import <libsgfcplusplus/ISgfcSimpleTextPropertyValue.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

// System includes
#import <Foundation/NSString.h>

#pragma mark - Class extension

@interface SGFCSimpleTextPropertyValue()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcSimpleTextPropertyValue> _wrappedSimpleTextPropertyValue;
}
@end

@implementation SGFCSimpleTextPropertyValue

#pragma mark - Initialization and deallocation

+ (SGFCSimpleTextPropertyValue*) simpleTextPropertyValueWithSimpleTextValue:(NSString*)simpleTextValue
{
  return [[SGFCSimpleTextPropertyValue alloc] initWithSimpleTextValue:simpleTextValue];
}

- (id) initWithSimpleTextValue:(NSString*)simpleTextValue
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:simpleTextValue
                                                 invalidArgumentName:@"simpleTextValue"];

  // Create the actual wrapped object so that we can take the raw value from it.
  // Don't assign it to the member variable yet in case the superclass
  // initializer has a problem.
  auto wrappedSimpleTextPropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateSimpleTextPropertyValue(
    [SGFCMappingUtility fromSgfcKitString:simpleTextValue]);

  // Call designated initializer of superclass (SGFCSinglePropertyValue).
  // The superclass creates a useless wrapped object which we are going to
  // overwrite in a moment.
  self = [super initWithRawValue:[SGFCMappingUtility toSgfcKitString:wrappedSimpleTextPropertyValue->GetRawValue()]];
  if (! self)
    return nil;

  _wrappedSimpleTextPropertyValue = wrappedSimpleTextPropertyValue;

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object.
  [self setWrappedSinglePropertyValue:_wrappedSimpleTextPropertyValue];

  return self;
}

- (void) dealloc
{
  _wrappedSimpleTextPropertyValue = nullptr;
}

#pragma mark - SGFCSinglePropertyValue overrides

- (SGFCSimpleTextPropertyValue*) toSimpleTextValue
{
  return self;
}

#pragma mark - Public API

- (NSString*) simpleTextValue
{
  try
  {
    return [SGFCMappingUtility toSgfcKitString:_wrappedSimpleTextPropertyValue->GetSimpleTextValue()];
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseInvalidOperationExceptionWithCStringReason:exception.what()];
  }
}

@end
