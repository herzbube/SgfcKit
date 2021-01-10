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
#import "../../../include/SGFCBoardSizeProperty.h"
#import "../../interface/internal/SGFCComposedPropertyValueInternalAdditions.h"
#import "../../interface/internal/SGFCNumberPropertyValueInternalAdditions.h"
#import "../../interface/internal/SGFCPropertyInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcBoardSizeProperty.h>
#import <libsgfcplusplus/ISgfcPropertyFactory.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

#pragma mark - Class extension

@interface SGFCBoardSizeProperty()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcBoardSizeProperty> _wrappedBoardSizeProperty;
}
@end

@implementation SGFCBoardSizeProperty

#pragma mark - Initialization and deallocation

+ (instancetype) boardSizeProperty
{
  return [[self alloc] init];
}

+ (instancetype) boardSizePropertyWithNumberPropertyValue:(SGFCNumberPropertyValue*)numberPropertyValue
{
  return [[self alloc] initWithNumberPropertyValue:numberPropertyValue];
}

+ (instancetype) boardSizePropertyWithComposedPropertyValue:(SGFCComposedPropertyValue*)composedPropertyValue
{
  return [[self alloc] initWithComposedPropertyValue:composedPropertyValue];
}

- (instancetype) init
{
  // Call designated initializer of superclass (SGFCProperty).
  // The superclass creates a useless wrapped object which we are going to
  // overwrite in a moment.
  self = [super init];
  if (! self)
    return nil;

  _wrappedBoardSizeProperty = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyFactory()->CreateBoardSizeProperty();

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object.
  [self setWrappedProperty:_wrappedBoardSizeProperty];

  return self;
}

- (instancetype) initWithNumberPropertyValue:(SGFCNumberPropertyValue*)numberPropertyValue
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:numberPropertyValue
                                                 invalidArgumentName:@"numberPropertyValue"];

  auto wrappedBoardSizeProperty = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyFactory()->CreateBoardSizeProperty(
    [numberPropertyValue wrappedNumberPropertyValue]);

  self = [self initWithWrappedBoardSizeProperty:_wrappedBoardSizeProperty
                                 propertyValues:[NSArray arrayWithObject:numberPropertyValue]];
  if (! self)
    return nil;

  return self;
}

- (instancetype) initWithComposedPropertyValue:(SGFCComposedPropertyValue*)composedPropertyValue
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:composedPropertyValue
                                                 invalidArgumentName:@"composedPropertyValue"];

  auto wrappedBoardSizeProperty = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyFactory()->CreateBoardSizeProperty(
    [composedPropertyValue wrappedComposedPropertyValue]);

  self = [self initWithWrappedBoardSizeProperty:_wrappedBoardSizeProperty
                                 propertyValues:[NSArray arrayWithObject:composedPropertyValue]];
  if (! self)
    return nil;

  return self;
}

- (instancetype) initWithWrappedBoardSizeProperty:(std::shared_ptr<LibSgfcPlusPlus::ISgfcBoardSizeProperty>)wrappedBoardSizeProperty
{
  if (wrappedBoardSizeProperty == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedBoardSizeProperty\" is nullptr"];

  self = [self init];
  if (! self)
    return nil;

  _wrappedBoardSizeProperty = wrappedBoardSizeProperty;

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object.
  [self setWrappedProperty:_wrappedBoardSizeProperty];

  return self;
}

- (instancetype) initWithWrappedBoardSizeProperty:(std::shared_ptr<LibSgfcPlusPlus::ISgfcBoardSizeProperty>)wrappedBoardSizeProperty
                                   propertyValues:(NSArray*)propertyValues
{
  if (wrappedBoardSizeProperty == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedBoardSizeProperty\" is nullptr"];
  if (propertyValues == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"propertyValues\" is nullptr"];

  self = [self init];
  if (! self)
    return nil;

  _wrappedBoardSizeProperty = wrappedBoardSizeProperty;

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object. Also preserve the
  // property value wrapper objects that were passed to us.
  [self setWrappedProperty:_wrappedBoardSizeProperty
            propertyValues:propertyValues];

  return self;
}

- (void) dealloc
{
  _wrappedBoardSizeProperty = nullptr;
}

#pragma mark - SGFCProperty overrides

- (SGFCBoardSizeProperty*) toBoardSizeProperty
{
  return self;
}

#pragma mark - Public API

- (SGFCBoardSize) boardSizeForGameType:(SGFCGameType)gameType
{
  return [SGFCMappingUtility toSgfcKitBoardSize:_wrappedBoardSizeProperty->GetBoardSize([
    SGFCMappingUtility fromSgfcKitGameType:gameType])];
}

#pragma mark - Internal API - SGFCBoardSizePropertyInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcBoardSizeProperty>) wrappedBoardSizeProperty
{
  return _wrappedBoardSizeProperty;
}

@end
