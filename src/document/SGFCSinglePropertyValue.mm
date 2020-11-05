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
#import "../../include/SGFCSinglePropertyValue.h"
#import "../interface/internal/SGFCSinglePropertyValueInternalAdditions.h"
#import "../SGFCExceptionUtility.h"
#import "../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcPropertyValueFactory.h>
#import <libsgfcplusplus/ISgfcSinglePropertyValue.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

#pragma mark - Class extension

@interface SGFCSinglePropertyValue()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcSinglePropertyValue> _wrappedSinglePropertyValue;
}

@property(nonatomic, getter=isComposedValue) BOOL composedValue;

@end

@implementation SGFCSinglePropertyValue

#pragma mark - Initialization and deallocation

+ (SGFCSinglePropertyValue*) singlePropertyValueWithRawValue:(NSString*)rawValue
{
  return [[SGFCSinglePropertyValue alloc] initWithRawValue:rawValue];
}

- (instancetype) init
{
  return [self initWithRawValue:@""];
}

- (instancetype) initWithRawValue:(NSString*)rawValue
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:rawValue
                                                 invalidArgumentName:@"rawValue"];

  _wrappedSinglePropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateCustomPropertyValue(
    [SGFCMappingUtility fromSgfcKitString:rawValue]);
  self.composedValue = false;

  return self;
}

- (instancetype) initWithWrappedSinglePropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcSinglePropertyValue>)wrappedSinglePropertyValue
{
  if (wrappedSinglePropertyValue == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedSinglePropertyValue\" is nullptr"];

  self = [self init];
  if (! self)
    return nil;

  _wrappedSinglePropertyValue = wrappedSinglePropertyValue;

  return self;
}

- (void) dealloc
{
  _wrappedSinglePropertyValue = nullptr;
}

#pragma mark - SGFCPropertyValue overrides

- (SGFCSinglePropertyValue*) toSingleValue
{
  return self;
}

- (SGFCComposedPropertyValue*) toComposedValue
{
  return nil;
}

#pragma mark - Public API

- (SGFCPropertyValueType) valueType
{
  return [SGFCMappingUtility toSgfcKitPropertyValueType:_wrappedSinglePropertyValue->GetValueType()];
}

- (BOOL) hasTypedValue
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedSinglePropertyValue->HasTypedValue()];
}

- (NSString*) typeConversionErrorMessage
{
  return [SGFCMappingUtility toSgfcKitString:_wrappedSinglePropertyValue->GetTypeConversionErrorMessage()];
}

- (NSString*) rawValue
{
  return [SGFCMappingUtility toSgfcKitString:_wrappedSinglePropertyValue->GetRawValue()];
}

- (SGFCNumberPropertyValue*) toNumberValue
{
  return nil;
}

- (SGFCRealPropertyValue*) toRealValue
{
  return nil;
}

- (SGFCDoublePropertyValue*) toDoubleValue
{
  return nil;
}

- (SGFCColorPropertyValue*) toColorValue
{
  return nil;
}

- (SGFCSimpleTextPropertyValue*) toSimpleTextValue
{
  return nil;
}

- (SGFCTextPropertyValue*) toTextValue
{
  return nil;
}

- (SGFCPointPropertyValue*) toPointValue
{
  return nil;
}

- (SGFCMovePropertyValue*) toMoveValue
{
  return nil;
}

- (SGFCStonePropertyValue*) toStoneValue
{
  return nil;
}

#pragma mark - Internal API - SGFCPropertyValueInternal overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcPropertyValue>) wrappedPropertyValue
{
  return _wrappedSinglePropertyValue;
}

#pragma mark - Internal API - SGFCSinglePropertyValueInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcSinglePropertyValue>) wrappedSinglePropertyValue
{
  return _wrappedSinglePropertyValue;
}

- (void) setWrappedSinglePropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcSinglePropertyValue>)wrappedSinglePropertyValue
{
  if (wrappedSinglePropertyValue == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedSinglePropertyValue\" is nullptr"];

  _wrappedSinglePropertyValue = wrappedSinglePropertyValue;
}

@end
