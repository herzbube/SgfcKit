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
#import "../interface/internal/SGFCPropertyValueInternalAdditions.h"
#import "../SGFCExceptionUtility.h"
#import "../SGFCMappingUtility.h"

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

+ (SGFCProperty*) propertyWithType:(SGFCPropertyType)propertyType
{
  return [[SGFCProperty alloc] initWithPropertyType:propertyType];
}

+ (SGFCProperty*) propertyWithType:(SGFCPropertyType)propertyType
                             value:(SGFCPropertyValue*)propertyValue
{
  return [[SGFCProperty alloc] initWithPropertyType:propertyType
                                              value:propertyValue];
}

+ (SGFCProperty*) propertyWithType:(SGFCPropertyType)propertyType
                            values:(NSArray*)propertyValues
{
  return [[SGFCProperty alloc] initWithPropertyType:propertyType
                                             values:propertyValues];
}

+ (SGFCProperty*) propertyWithName:(NSString*)propertyName
{
  return [[SGFCProperty alloc] initWithPropertyName:propertyName];
}

+ (SGFCProperty*) propertyWithName:(NSString*)propertyName
                             value:(SGFCPropertyValue*)propertyValue
{
  return [[SGFCProperty alloc] initWithPropertyName:propertyName
                                              value:propertyValue];
}

+ (SGFCProperty*) propertyWithName:(NSString*)propertyName
                            values:(NSArray*)propertyValues
{
  return [[SGFCProperty alloc] initWithPropertyName:propertyName
                                             values:propertyValues];
}

- (id) init
{
  return [self initWithPropertyType:SGFCPropertyTypeC];
}

- (id) initWithPropertyType:(SGFCPropertyType)propertyType
{
  return [self initWithPropertyName:[SGFCProperty propertyNameForPropertyType:propertyType]];
}

- (id) initWithPropertyType:(SGFCPropertyType)propertyType
                      value:(SGFCPropertyValue*)propertyValue
{
  return [self initWithPropertyName:[SGFCProperty propertyNameForPropertyType:propertyType]
                              value:propertyValue];
}

- (id) initWithPropertyType:(SGFCPropertyType)propertyType
                     values:(NSArray*)propertyValues
{
  return [self initWithPropertyName:[SGFCProperty propertyNameForPropertyType:propertyType]
                             values:propertyValues];
}

- (id) initWithPropertyName:(NSString*)propertyName;
{
  return [self initWithPropertyName:propertyName
                             values:nil];
}

- (id) initWithPropertyName:(NSString*)propertyName
                      value:(SGFCPropertyValue*)propertyValue
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

- (id) initWithPropertyName:(NSString*)propertyName
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

- (SGFCPropertyValue*) propertyValue
{
  auto wrappedPropertyValue = _wrappedProperty->GetPropertyValue();

  for (SGFCPropertyValue* propertyValue in _propertyValues)
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

#pragma mark - Internal API

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

+ (std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcPropertyValue>>) wrappedPropertyValuesFromArray:(NSArray*)propertyValues
{
  std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcPropertyValue>> wrappedPropertyValues;

  for (id propertyValueObject in propertyValues)
  {
    if (! propertyValueObject)
      [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"propertyValues\" contains a nil object"];
    if (! [propertyValueObject isKindOfClass:[SGFCPropertyValue class]])
      [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"propertyValues\" contains an object that is not of type SGFCPropertyValue"];

    SGFCPropertyValue* propertyValue = propertyValueObject;
    wrappedPropertyValues.push_back([propertyValue wrappedPropertyValue]);
  }

  return wrappedPropertyValues;
}

@end
