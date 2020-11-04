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
#import "../../../include/SGFCTextPropertyValue.h"
#import "../../interface/internal/SGFCSinglePropertyValueInternalAdditions.h"
#import "../../interface/internal/SGFCTextPropertyValueInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcPropertyValueFactory.h>
#import <libsgfcplusplus/ISgfcTextPropertyValue.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

// System includes
#import <Foundation/NSString.h>

#pragma mark - Class extension

@interface SGFCTextPropertyValue()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcTextPropertyValue> _wrappedTextPropertyValue;
}
@end

@implementation SGFCTextPropertyValue

#pragma mark - Initialization and deallocation

+ (SGFCTextPropertyValue*) textPropertyValueWithTextValue:(NSString*)textValue
{
  return [[SGFCTextPropertyValue alloc] initWithTextValue:textValue];
}

- (id) initWithRawValue:(NSString*)rawValue
{
  return [self initWithTextValue:rawValue];
}

- (id) initWithTextValue:(NSString*)textValue
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:textValue
                                                 invalidArgumentName:@"textValue"];

  // Create the actual wrapped object so that we can take the raw value from it.
  // Don't assign it to the member variable yet in case the superclass
  // initializer has a problem.
  auto wrappedTextPropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateTextPropertyValue(
    [SGFCMappingUtility fromSgfcKitString:textValue]);

  // Call designated initializer of superclass (SGFCSinglePropertyValue).
  // The superclass creates a useless wrapped object which we are going to
  // overwrite in a moment.
  self = [super initWithRawValue:[SGFCMappingUtility toSgfcKitString:wrappedTextPropertyValue->GetRawValue()]];
  if (! self)
    return nil;

  _wrappedTextPropertyValue = wrappedTextPropertyValue;

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object.
  [self setWrappedSinglePropertyValue:_wrappedTextPropertyValue];

  return self;
}

- (id) initWithWrappedTextPropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcTextPropertyValue>)wrappedTextPropertyValue
{
  if (wrappedTextPropertyValue == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedTextPropertyValue\" is nullptr"];

  self = [self initWithTextValue:@""];
  if (! self)
    return nil;

  _wrappedTextPropertyValue = wrappedTextPropertyValue;

  [self setWrappedSinglePropertyValue:_wrappedTextPropertyValue];

  return self;
}

- (void) dealloc
{
  _wrappedTextPropertyValue = nullptr;
}

#pragma mark - SGFCSinglePropertyValue overrides

- (SGFCTextPropertyValue*) toTextValue
{
  return self;
}

#pragma mark - Public API

- (NSString*) textValue
{
  try
  {
    return [SGFCMappingUtility toSgfcKitString:_wrappedTextPropertyValue->GetTextValue()];
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseInvalidOperationExceptionWithCStringReason:exception.what()];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return nil;
  }
}

#pragma mark - Internal API - SGFCTextPropertyValueInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcTextPropertyValue>) wrappedTextPropertyValue
{
  return _wrappedTextPropertyValue;
}

@end
