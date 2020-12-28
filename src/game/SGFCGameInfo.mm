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
#import "../../include/SGFCGameInfo.h"
#import "../interface/internal/SGFCGameInfoInternalAdditions.h"
#import "../interface/internal/SGFCGoGameInfoInternalAdditions.h"
#import "../interface/internal/SGFCNodeInternalAdditions.h"
#import "../SGFCExceptionUtility.h"
#import "../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcGoGameInfo.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

#pragma mark - Class extension

@interface SGFCGameInfo()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcGameInfo> _wrappedGameInfo;
}

@end

@implementation SGFCGameInfo

#pragma mark - Initialization and deallocation

+ (instancetype) gameInfo
{
  return [[self alloc] init];
}

+ (instancetype) gameInfoWithRootNode:(SGFCNode*)rootNode
{
  return [[self alloc] initWithRootNode:rootNode];
}

+ (instancetype) gameInfoWithRootNode:(SGFCNode*)rootNode
                         gameInfoNode:(SGFCNode*)gameInfoNode
{
  return [[self alloc] initWithRootNode:rootNode
                           gameInfoNode:gameInfoNode];
}

- (instancetype) init
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  _wrappedGameInfo = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreateGameInfo();

  // At this point self can be one of two things:
  // - An SGFCGameInfo object, if the alloc message was sent to the
  //   SGFCGameInfo class object. In this case clients will not be able to
  //   benefit from _wrappedGameInfo being an ISgfcGoGameInfo.
  // - An SGFCGoGameInfo object, if the alloc message was sent to the
  //   SGFCGoGameInfo class object. In this case the subclass initializer
  //   will use _wrappedGameInfo when we return control to it.
  return self;
}

- (instancetype) initWithRootNode:(SGFCNode*)rootNode
{
  // The designated initializer creates a useless wrapped object which we are
  // going to overwrite in a moment.
  self = [self init];
  if (! self)
    return nil;

  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:rootNode
                                                 invalidArgumentName:@"rootNode"];

  // Create the actual wrapped object. Don't assign it to the member variable
  // yet in case we are going to deallocate self.
  auto wrappedGameInfo = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreateGameInfo([rootNode wrappedNode]);
  if (wrappedGameInfo->ToGoGameInfo() == nullptr)
  {
    // The externally allocated self has the correct type, so we can simply
    // overwrite the useless wrapped object created by the designated
    // initializer.
    _wrappedGameInfo = wrappedGameInfo;
  }
  else
  {
    // The externally allocated self has the wrong type. We deallocate the
    // object...
    self = nil;

    // ... and allocate a new object that has the correct type. We don't need
    // to assign the wrapped object to the member variable, this is done by
    // initWithWrappedGoGameInfo:().
    auto wrappedGoGameInfo = std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcGoGameInfo>(wrappedGameInfo);
    self = [[SGFCGoGameInfo alloc] initWithWrappedGoGameInfo:wrappedGoGameInfo];
  }

  return self;
}

- (instancetype) initWithRootNode:(SGFCNode*)rootNode
                     gameInfoNode:(SGFCNode*)gameInfoNode
{
  // The designated initializer creates a useless wrapped object which we are
  // going to overwrite in a moment.
  self = [self init];
  if (! self)
    return nil;

  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:rootNode
                                                 invalidArgumentName:@"rootNode"];
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:gameInfoNode
                                                 invalidArgumentName:@"gameInfoNode"];

  // Create the actual wrapped object. Don't assign it to the member variable
  // yet in case we are going to deallocate self.
  auto wrappedGameInfo = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreateGameInfo([rootNode wrappedNode], [gameInfoNode wrappedNode]);
  if (wrappedGameInfo->ToGoGameInfo() == nullptr)
  {
    // The externally allocated self has the correct type, so we can simply
    // overwrite the useless wrapped object created by the designated
    // initializer.
    _wrappedGameInfo = wrappedGameInfo;
  }
  else
  {
    // The externally allocated self has the wrong type. We deallocate the
    // object...
    self = nil;

    // ... and allocate a new object that has the correct type. We don't need
    // to assign the wrapped object to the member variable, this is done by
    // initWithWrappedGoGameInfo:().
    auto wrappedGoGameInfo = std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcGoGameInfo>(wrappedGameInfo);
    self = [[SGFCGoGameInfo alloc] initWithWrappedGoGameInfo:wrappedGoGameInfo];
  }

  return self;
}

- (instancetype) initWithWrappedGameInfo:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGameInfo>)wrappedGameInfo
{
  // The designated initializer creates a useless wrapped object which we are
  // going to overwrite in a moment.
  self = [self init];
  if (! self)
    return nil;

  if (wrappedGameInfo == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedGameInfo\" is nullptr"];

  _wrappedGameInfo = wrappedGameInfo;

  return self;
}

