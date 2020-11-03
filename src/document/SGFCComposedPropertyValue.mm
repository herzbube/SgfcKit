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
#import "../../include/SGFCComposedPropertyValue.h"
#import "../../include/SGFCSinglePropertyValue.h"
#import "../interface/internal/SGFCComposedPropertyValueInternalAdditions.h"
#import "../interface/internal/SGFCSinglePropertyValueInternalAdditions.h"
#import "../SGFCExceptionUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcPropertyValueFactory.h>
#import <libsgfcplusplus/ISgfcComposedPropertyValue.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

#pragma mark - Class extension

@interface SGFCComposedPropertyValue()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcComposedPropertyValue> _wrappedComposedPropertyValue;
}
@property(nonatomic, getter=isComposedValue) BOOL composedValue;
@property(nonatomic, strong, readwrite) SGFCSinglePropertyValue* value1;
@property(nonatomic, strong, readwrite) SGFCSinglePropertyValue* value2;
@end

@implementation SGFCComposedPropertyValue

#pragma mark - Initialization and deallocation

+ (SGFCComposedPropertyValue*) composedPropertyValueWithValue1:(SGFCSinglePropertyValue*)value1
                                                        value2:(SGFCSinglePropertyValue*)value2
{
  return [[SGFCComposedPropertyValue alloc] initWithValue1:value1 value2:value2];
}

- (id) init
{
  return [self initWithValue1:[SGFCSinglePropertyValue singlePropertyValueWithRawValue:@""]
                       value2:[SGFCSinglePropertyValue singlePropertyValueWithRawValue:@""]];
}

- (id) initWithValue1:(SGFCSinglePropertyValue*)value1
               value2:(SGFCSinglePropertyValue*)value2
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:value1
                                                 invalidArgumentName:@"value1"];
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:value2
                                                 invalidArgumentName:@"value2"];

  _wrappedComposedPropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateCustomComposedPropertyValue(
    [value1 wrappedSinglePropertyValue],
    [value2 wrappedSinglePropertyValue]);
  self.composedValue = true;
  self.value1 = value1;
  self.value1 = value2;

  return self;
}

- (void) dealloc
{
  _wrappedComposedPropertyValue = nullptr;
  self.value1 = nil;
  self.value1 = nil;
}

#pragma mark - SGFCPropertyValue overrides

- (SGFCSinglePropertyValue*) toSingleValue
{
  return nil;
}

- (SGFCComposedPropertyValue*) toComposedValue
{
  return self;
}

#pragma mark - Internal API - SGFCPropertyValueInternal overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcPropertyValue>) wrappedPropertyValue
{
  return _wrappedComposedPropertyValue;
}

#pragma mark - Internal API - SGFCComposedPropertyValueInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcComposedPropertyValue>) _wrappedComposedPropertyValue
{
  return _wrappedComposedPropertyValue;
}

@end
