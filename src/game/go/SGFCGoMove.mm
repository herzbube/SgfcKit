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
#import "../../../include/SGFCGoMove.h"
#import "../../interface/internal/SGFCGoMoveInternalAdditions.h"
#import "../../interface/internal/SGFCGoStoneInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcGoMove.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

#pragma mark - Class extension

@interface SGFCGoMove()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcGoMove> _wrappedGoMove;
}

@property(nonatomic, strong, readwrite) SGFCGoStone* stone;

@end

@implementation SGFCGoMove

#pragma mark - Initialization and deallocation

- (id) init
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  // Always raising an exception is intended. This guards against the library
  // client attempting to manually allocate/initialize an SGFCGoMove.
  [SGFCExceptionUtility raiseInvalidOperationExceptionWithReason:@"SGFCGoMove cannot be instantiated from outside of the library"];
}

- (id) initWithWrappedGoMove:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoMove>)wrappedGoMove;
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  if (wrappedGoMove == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedGoMove\" is nullptr"];

  _wrappedGoMove = wrappedGoMove;

  auto wrappedStone = _wrappedGoMove->GetStone();
  if (wrappedStone == nullptr)
    self.stone = nil;
  else
    self.stone = [[SGFCGoStone alloc] initWithWrappedGoStone:wrappedStone];

  return self;
}

- (void) dealloc
{
  _wrappedGoMove = nullptr;
  self.stone = nil;
}

#pragma mark - Public API

- (BOOL) isPassMove
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedGoMove->IsPassMove()];
}

- (SGFCColor) playerColor
{
  return [SGFCMappingUtility toSgfcKitColor:_wrappedGoMove->GetPlayerColor()];
}

- (SGFCGoPoint*) stoneLocation
{
  if (_stone)
    return _stone.location;
  else
    return nil;
}

@end
