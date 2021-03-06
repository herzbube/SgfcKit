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
#import "../../../include/SGFCPointPropertyValue.h"
#import "../../interface/internal/SGFCPointPropertyValueInternalAdditions.h"
#import "../../interface/internal/SGFCSinglePropertyValueInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcPointPropertyValue.h>
#import <libsgfcplusplus/ISgfcPropertyValueFactory.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

// System includes
#import <Foundation/NSString.h>

#pragma mark - Class extension

@interface SGFCPointPropertyValue()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcPointPropertyValue> _wrappedPointPropertyValue;
}
@end

@implementation SGFCPointPropertyValue

#pragma mark - Initialization and deallocation

+ (instancetype) pointPropertyValueWithPointValue:(NSString*)pointValue
{
  return [[self alloc] initWithPointValue:pointValue];
}

- (instancetype) initWithRawValue:(NSString*)rawValue
{
  return [self initWithPointValue:rawValue];
}

- (instancetype) initWithPointValue:(NSString*)pointValue
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:pointValue
                                                 invalidArgumentName:@"pointValue"];

  // Create the actual wrapped object so that we can take the raw value from it.
  // Don't assign it to the member variable yet in case the superclass
  // initializer has a problem.
  auto wrappedPointPropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreatePointPropertyValue(
    [SGFCMappingUtility fromSgfcKitPoint:pointValue]);

  // Call designated initializer of superclass (SGFCSinglePropertyValue).
  // The superclass creates a useless wrapped object which we are going to
  // overwrite in a moment.
  self = [super initWithRawValue:[SGFCMappingUtility toSgfcKitString:wrappedPointPropertyValue->GetRawValue()]];
  if (! self)
    return nil;

  _wrappedPointPropertyValue = wrappedPointPropertyValue;

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object.
  [self setWrappedSinglePropertyValue:_wrappedPointPropertyValue];

  return self;
}

- (instancetype) initWithWrappedPointPropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcPointPropertyValue>)wrappedPointPropertyValue
{
  if (wrappedPointPropertyValue == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedPointPropertyValue\" is nullptr"];

  self = [self initWithPointValue:@""];
  if (! self)
    return nil;

  _wrappedPointPropertyValue = wrappedPointPropertyValue;

  [self setWrappedSinglePropertyValue:_wrappedPointPropertyValue];

  return self;
}

- (void) dealloc
{
  _wrappedPointPropertyValue = nullptr;
}

#pragma mark - SGFCSinglePropertyValue overrides

- (SGFCPointPropertyValue*) toPointValue
{
  return self;
}

#pragma mark - Public API

- (NSString*) pointValue
{
  return [SGFCMappingUtility toSgfcKitPoint:_wrappedPointPropertyValue->GetPointValue()];
}

- (SGFCGoPointPropertyValue*) toGoPointValue
{
  return nil;
}

#pragma mark - Internal API - SGFCPointPropertyValueInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcPointPropertyValue>) wrappedPointPropertyValue
{
  return _wrappedPointPropertyValue;
}

- (void) setWrappedPointPropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcPointPropertyValue>)wrappedPointPropertyValue
{
  if (wrappedPointPropertyValue == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedPointPropertyValue\" is nullptr"];

  [self setWrappedSinglePropertyValue:wrappedPointPropertyValue];
  _wrappedPointPropertyValue = wrappedPointPropertyValue;
}

@end
