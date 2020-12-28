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
#import "../../../include/SGFCGoGameInfo.h"
#import "../../interface/internal/SGFCGoGameInfoInternalAdditions.h"
#import "../../interface/internal/SGFCGameInfoInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcGoGameInfo.h>

#pragma mark - Class extension

@interface SGFCGoGameInfo()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcGoGameInfo> _wrappedGoGameInfo;
}

@end

@implementation SGFCGoGameInfo

#pragma mark - Initialization and deallocation

+ (instancetype) goGameInfo
{
  return [[self alloc] init];
}

+ (instancetype) goGameInfoWithRootNode:(SGFCNode*)rootNode
{
  return [[self alloc] initWithRootNode:rootNode];
}

+ (instancetype) goGameInfoWithRootNode:(SGFCNode*)rootNode
                           gameInfoNode:(SGFCNode*)gameInfoNode
{
  return [[self alloc] initWithRootNode:rootNode
                           gameInfoNode:gameInfoNode];
}

- (instancetype) init
{
  // Call designated initializer of superclass (SGFCGameInfo)
  self = [super init];
  if (! self)
    return nil;

  // The superclass initializer already created an ISgfcGoGameInfo object.
  // We can use this as our own wrapped object.
  // We know that the object is ISgfcGoGameInfo because we know that the
  // parameter-less overload of SgfcPlusPlusFactory::CreateGameInfo(), which
  // corresponds to this initializer, creates such an object.
  auto wrappedGameInfo = [self wrappedGameInfo];
  _wrappedGoGameInfo = std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcGoGameInfo>(wrappedGameInfo);

  return self;
}

- (instancetype) initWithWrappedGoGameInfo:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoGameInfo>)wrappedGoGameInfo
{
  // The designated initializer creates a useless wrapped object which we are
  // going to overwrite in a moment.
  self = [self init];
  if (! self)
    return nil;

  if (wrappedGoGameInfo == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedGoGameInfo\" is nullptr"];

  _wrappedGoGameInfo = wrappedGoGameInfo;

  // Overwrite the useless wrapped object that the designated initializer
  // created with the real wrapped object.
  [self setWrappedGameInfo:_wrappedGoGameInfo];

  return self;
}

- (void) dealloc
{
  _wrappedGoGameInfo = nullptr;
}

#pragma mark - Public API

- (SGFCNumber) numberOfHandicapStones
{
  return [SGFCMappingUtility toSgfcKitNumber:_wrappedGoGameInfo->GetNumberOfHandicapStones()];
}

- (void) setNumberOfHandicapStones:(SGFCNumber)numberOfHandicapStones
{
  _wrappedGoGameInfo->SetNumberOfHandicapStones([SGFCMappingUtility fromSgfcKitNumber:numberOfHandicapStones]);
}

- (SGFCReal) komi
{
  return [SGFCMappingUtility toSgfcKitReal:_wrappedGoGameInfo->GetKomi()];
}

- (void) setKomi:(SGFCReal)komi
{
  _wrappedGoGameInfo->SetKomi([SGFCMappingUtility fromSgfcKitReal:komi]);
}

- (SGFCGoRuleset) goRuleset
{
  return [SGFCMappingUtility toSgfcKitGoRuleset:_wrappedGoGameInfo->GetGoRuleset()];
}

- (void) setGoRuleset:(SGFCGoRuleset)goRuleset
{
  _wrappedGoGameInfo->SetGoRuleset([SGFCMappingUtility fromSgfcKitGoRuleset:goRuleset]);
}

- (SGFCGoPlayerRank) goBlackPlayerRank
{
  return [SGFCMappingUtility toSgfcKitGoPlayerRank:_wrappedGoGameInfo->GetGoBlackPlayerRank()];
}

- (void) setGoBlackPlayerRank:(SGFCGoPlayerRank)goPlayerRank
{
  _wrappedGoGameInfo->SetGoBlackPlayerRank([SGFCMappingUtility fromSgfcKitGoPlayerRank:goPlayerRank]);
}

- (SGFCGoPlayerRank) goWhitePlayerRank
{
  return [SGFCMappingUtility toSgfcKitGoPlayerRank:_wrappedGoGameInfo->GetGoWhitePlayerRank()];
}

- (void) setGoWhitePlayerRank:(SGFCGoPlayerRank)goPlayerRank
{
  _wrappedGoGameInfo->SetGoWhitePlayerRank([SGFCMappingUtility fromSgfcKitGoPlayerRank:goPlayerRank]);
}

#pragma mark - SGFCGameInfo overrides

- (SGFCGoGameInfo*) toGoGameInfo
{
  return self;
}

#pragma mark - Internal API - SGFCGoGameInfoInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcGoGameInfo>) wrappedGoGameInfo
{
  return _wrappedGoGameInfo;
}

@end
