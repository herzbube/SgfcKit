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
#import "../../include/SGFCConstants.h"
#import "../../include/SGFCProperty.h"
#import "../interface/internal/SGFCBoardSizePropertyInternalAdditions.h"
#import "../interface/internal/SGFCGameTypePropertyInternalAdditions.h"
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
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  _wrappedProperty = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyFactory()->CreateProperty(
    [SGFCMappingUtility fromSgfcKitPropertyType:SGFCPropertyTypeC]);
  _propertyValues = [NSArray array];

  return self;
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
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:propertyName
                                                 invalidArgumentName:@"propertyName"];

  self = [self init];
  if (! self)
    return nil;

  // Create the actual wrapped object. Don't assign it to the member variable
  // yet in case we are going to deallocate self.
  std::shared_ptr<LibSgfcPlusPlus::ISgfcProperty> wrappedProperty;
  if (propertyValues == nil)
  {
    wrappedProperty = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyFactory()->CreateProperty(
      [SGFCMappingUtility fromSgfcKitString:propertyName]);
  }
  else
  {
    try
    {
      wrappedProperty = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyFactory()->CreateProperty(
        [SGFCMappingUtility fromSgfcKitString:propertyName],
        [SGFCProperty wrappedPropertyValuesFromArray:propertyValues]);
    }
    catch (std::invalid_argument& exception)
    {
      [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
    }
  }

  if ([propertyName isEqualToString:@"GM"])
  {
    auto wrappedGameTypeProperty = std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcGameTypeProperty>(wrappedProperty);

    // The externally allocated self has the wrong type. We deallocate the
    // object...
    self = nil;

    // ... and allocate a new object that has the correct type. We don't need
    // to assign the wrapped object to the member variable, this is done by
    // initWithWrappedGameTypeProperty:().
    if (propertyValues == nil)
      self = [[SGFCGameTypeProperty alloc] initWithWrappedGameTypeProperty:wrappedGameTypeProperty];
    else
      self = [[SGFCGameTypeProperty alloc] initWithWrappedGameTypeProperty:wrappedGameTypeProperty propertyValues:propertyValues];

  }
  else if ([propertyName isEqualToString:@"SZ"])
  {
    auto wrappedBoardSizeProperty = std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcBoardSizeProperty>(wrappedProperty);

    // The externally allocated self has the wrong type. We deallocate the
    // object...
    self = nil;

    // ... and allocate a new object that has the correct type. We don't need
    // to assign the wrapped object to the member variable, this is done by
    // initWithWrappedBoardSizeProperty:().
    if (propertyValues == nil)
      self = [[SGFCBoardSizeProperty alloc] initWithWrappedBoardSizeProperty:wrappedBoardSizeProperty];
    else
      self = [[SGFCBoardSizeProperty alloc] initWithWrappedBoardSizeProperty:wrappedBoardSizeProperty propertyValues:propertyValues];
  }
  else
  {
    // The externally allocated self has the correct type, so we can simply
    // continue to initialize it
    _wrappedProperty = wrappedProperty;

    if (propertyValues == nil)
      _propertyValues = [NSArray array];
    else
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
  return nil;
}

- (SGFCBoardSizeProperty*) toBoardSizeProperty
{
  return nil;
}

#pragma mark - Internal API - SGFCPropertyInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcProperty>) wrappedProperty
{
  return _wrappedProperty;
}

- (void) setWrappedProperty:(std::shared_ptr<LibSgfcPlusPlus::ISgfcProperty>)wrappedProperty
{
  if (wrappedProperty == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedProperty\" is nullptr"];

  _wrappedProperty = wrappedProperty;
  _propertyValues = [SGFCWrappingUtility wrapPropertyValues:_wrappedProperty->GetPropertyValues()];
}

- (void) setWrappedProperty:(std::shared_ptr<LibSgfcPlusPlus::ISgfcProperty>)wrappedProperty
             propertyValues:(NSArray*)propertyValues
{
  if (wrappedProperty == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedProperty\" is nullptr"];
  if (propertyValues == nil)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"propertyValues\" is nullptr"];

  _wrappedProperty = wrappedProperty;
  _propertyValues = propertyValues;
}

#pragma mark - Private API

+ (NSString*) propertyNameForPropertyType:(SGFCPropertyType)propertyType
{
  if (propertyType == SGFCPropertyTypeUnknown)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"propertyType\" is SGFCPropertyTypeUnknown"];

  NSNumber* propertyTypeAsNumber = @(propertyType);
  NSString* propertyName = SGFCPropertyTypeToPropertyNameMap[propertyTypeAsNumber];
  if (! propertyName)
  {
    NSString* reason = [NSString stringWithFormat:@"SGFCPropertyType value not mapped: %@", propertyTypeAsNumber];
    [SGFCExceptionUtility raiseInternalInconsistencyExceptionWithReason:reason];
  }

  return propertyName;
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
