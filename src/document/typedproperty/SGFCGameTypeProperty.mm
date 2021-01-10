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
#import "../../../include/SGFCGameTypeProperty.h"
#import "../../interface/internal/SGFCComposedPropertyValueInternalAdditions.h"
#import "../../interface/internal/SGFCNumberPropertyValueInternalAdditions.h"
#import "../../interface/internal/SGFCPropertyInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcGameTypeProperty.h>
#import <libsgfcplusplus/ISgfcPropertyFactory.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

#pragma mark - Class extension

@interface SGFCGameTypeProperty()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcGameTypeProperty> _wrappedGameTypeProperty;
}
@end

@implementation SGFCGameTypeProperty

#pragma mark - Initialization and deallocation

+ (instancetype) gameTypeProperty
{
  return [[self alloc] init];
}

+ (instancetype) gameTypePropertyWithNumberPropertyValue:(SGFCNumberPropertyValue*)numberPropertyValue;
{
  return [[self alloc] initWithNumberPropertyValue:numberPropertyValue];
}

- (instancetype) init
{
  // Call designated initializer of superclass (SGFCProperty).
  // The superclass creates a useless wrapped object which we are going to
  // overwrite in a moment.
  self = [super init];
  if (! self)
    return nil;

  _wrappedGameTypeProperty = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyFactory()->CreateGameTypeProperty();

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object.
  [self setWrappedProperty:_wrappedGameTypeProperty];

  return self;
}

- (instancetype) initWithNumberPropertyValue:(SGFCNumberPropertyValue*)numberPropertyValue
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:numberPropertyValue
                                                 invalidArgumentName:@"numberPropertyValue"];

  auto wrappedGameTypeProperty = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyFactory()->CreateGameTypeProperty(
    [numberPropertyValue wrappedNumberPropertyValue]);

  self = [self initWithWrappedGameTypeProperty:_wrappedGameTypeProperty
                                propertyValues:[NSArray arrayWithObject:numberPropertyValue]];
  if (! self)
    return nil;

  return self;
}

- (instancetype) initWithWrappedGameTypeProperty:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGameTypeProperty>)wrappedGameTypeProperty
{
  if (wrappedGameTypeProperty == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedGameTypeProperty\" is nullptr"];

  self = [self init];
  if (! self)
    return nil;

  _wrappedGameTypeProperty = wrappedGameTypeProperty;

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object.
  [self setWrappedProperty:_wrappedGameTypeProperty];

  return self;
}

- (instancetype) initWithWrappedGameTypeProperty:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGameTypeProperty>)wrappedGameTypeProperty
                                   propertyValues:(NSArray*)propertyValues
{
  if (wrappedGameTypeProperty == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedGameTypeProperty\" is nullptr"];
  if (propertyValues == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"propertyValues\" is nullptr"];

  self = [self init];
  if (! self)
    return nil;

  _wrappedGameTypeProperty = wrappedGameTypeProperty;

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object. Also preserve the
  // property value wrapper objects that were passed to us.
  [self setWrappedProperty:_wrappedGameTypeProperty
            propertyValues:propertyValues];

  return self;
}

- (void) dealloc
{
  _wrappedGameTypeProperty = nullptr;
}

#pragma mark - SGFCProperty overrides

- (SGFCGameTypeProperty*) toGameTypeProperty
{
  return self;
}

#pragma mark - Public API

- (SGFCGameType) gameType
{
  return [SGFCMappingUtility toSgfcKitGameType:_wrappedGameTypeProperty->GetGameType()];
}

- (SGFCNumber) gameTypeAsNumber
{
  return [SGFCMappingUtility toSgfcKitNumber:_wrappedGameTypeProperty->GetGameTypeAsNumber()];
}

#pragma mark - Internal API - SGFCGameTypePropertyInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcGameTypeProperty>) wrappedGameTypeProperty
{
  return _wrappedGameTypeProperty;
}

@end
