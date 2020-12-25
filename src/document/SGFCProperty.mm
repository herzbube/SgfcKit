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
#import "../../include/SGFCProperty.h"
#import "../interface/internal/SGFCPropertyInternalAdditions.h"
#import "../interface/internal/SGFCPropertyValueInternal.h"
#import "../SGFCExceptionUtility.h"
#import "../SGFCMappingUtility.h"
#import "../SGFCWrappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcProperty.h>
#import <libsgfcplusplus/ISgfcPropertyFactory.h>
#import <libsgfcplusplus/ISgfcPropertyValue.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

// System includes
#import <Foundation/NSArray.h>

#pragma mark - Class extension

@interface SGFCProperty()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcProperty> _wrappedProperty;
}
@end

@implementation SGFCProperty

#pragma mark - Initialization and deallocation

+ (instancetype) propertyWithType:(SGFCPropertyType)propertyType
{
  return [[self alloc] initWithPropertyType:propertyType];
}

+ (instancetype) propertyWithType:(SGFCPropertyType)propertyType
                            value:(id<SGFCPropertyValue>)propertyValue
{
  return [[self alloc] initWithPropertyType:propertyType
                                      value:propertyValue];
}

+ (instancetype) propertyWithType:(SGFCPropertyType)propertyType
                           values:(NSArray*)propertyValues
{
  return [[self alloc] initWithPropertyType:propertyType
                                     values:propertyValues];
}

+ (instancetype) propertyWithName:(NSString*)propertyName
{
  return [[self alloc] initWithPropertyName:propertyName];
}

+ (instancetype) propertyWithName:(NSString*)propertyName
                            value:(id<SGFCPropertyValue>)propertyValue
{
  return [[self alloc] initWithPropertyName:propertyName
                                      value:propertyValue];
}

+ (instancetype) propertyWithName:(NSString*)propertyName
                           values:(NSArray*)propertyValues
{
  return [[self alloc] initWithPropertyName:propertyName
                                     values:propertyValues];
}

- (instancetype) init
{
  return [self initWithPropertyType:SGFCPropertyTypeC];
}

- (instancetype) initWithPropertyType:(SGFCPropertyType)propertyType
{
  return [self initWithPropertyName:[SGFCProperty propertyNameForPropertyType:propertyType]];
}

- (instancetype) initWithPropertyType:(SGFCPropertyType)propertyType
                                value:(id<SGFCPropertyValue>)propertyValue
{
  return [self initWithPropertyName:[SGFCProperty propertyNameForPropertyType:propertyType]
                              value:propertyValue];
}

- (instancetype) initWithPropertyType:(SGFCPropertyType)propertyType
                               values:(NSArray*)propertyValues
{
  return [self initWithPropertyName:[SGFCProperty propertyNameForPropertyType:propertyType]
                             values:propertyValues];
}

- (instancetype) initWithPropertyName:(NSString*)propertyName;
{
  return [self initWithPropertyName:propertyName
                             values:nil];
}

- (instancetype) initWithPropertyName:(NSString*)propertyName
                                value:(id<SGFCPropertyValue>)propertyValue
{
  if (propertyValue)
  {
    return [self initWithPropertyName:propertyName
                               values:[NSArray arrayWithObject:propertyValue]];
  }
  else
  {
    return [self initWithPropertyName:propertyName
                               values:nil];
  }
}

- (instancetype) initWithPropertyName:(NSString*)propertyName
                               values:(NSArray*)propertyValues
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:propertyName
                                                 invalidArgumentName:@"propertyName"];

  if (propertyValues == nil)
  {
    _wrappedProperty = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyFactory()->CreateProperty(
      [SGFCMappingUtility fromSgfcKitString:propertyName]);

    _propertyValues = [NSArray array];
  }
  else
  {
    try
    {
      _wrappedProperty = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyFactory()->CreateProperty(
        [SGFCMappingUtility fromSgfcKitString:propertyName],
        [SGFCProperty wrappedPropertyValuesFromArray:propertyValues]);
    }
    catch (std::invalid_argument& exception)
    {
      [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
    }

    _propertyValues = propertyValues;
  }

  return self;
}

- (instancetype) initWithWrappedProperty:(std::shared_ptr<LibSgfcPlusPlus::ISgfcProperty>)wrappedProperty
{
  if (wrappedProperty == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedProperty\" is nullptr"];

  self = [self init];
  if (! self)
    return nil;

  _wrappedProperty = wrappedProperty;
  _propertyValues = [SGFCWrappingUtility wrapPropertyValues:_wrappedProperty->GetPropertyValues()];

  return self;
}

- (void) dealloc
{
  _wrappedProperty = nullptr;
  // Don't use property accessor because of nil check
  _propertyValues = nil;
}

#pragma mark - Public API

- (SGFCPropertyType) propertyType
{
  return [SGFCMappingUtility toSgfcKitPropertyType:_wrappedProperty->GetPropertyType()];
}

