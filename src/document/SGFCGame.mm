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
#import "../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcGame.h>
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
  return [self initWithRootNode:nil];
}

- (id) initWithRootNode:(SGFCNode*)rootNode
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
  // Don't use property accessor because it does stuff with the wrapped object
  _rootNode = nil;
  self.treeBuilder = nil;
}

#pragma mark - Public API

- (SGFCGameType) gameType
{
  try
  {
    return [SGFCMappingUtility toSgfcKitGameType:_wrappedGame->GetGameType()];
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseInternalInconsistencyExceptionWithCStringReason:exception.what()];
  }
}

- (SGFCNumber) gameTypeAsNumber
{
  try
  {
    return [SGFCMappingUtility toSgfcKitNumber:_wrappedGame->GetGameTypeAsNumber()];
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseInternalInconsistencyExceptionWithCStringReason:exception.what()];
  }
}

- (BOOL) hasBoardSize
{
  try
  {
    return [SGFCMappingUtility toSgfcKitBoolean:_wrappedGame->HasBoardSize()];
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseInternalInconsistencyExceptionWithCStringReason:exception.what()];
  }
}

- (SGFCBoardSize) boardSize
{
  LibSgfcPlusPlus::SgfcBoardSize wrappedBoardSize;

  try
  {
    wrappedBoardSize = _wrappedGame->GetBoardSize();
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseInternalInconsistencyExceptionWithCStringReason:exception.what()];
  }

  SGFCBoardSize boardSize = SGFCBoardSizeMake(
    [SGFCMappingUtility toSgfcKitNumber:wrappedBoardSize.Columns],
    [SGFCMappingUtility toSgfcKitNumber:wrappedBoardSize.Rows]);
  return boardSize;
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

#pragma mark - Internal API - SGFCGameInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcGame>) wrappedGame
{
  return _wrappedGame;
}

@end
