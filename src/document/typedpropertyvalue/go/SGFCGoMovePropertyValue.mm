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

+ (SGFCGoMovePropertyValue*) goMovePropertyValueWithGoMoveValue:(NSString*)moveValue
                                                      boardSize:(SGFCBoardSize)boardSize
                                                          color:(SGFCColor)color
{
  return [[SGFCGoMovePropertyValue alloc] initWithGoMoveValue:moveValue
                                                    boardSize:boardSize
                                                        color:color];
}

+ (SGFCGoMovePropertyValue*) goMovePropertyValueWithGoMoveValue:(NSString*)moveValue
                                                          color:(SGFCColor)color
{
  return [[SGFCGoMovePropertyValue alloc] initWithGoMoveValue:moveValue
                                                        color:color];
}

+ (SGFCGoMovePropertyValue*) goMovePropertyValueWithColor:(SGFCColor)color
{
  return [[SGFCGoMovePropertyValue alloc] initWithColor:color];
}

- (id) initWithMoveValue:(NSString*)moveValue
{
  return [self initWithGoMoveValue:moveValue
                             color:SGFCColorBlack];
}

- (id) initWithGoMoveValue:(NSString*)moveValue
                 boardSize:(SGFCBoardSize)boardSize
                     color:(SGFCColor)color
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:moveValue
                                                 invalidArgumentName:@"moveValue"];

  self = [self initWithColor:color];

  _wrappedGoMovePropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateGoMovePropertyValue(
    [SGFCMappingUtility fromSgfcKitString:moveValue],
    [SGFCMappingUtility fromSgfcKitBoardSize:boardSize],
    [SGFCMappingUtility fromSgfcKitColor:color]);
  self.goMove = [SGFCWrappingUtility wrapGoMove:_wrappedGoMovePropertyValue->GetGoMove()];

  [self setWrappedMovePropertyValue:_wrappedGoMovePropertyValue];

  return self;
}

- (id) initWithGoMoveValue:(NSString*)moveValue
                     color:(SGFCColor)color
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:moveValue
                                                 invalidArgumentName:@"moveValue"];

  self = [self initWithColor:color];

  _wrappedGoMovePropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateGoMovePropertyValue(
    [SGFCMappingUtility fromSgfcKitString:moveValue],
    [SGFCMappingUtility fromSgfcKitColor:color]);
  self.goMove = [SGFCWrappingUtility wrapGoMove:_wrappedGoMovePropertyValue->GetGoMove()];

  [self setWrappedMovePropertyValue:_wrappedGoMovePropertyValue];

  return self;
}

- (id) initWithColor:(SGFCColor)color
{
  // Create the actual wrapped object so that we can take the raw value from it.
  // Don't assign it to the member variable yet in case the superclass
  // initializer has a problem.
  auto wrappedGoMovePropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateGoMovePropertyValue(
    [SGFCMappingUtility fromSgfcKitColor:color]);

  // Call designated initializer of superclass (SGFCMovePropertyValue).
  // The superclass creates a useless wrapped object which we are going to
  // overwrite in a moment.
  self = [super initWithMoveValue:[SGFCMappingUtility toSgfcKitString:wrappedGoMovePropertyValue->GetRawMoveValue()]];
  if (! self)
    return nil;

  _wrappedGoMovePropertyValue = wrappedGoMovePropertyValue;
  self.goMove = [SGFCWrappingUtility wrapGoMove:_wrappedGoMovePropertyValue->GetGoMove()];

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object.
  [self setWrappedMovePropertyValue:_wrappedGoMovePropertyValue];

  return self;
}

- (id) initWithWrappedGoMovePropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoMovePropertyValue>)wrappedGoMovePropertyValue
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
