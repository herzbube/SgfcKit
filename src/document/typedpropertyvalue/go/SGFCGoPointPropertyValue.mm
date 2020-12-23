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
#import "../../../../include/SGFCGoPointPropertyValue.h"
#import "../../../interface/internal/SGFCGoPointPropertyValueInternalAdditions.h"
#import "../../../interface/internal/SGFCPointPropertyValueInternalAdditions.h"
#import "../../../SGFCExceptionUtility.h"
#import "../../../SGFCMappingUtility.h"
#import "../../../SGFCWrappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcGoPointPropertyValue.h>
#import <libsgfcplusplus/ISgfcPropertyValueFactory.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

#pragma mark - Class extension

@interface SGFCGoPointPropertyValue()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcGoPointPropertyValue> _wrappedGoPointPropertyValue;
}

@property(nonatomic, strong, readwrite) SGFCGoPoint* goPoint;

@end

@implementation SGFCGoPointPropertyValue

#pragma mark - Initialization and deallocation

+ (instancetype) goPointPropertyValueWithGoPointValue:(NSString*)pointValue
                                            boardSize:(SGFCBoardSize)boardSize
{
  return [[self alloc] initWithGoPointValue:pointValue
                                  boardSize:boardSize];
}

- (instancetype) initWithPointValue:(NSString*)pointValue
{
  // We assume that pointValue is at least given in one of the allowed
  // notations. The maximum board size is the only choice we have to avoid an
  // exception being raised because the point refers to an invalid location
  // on the board.
  return [self initWithGoPointValue:pointValue
                          boardSize:SGFCBoardSizeMaximumGo];
}

- (instancetype) initWithGoPointValue:(NSString*)pointValue
                            boardSize:(SGFCBoardSize)boardSize
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:pointValue
                                                 invalidArgumentName:@"pointValue"];

  // Create the actual wrapped object so that we can take the raw value from it.
  // Don't assign it to the member variable yet in case the superclass
  // initializer has a problem.
  auto wrappedGoPointPropertyValue = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreatePropertyValueFactory()->CreateGoPointPropertyValue(
    [SGFCMappingUtility fromSgfcKitPoint:pointValue],
    [SGFCMappingUtility fromSgfcKitBoardSize:boardSize]);

  // Call designated initializer of superclass (SGFCPointPropertyValue).
  // The superclass creates a useless wrapped object which we are going to
  // overwrite in a moment.
  self = [super initWithPointValue:[SGFCMappingUtility toSgfcKitPoint:wrappedGoPointPropertyValue->GetPointValue()]];
  if (! self)
    return nil;

  _wrappedGoPointPropertyValue = wrappedGoPointPropertyValue;
  self.goPoint = [SGFCWrappingUtility wrapGoPoint:_wrappedGoPointPropertyValue->GetGoPoint()];

  // Overwrite the useless wrapped object that the superclass
  // initializer created with the real wrapped object.
  [self setWrappedPointPropertyValue:_wrappedGoPointPropertyValue];

  return self;
}

- (instancetype) initWithWrappedGoPointPropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoPointPropertyValue>)wrappedGoPointPropertyValue
{
  if (wrappedGoPointPropertyValue == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedGoPointPropertyValue\" is nullptr"];

  self = [self initWithGoPointValue:@"aa"
                          boardSize:SGFCBoardSizeMaximumGo];
  if (! self)
    return nil;

  _wrappedGoPointPropertyValue = wrappedGoPointPropertyValue;

  auto wrappedGoPoint = _wrappedGoPointPropertyValue->GetGoPoint();
  if (wrappedGoPoint)
    self.goPoint = [SGFCWrappingUtility wrapGoPoint:_wrappedGoPointPropertyValue->GetGoPoint()];
  else
    self.goPoint = nil;
  [self setWrappedPointPropertyValue:_wrappedGoPointPropertyValue];

  return self;
}

- (void) dealloc
{
  _wrappedGoPointPropertyValue = nullptr;
  self.goPoint = nil;
}

#pragma mark - SGFCPointPropertyValue overrides

- (SGFCGoPointPropertyValue*) toGoPointValue
{
  return self;
}

#pragma mark - Internal API - SGFCGoPointPropertyValueInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcGoPointPropertyValue>) wrappedGoPointPropertyValue
{
  return _wrappedGoPointPropertyValue;
}

@end
