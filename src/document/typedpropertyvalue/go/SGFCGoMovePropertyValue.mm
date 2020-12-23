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
#import "../../../../include/SGFCConstants.h"
#import "../../../../include/SGFCGoMovePropertyValue.h"
#import "../../../interface/internal/SGFCGoMovePropertyValueInternalAdditions.h"
#import "../../../interface/internal/SGFCMovePropertyValueInternalAdditions.h"
#import "../../../SGFCExceptionUtility.h"
#import "../../../SGFCMappingUtility.h"
#import "../../../SGFCWrappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcGoMovePropertyValue.h>
#import <libsgfcplusplus/ISgfcPropertyValueFactory.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

#pragma mark - Class extension

@interface SGFCGoMovePropertyValue()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcGoMovePropertyValue> _wrappedGoMovePropertyValue;
}

@property(nonatomic, strong, readwrite) SGFCGoMove* goMove;

@end

@implementation SGFCGoMovePropertyValue

#pragma mark - Initialization and deallocation

+ (instancetype) goMovePropertyValueWithGoMoveValue:(NSString*)moveValue
                                          boardSize:(SGFCBoardSize)boardSize
                                              color:(SGFCColor)color
{
  return [[self alloc] initWithGoMoveValue:moveValue
                                 boardSize:boardSize
                                     color:color];
}

+ (instancetype) goMovePropertyValueWithColor:(SGFCColor)color
{
  return [[self alloc] initWithColor:color];
}

- (instancetype) initWithMoveValue:(NSString*)moveValue
{
  // We assume that moveValue is at least given in one of the allowed
  // notations. The maximum board size is the only choice we have to avoid an
  // exception being raised because the move refers to an invalid location
  // on the board.
  return [self initWithGoMoveValue:moveValue
                         boardSize:SGFCBoardSizeMaximumGo
                             color:SGFCColorBlack];
}

- (instancetype) initWithGoMoveValue:(NSString*)moveValue
                           boardSize:(SGFCBoardSize)boardSize
                               color:(SGFCColor)color
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:moveValue
                                                 invalidArgumentName:@"moveValue"];

  self = [self initWithColor:color];

  _wrappedGoMovePropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateGoMovePropertyValue(
    [SGFCMappingUtility fromSgfcKitMove:moveValue],
    [SGFCMappingUtility fromSgfcKitBoardSize:boardSize],
    [SGFCMappingUtility fromSgfcKitColor:color]);
  self.goMove = [SGFCWrappingUtility wrapGoMove:_wrappedGoMovePropertyValue->GetGoMove()];

  [self setWrappedMovePropertyValue:_wrappedGoMovePropertyValue];

  return self;
}

- (instancetype) initWithColor:(SGFCColor)color
{
  // Create the actual wrapped object so that we can take the raw value from it.
  // Don't assign it to the member variable yet in case the superclass
  // initializer has a problem.
  auto wrappedGoMovePropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateGoMovePropertyValue(
    [SGFCMappingUtility fromSgfcKitColor:color]);

  // Call designated initializer of superclass (SGFCMovePropertyValue).
  // The superclass creates a useless wrapped object which we are going to
  // overwrite in a moment.
  self = [super initWithMoveValue:[SGFCMappingUtility toSgfcKitMove:wrappedGoMovePropertyValue->GetMoveValue()]];
  if (! self)
    return nil;

  _wrappedGoMovePropertyValue = wrappedGoMovePropertyValue;
  self.goMove = [SGFCWrappingUtility wrapGoMove:_wrappedGoMovePropertyValue->GetGoMove()];

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object.
  [self setWrappedMovePropertyValue:_wrappedGoMovePropertyValue];

  return self;
}

- (instancetype) initWithWrappedGoMovePropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoMovePropertyValue>)wrappedGoMovePropertyValue
{
  if (wrappedGoMovePropertyValue == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedGoMovePropertyValue\" is nullptr"];

  self = [self initWithColor:SGFCColorBlack];
  if (! self)
    return nil;

  _wrappedGoMovePropertyValue = wrappedGoMovePropertyValue;

  self.goMove = [SGFCWrappingUtility wrapGoMove:_wrappedGoMovePropertyValue->GetGoMove()];
  [self setWrappedMovePropertyValue:_wrappedGoMovePropertyValue];

  return self;
}

- (void) dealloc
{
  _wrappedGoMovePropertyValue = nullptr;
  self.goMove = nil;
}

#pragma mark - SGFCStonePropertyValue overrides

- (SGFCGoMovePropertyValue*) toGoMoveValue
{
  return self;
}

#pragma mark - Internal API - SGFCGoMovePropertyValueInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcGoMovePropertyValue>) wrappedGoMovePropertyValue
{
  return _wrappedGoMovePropertyValue;
}

@end
