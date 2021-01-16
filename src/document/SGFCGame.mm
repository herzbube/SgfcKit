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
#import "../interface/internal/SGFCGameInfoInternalAdditions.h"
#import "../interface/internal/SGFCNodeInternalAdditions.h"
#import "../interface/internal/SGFCTreeBuilderInternalAdditions.h"
#import "../SGFCExceptionUtility.h"
#import "../SGFCMappingUtility.h"
#import "../SGFCWrappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcGame.h>
#import <libsgfcplusplus/ISgfcGoGameInfo.h>
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

+ (instancetype) game
{
  return [[self alloc] init];
}

+ (instancetype) gameWithRootNode:(SGFCNode*)rootNode
{
  return [[self alloc] initWithRootNode:rootNode];
}

- (instancetype) init
{
  SGFCNode* node = [SGFCNode node];
  return [self initWithRootNode:node];
}

- (instancetype) initWithRootNode:(SGFCNode*)rootNode
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  if (rootNode == nil)
    _wrappedGame = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreateGame();
  else
    _wrappedGame = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreateGame([rootNode wrappedNode]);

  _rootNode = rootNode;
  self.treeBuilder = [[SGFCTreeBuilder alloc] initWithGame:self];

  return self;
}

- (instancetype) initWithWrappedGame:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGame>)wrappedGame
{
  if (wrappedGame == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedGame\" is nullptr"];

  self = [self initWithRootNode:nil];
  if (! self)
    return nil;

  _wrappedGame = wrappedGame;

  auto wrappedRootNode = _wrappedGame->GetRootNode();
  if (wrappedRootNode)
    _rootNode = [SGFCWrappingUtility wrapNode:_wrappedGame->GetRootNode()];
  else
    _rootNode = nil;
  self.treeBuilder = [[SGFCTreeBuilder alloc] initWithGame:self];

  return self;
}

- (void) dealloc
{
  _wrappedGame = nullptr;
  // Don't use property accessor because it does stuff with the wrapped object
  _rootNode = nil;
  self.treeBuilder = nil;
}

#pragma mark - Public API

- (SGFCGameType) gameType
{
  return [SGFCMappingUtility toSgfcKitGameType:_wrappedGame->GetGameType()];
}

- (SGFCNumber) gameTypeAsNumber
{
  return [SGFCMappingUtility toSgfcKitNumber:_wrappedGame->GetGameTypeAsNumber()];
}

- (BOOL) hasBoardSize
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedGame->HasBoardSize()];
}

- (SGFCBoardSize) boardSize
{
  return [SGFCMappingUtility toSgfcKitBoardSize:_wrappedGame->GetBoardSize()];
}

- (BOOL) hasRootNode
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedGame->HasRootNode()];
}

- (void) setRootNode:(SGFCNode*)rootNode
{
  if (rootNode)
    _wrappedGame->SetRootNode([rootNode wrappedNode]);
  else
    _wrappedGame->SetRootNode(nullptr);

  _rootNode = rootNode;
}

- (NSArray*) gameInfoNodes
{
  return [SGFCWrappingUtility wrapNodes:_wrappedGame->GetGameInfoNodes()];
}

- (SGFCGameInfo*) gameInfo
{
  return [SGFCWrappingUtility wrapGameInfo:_wrappedGame->CreateGameInfo()];
}

- (void) writeGameInfo:(SGFCGameInfo*)gameInfo
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:gameInfo
                                                 invalidArgumentName:@"gameInfo"];

  _wrappedGame->WriteGameInfo(gameInfo.wrappedGameInfo);
}

#pragma mark - Internal API - SGFCGameInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcGame>) wrappedGame
{
  return _wrappedGame;
}

@end