- (void) dealloc
{
  _wrappedGameInfo = nullptr;
}

#pragma mark - Public API

- (SGFCGameType) gameType
{
  return [SGFCMappingUtility toSgfcKitGameType:_wrappedGameInfo->GetGameType()];
}

- (SGFCNumber) gameTypeAsNumber
{
  return [SGFCMappingUtility toSgfcKitNumber:_wrappedGameInfo->GetGameTypeAsNumber()];
}

- (SGFCBoardSize) boardSize
{
  return [SGFCMappingUtility toSgfcKitBoardSize:_wrappedGameInfo->GetBoardSize()];
}

- (NSString*) recorderName
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetRecorderName()];
}

- (void) setRecorderName:(NSString*)recorderName
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:recorderName
                                                 invalidArgumentName:@"recorderName"];

  _wrappedGameInfo->SetRecorderName([SGFCMappingUtility fromSgfcKitSimpleText:recorderName]);
}

- (NSString*) sourceName
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetSourceName()];
}

- (void) setSourceName:(NSString*)sourceName
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:sourceName
                                                 invalidArgumentName:@"sourceName"];

  _wrappedGameInfo->SetSourceName([SGFCMappingUtility fromSgfcKitSimpleText:sourceName]);
}

- (NSString*) annotationAuthor
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetAnnotationAuthor()];
}

- (void) setAnnotationAuthor:(NSString*)annotationAuthor
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:annotationAuthor
                                                 invalidArgumentName:@"annotationAuthor"];

  _wrappedGameInfo->SetAnnotationAuthor([SGFCMappingUtility fromSgfcKitSimpleText:annotationAuthor]);
}

- (NSString*) copyrightInformation
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetCopyrightInformation()];
}

- (void) setCopyrightInformation:(NSString*)copyrightInformation
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:copyrightInformation
                                                 invalidArgumentName:@"copyrightInformation"];

  _wrappedGameInfo->SetCopyrightInformation([SGFCMappingUtility fromSgfcKitSimpleText:copyrightInformation]);
}

- (NSString*) gameName
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetGameName()];
}

- (void) setGameName:(NSString*)gameName
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:gameName
                                                 invalidArgumentName:@"gameName"];

  _wrappedGameInfo->SetGameName([SGFCMappingUtility fromSgfcKitSimpleText:gameName]);
}

- (NSString*) gameInformation
{
  return [SGFCMappingUtility toSgfcKitText:_wrappedGameInfo->GetGameInformation()];
}

- (void) setGameInformation:(NSString*)gameInformation
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:gameInformation
                                                 invalidArgumentName:@"gameInformation"];

  _wrappedGameInfo->SetGameInformation([SGFCMappingUtility fromSgfcKitText:gameInformation]);
}

- (NSArray*) gameDates
{
  return [SGFCMappingUtility toSgfcKitDates:_wrappedGameInfo->GetGameDates()];
}

- (void) setGameDates:(NSArray*)gameDates
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:gameDates
                                                 invalidArgumentName:@"gameDates"];

  _wrappedGameInfo->SetGameDates([SGFCMappingUtility fromSgfcKitDates:gameDates]);
}

- (NSString*) rawGameDates
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetRawGameDates()];
}

- (NSString*) rulesName
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetRulesName()];
}

- (void) setRulesName:(NSString*)rulesName
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:rulesName
                                                 invalidArgumentName:@"rulesName"];

  _wrappedGameInfo->SetRulesName([SGFCMappingUtility fromSgfcKitSimpleText:rulesName]);
}

- (SGFCGameResult) gameResult
{
  return [SGFCMappingUtility toSgfcKitGameResult:_wrappedGameInfo->GetGameResult()];
}

- (void) setGameResult:(SGFCGameResult)gameResult
{
  _wrappedGameInfo->SetGameResult([SGFCMappingUtility fromSgfcKitGameResult:gameResult]);
}

- (NSString*) rawGameResult
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetRawGameResult()];
}

- (SGFCReal) timeLimitInSeconds
{
  return [SGFCMappingUtility toSgfcKitReal:_wrappedGameInfo->GetTimeLimitInSeconds()];
}

- (void) setTimeLimitInSeconds:(SGFCReal)timeLimitInSeconds
{
  _wrappedGameInfo->SetTimeLimitInSeconds([SGFCMappingUtility fromSgfcKitReal:timeLimitInSeconds]);
}

- (NSString*) overtimeInformation
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetOvertimeInformation()];
}

- (void) setOvertimeInformation:(NSString*)overtimeInformation
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:overtimeInformation
                                                 invalidArgumentName:@"overtimeInformation"];

  _wrappedGameInfo->SetOvertimeInformation([SGFCMappingUtility fromSgfcKitSimpleText:overtimeInformation]);
}

