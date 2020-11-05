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
#import "../../../../include/SGFCGoStonePropertyValue.h"
#import "../../../interface/internal/SGFCGoStonePropertyValueInternalAdditions.h"
#import "../../../interface/internal/SGFCStonePropertyValueInternalAdditions.h"
#import "../../../SGFCExceptionUtility.h"
#import "../../../SGFCMappingUtility.h"
#import "../../../SGFCWrappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcGoStonePropertyValue.h>
#import <libsgfcplusplus/ISgfcPropertyValueFactory.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

#pragma mark - Class extension

@interface SGFCGoStonePropertyValue()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcGoStonePropertyValue> _wrappedGoStonePropertyValue;
}

@property(nonatomic, strong, readwrite) SGFCGoStone* goStone;

@end

@implementation SGFCGoStonePropertyValue

#pragma mark - Initialization and deallocation

+ (SGFCGoStonePropertyValue*) goStonePropertyValueWithGoStoneValue:(NSString*)stoneValue
                                                         boardSize:(SGFCBoardSize)boardSize
                                                             color:(SGFCColor)color
{
  return [[SGFCGoStonePropertyValue alloc] initWithGoStoneValue:stoneValue
                                                      boardSize:boardSize
                                                          color:color];
}

+ (SGFCGoStonePropertyValue*) goStonePropertyValueWithGoStoneValue:(NSString*)stoneValue
                                                             color:(SGFCColor)color
{
  return [[SGFCGoStonePropertyValue alloc] initWithGoStoneValue:stoneValue
                                                          color:color];
}

- (instancetype) initWithStoneValue:(NSString*)stoneValue
{
  return [self initWithGoStoneValue:stoneValue
                              color:SGFCColorBlack];
}

- (instancetype) initWithGoStoneValue:(NSString*)stoneValue
                            boardSize:(SGFCBoardSize)boardSize
                                color:(SGFCColor)color
{
  self = [self initWithGoStoneValue:stoneValue
                              color:color];

  _wrappedGoStonePropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateGoStonePropertyValue(
    [SGFCMappingUtility fromSgfcKitString:stoneValue],
    [SGFCMappingUtility fromSgfcKitBoardSize:boardSize],
    [SGFCMappingUtility fromSgfcKitColor:color]);
  self.goStone = [SGFCWrappingUtility wrapGoStone:_wrappedGoStonePropertyValue->GetGoStone()];

  [self setWrappedStonePropertyValue:_wrappedGoStonePropertyValue];

  return self;
}

- (instancetype) initWithGoStoneValue:(NSString*)stoneValue
                                color:(SGFCColor)color
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:stoneValue
                                                 invalidArgumentName:@"stoneValue"];

  // Create the actual wrapped object so that we can take the raw value from it.
  // Don't assign it to the member variable yet in case the superclass
  // initializer has a problem.
  auto wrappedGoStonePropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateGoStonePropertyValue(
    [SGFCMappingUtility fromSgfcKitString:stoneValue],
    [SGFCMappingUtility fromSgfcKitColor:color]);

  // Call designated initializer of superclass (SGFCStonePropertyValue).
  // The superclass creates a useless wrapped object which we are going to
  // overwrite in a moment.
  self = [super initWithStoneValue:[SGFCMappingUtility toSgfcKitString:wrappedGoStonePropertyValue->GetRawStoneValue()]];
  if (! self)
    return nil;

  _wrappedGoStonePropertyValue = wrappedGoStonePropertyValue;
  self.goStone = [SGFCWrappingUtility wrapGoStone:_wrappedGoStonePropertyValue->GetGoStone()];

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object.
  [self setWrappedStonePropertyValue:_wrappedGoStonePropertyValue];

  return self;
}

- (instancetype) initWithWrappedGoStonePropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoStonePropertyValue>)wrappedGoStonePropertyValue
{
  if (wrappedGoStonePropertyValue == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedGoStonePropertyValue\" is nullptr"];

  self = [self initWithGoStoneValue:@""
                              color:SGFCColorBlack];
  if (! self)
    return nil;

  _wrappedGoStonePropertyValue = wrappedGoStonePropertyValue;

  self.goStone = [SGFCWrappingUtility wrapGoStone:_wrappedGoStonePropertyValue->GetGoStone()];
  [self setWrappedStonePropertyValue:_wrappedGoStonePropertyValue];

  return self;
}

- (void) dealloc
{
  _wrappedGoStonePropertyValue = nullptr;
  self.goStone = nil;
}

#pragma mark - SGFCStonePropertyValue overrides

- (SGFCGoStonePropertyValue*) toGoStoneValue
{
  return self;
}

#pragma mark - Internal API - SGFCGoStonePropertyValueInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcGoStonePropertyValue>) wrappedGoStonePropertyValue
{
  return _wrappedGoStonePropertyValue;
}

@end