- (NSString*) propertyName
{
  return [SGFCMappingUtility toSgfcKitString:_wrappedProperty->GetPropertyName()];
}

- (SGFCPropertyCategory) propertyCategory
{
  return [SGFCMappingUtility toSgfcKitPropertyCategory:_wrappedProperty->GetPropertyCategory()];
}

- (SGFCPropertyTraits) traits
{
  return [SGFCMappingUtility toSgfcKitPropertyTraits:_wrappedProperty->GetTraits()];
}

- (BOOL) hasTrait:(SGFCPropertyTrait)trait
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedProperty->HasTrait(
    [SGFCMappingUtility fromSgfcKitPropertyTrait:trait])];
}

- (BOOL) hasPropertyValues
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedProperty->HasPropertyValues()];
}

- (void) setPropertyValues:(NSArray*)propertyValues
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:propertyValues
                                                 invalidArgumentName:@"propertyValues"];

  try
  {
    _wrappedProperty->SetPropertyValues(
      [SGFCProperty wrappedPropertyValuesFromArray:propertyValues]);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }

  _propertyValues = propertyValues;
}

- (void) appendPropertyValue:(id<SGFCPropertyValue>)propertyValue
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:propertyValue
                                                 invalidArgumentName:@"propertyValue"];

  try
  {
    _wrappedProperty->AppendPropertyValue([SGFCProperty wrappedPropertyValueFromObject:propertyValue]);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }

  _propertyValues = [SGFCWrappingUtility wrapPropertyValues:_wrappedProperty->GetPropertyValues()];
}

- (void) removePropertyValue:(id<SGFCPropertyValue>)propertyValue
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:propertyValue
                                                 invalidArgumentName:@"propertyValue"];

  try
  {
    _wrappedProperty->RemovePropertyValue([SGFCProperty wrappedPropertyValueFromObject:propertyValue]);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }

  _propertyValues = [SGFCWrappingUtility wrapPropertyValues:_wrappedProperty->GetPropertyValues()];
}

- (void) removeAllPropertyValues
{
  _wrappedProperty->RemoveAllPropertyValues();

  _propertyValues = [NSArray array];
}

- (id<SGFCPropertyValue>) propertyValue
{
  auto wrappedPropertyValue = _wrappedProperty->GetPropertyValue();

  for (id<SGFCPropertyValueInternal> propertyValue in _propertyValues)
  {
    if ([propertyValue wrappedPropertyValue] == wrappedPropertyValue)
      return propertyValue;
  }

  return nil;
}

- (SGFCGameTypeProperty*) toGameTypeProperty
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"toGameTypeProperty"];
  return nil;
}

- (SGFCBoardSizeProperty*) toBoardSizeProperty
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"toBoardSizeProperty"];
  return nil;
}

#pragma mark - Internal API - SGFCPropertyInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcProperty>) wrappedProperty
{
  return _wrappedProperty;
}

#pragma mark - Private API

+ (NSString*) propertyNameForPropertyType:(SGFCPropertyType)propertyType
{
  // This is the only way how we can delegate the mapping to libsgfc++.
  // Although inefficient it's better than duplicating logic.
  auto dummyWrappedProperty = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyFactory()->CreateProperty(
    [SGFCMappingUtility fromSgfcKitPropertyType:propertyType]);
  return [SGFCMappingUtility toSgfcKitString:dummyWrappedProperty->GetPropertyName()];
}

+ (std::shared_ptr<LibSgfcPlusPlus::ISgfcPropertyValue>) wrappedPropertyValueFromObject:(id<SGFCPropertyValue>)propertyValue
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:propertyValue
                                                 invalidArgumentName:@"propertyValue"];

  id propertyValueObject = propertyValue;
  if (! [propertyValueObject conformsToProtocol:@protocol(SGFCPropertyValueInternal)])
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"propertyValueObject\" is an object that does not conform to protocol SGFCPropertyValueInternal"];

  id<SGFCPropertyValueInternal> propertyValueInternal = propertyValueObject;
  return [propertyValueInternal wrappedPropertyValue];
}

+ (std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcPropertyValue>>) wrappedPropertyValuesFromArray:(NSArray*)propertyValues
{
  std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcPropertyValue>> wrappedPropertyValues;

  for (id propertyValueObject in propertyValues)
  {
    if (! propertyValueObject)
      [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"propertyValues\" contains a nil object"];
    if (! [propertyValueObject conformsToProtocol:@protocol(SGFCPropertyValueInternal)])
      [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"propertyValues\" contains an object that does not conform to protocol SGFCPropertyValueInternal"];

    id<SGFCPropertyValueInternal> propertyValue = propertyValueObject;
    wrappedPropertyValues.push_back([propertyValue wrappedPropertyValue]);
  }

  return wrappedPropertyValues;
}

@end