- (NSString*) openingInformation
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetOpeningInformation()];
}

- (void) setOpeningInformation:(NSString*)openingInformation
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:openingInformation
                                                 invalidArgumentName:@"openingInformation"];

  _wrappedGameInfo->SetOpeningInformation([SGFCMappingUtility fromSgfcKitSimpleText:openingInformation]);
}

- (NSString*) blackPlayerName
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetBlackPlayerName()];
}

- (void) setBlackPlayerName:(NSString*)blackPlayerName
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:blackPlayerName
                                                 invalidArgumentName:@"blackPlayerName"];

  _wrappedGameInfo->SetBlackPlayerName([SGFCMappingUtility fromSgfcKitSimpleText:blackPlayerName]);
}

- (NSString*) blackPlayerRank
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetBlackPlayerRank()];
}

- (void) setBlackPlayerRank:(NSString*)blackPlayerRank
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:blackPlayerRank
                                                 invalidArgumentName:@"blackPlayerRank"];

  _wrappedGameInfo->SetBlackPlayerRank([SGFCMappingUtility fromSgfcKitSimpleText:blackPlayerRank]);
}

- (NSString*) blackPlayerTeamName
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetBlackPlayerTeamName()];
}

- (void) setBlackPlayerTeamName:(NSString*)blackPlayerTeamName
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:blackPlayerTeamName
                                                 invalidArgumentName:@"blackPlayerTeamName"];

  _wrappedGameInfo->SetBlackPlayerTeamName([SGFCMappingUtility fromSgfcKitSimpleText:blackPlayerTeamName]);
}

- (NSString*) whitePlayerName
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetWhitePlayerName()];
}

- (void) setWhitePlayerName:(NSString*)whitePlayerName
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:whitePlayerName
                                                 invalidArgumentName:@"whitePlayerName"];

  _wrappedGameInfo->SetWhitePlayerName([SGFCMappingUtility fromSgfcKitSimpleText:whitePlayerName]);
}

- (NSString*) whitePlayerRank
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetWhitePlayerRank()];
}

- (void) setWhitePlayerRank:(NSString*)whitePlayerRank
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:whitePlayerRank
                                                 invalidArgumentName:@"whitePlayerRank"];

  _wrappedGameInfo->SetWhitePlayerRank([SGFCMappingUtility fromSgfcKitSimpleText:whitePlayerRank]);
}

- (NSString*) whitePlayerTeamName
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetWhitePlayerTeamName()];
}

- (void) setWhitePlayerTeamName:(NSString*)whitePlayerTeamName
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:whitePlayerTeamName
                                                 invalidArgumentName:@"whitePlayerTeamName"];

  _wrappedGameInfo->SetWhitePlayerTeamName([SGFCMappingUtility fromSgfcKitSimpleText:whitePlayerTeamName]);
}

- (NSString*) gameLocation
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetGameLocation()];
}

- (void) setGameLocation:(NSString*)gameLocation
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:gameLocation
                                                 invalidArgumentName:@"gameLocation"];

  _wrappedGameInfo->SetGameLocation([SGFCMappingUtility fromSgfcKitSimpleText:gameLocation]);
}

- (NSString*) eventName
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetEventName()];
}

- (void) setEventName:(NSString*)eventName
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:eventName
                                                 invalidArgumentName:@"eventName"];

  _wrappedGameInfo->SetEventName([SGFCMappingUtility fromSgfcKitSimpleText:eventName]);
}

- (SGFCRoundInformation) roundInformation
{
  return [SGFCMappingUtility toSgfcKitRoundInformation:_wrappedGameInfo->GetRoundInformation()];
}

- (void) setRoundInformation:(SGFCRoundInformation)roundInformation
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:roundInformation.RoundNumber
                                                 invalidArgumentName:@"roundInformation.RoundNumber"];
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:roundInformation.RoundType
                                                 invalidArgumentName:@"roundInformation.RoundType"];

  _wrappedGameInfo->SetRoundInformation([SGFCMappingUtility fromSgfcKitRoundInformation:roundInformation]);
}

- (NSString*) rawRoundInformation
{
  return [SGFCMappingUtility toSgfcKitSimpleText:_wrappedGameInfo->GetRawRoundInformation()];
}

- (SGFCGoGameInfo*) toGoGameInfo
{
  return nil;
}

#pragma mark - Internal API - SGFCGameInfoInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcGameInfo>) wrappedGameInfo
{
  return _wrappedGameInfo;
}

- (void) setWrappedGameInfo:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGameInfo>)wrappedGameInfo
{
  if (wrappedGameInfo == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedGameInfo\" is nullptr"];

  _wrappedGameInfo = wrappedGameInfo;
}

@end
