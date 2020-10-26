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
#import "../../include/SGFCGame.h"
#import "../interface/internal/SGFCGameInternalAdditions.h"
#import "../interface/internal/SGFCNodeInternalAdditions.h"
#import "../interface/internal/SGFCTreeBuilderInternalAdditions.h"
#import "../SGFCExceptionUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

#pragma mark - Class extension

@interface SGFCGame()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcGame> _wrappedGame;
}

@property(nonatomic, strong) SGFCTreeBuilder* treeBuilder;

@end

@implementation SGFCGame

#pragma mark - Initialization and deallocation

+ (SGFCGame*) game
{
  return [[SGFCGame alloc] init];
}

+ (SGFCGame*) gameWithRootNode:(SGFCNode*)rootNode
{
  return [[SGFCGame alloc] initWithRootNode:rootNode];
}

- (id) init
{
  return [self initPrivateWithRootNode:nil];
}

- (id) initWithRootNode:(SGFCNode*)rootNode
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:rootNode
                                                 invalidArgumentName:@"rootNode"];

  return [self initPrivateWithRootNode:rootNode];
}

- (id) initPrivateWithRootNode:(SGFCNode*)rootNode
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  if (rootNode == nil)
    _wrappedGame = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreateGame();
  else
    _wrappedGame = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreateGame([rootNode wrappedNode]);

  self.rootNode = rootNode;
  self.treeBuilder = [[SGFCTreeBuilder alloc] initWithGame:self];

  return self;
}

- (void) dealloc
{
  _wrappedGame = nullptr;
  // Don't use property accessor because of nil check
  _rootNode = nil;
  self.treeBuilder = nil;
}

#pragma mark - Public API

- (SGFCGameType) gameType
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"gameType"];
  return SGFCGameTypeUnknown;
}

- (SGFCNumber) gameTypeAsNumber
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"gameType"];
  return 0;
}

- (bool) hasBoardSize
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"gameType"];
  return true;
}

- (SGFCBoardSize) boardSize
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"gameType"];
  return SGFCBoardSizeMinimum;
}

- (bool) hasRootNode
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"gameType"];
  return true;
}

- (SGFCTreeBuilder*) getTreeBuilder
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"gameType"];
  return nil;
}

#pragma mark - Internal API

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcGame>) wrappedGame
{
  return _wrappedGame;
}

@end
