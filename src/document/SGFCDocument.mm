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
#import "../../include/SGFCDocument.h"
#import "../interface/internal/SGFCDocumentInternalAdditions.h"
#import "../interface/internal/SGFCGameInternalAdditions.h"
#import "../SGFCExceptionUtility.h"
#import "../SGFCMappingUtility.h"
#import "../SGFCWrappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcDocument.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

// System includes
#import <Foundation/NSArray.h>

#pragma mark - Class extension

@interface SGFCDocument()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcDocument> _wrappedDocument;
}
@end

@implementation SGFCDocument

#pragma mark - Initialization and deallocation

+ (SGFCDocument*) document
{
  return [[SGFCDocument alloc] init];
}

+ (SGFCDocument*) documentWithGame:(SGFCGame*)game
{
  return [[SGFCDocument alloc] initWithGame:game];
}

- (id) init
{
  return [self initWithGame:nil];
}

- (id) initWithGame:(SGFCGame*)game
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  if (game == nil)
  {
    _wrappedDocument = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreateDocument();
    self.games = [NSMutableArray arrayWithCapacity:0];
  }
  else
  {
    _wrappedDocument = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreateDocument([game wrappedGame]);
    self.games = [NSMutableArray arrayWithObject:game];
  }

  return self;
}

- (id) initWithWrappedDocument:(std::shared_ptr<LibSgfcPlusPlus::ISgfcDocument>)wrappedDocument
{
  if (wrappedDocument == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedDocument\" is nullptr"];

  self = [self initWithGame:nil];
  if (! self)
    return nil;

  _wrappedDocument = wrappedDocument;
  _games = [SGFCWrappingUtility wrapGames:_wrappedDocument->GetGames()];

  return self;
}

- (void) dealloc
{
  _wrappedDocument = nullptr;
  // Don't use property accessor because of nil check
  _games = nil;
}

#pragma mark - Public API

- (BOOL) isEmpty
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedDocument->IsEmpty()];
}

- (void) setGames:(NSArray*)games
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:games
                                                 invalidArgumentName:@"games"];

  std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcGame>> wrappedGames;

  for (id gameObject in games)
  {
    if (! gameObject)
      [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"games\" contains a nil object"];
    if (! [gameObject isKindOfClass:[SGFCGame class]])
      [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"games\" contains an object that is not of type SGFCGame"];

    SGFCGame* game = gameObject;
    wrappedGames.push_back([game wrappedGame]);
  }

  try
  {
    _wrappedDocument->SetGames(wrappedGames);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }

  _games = [NSMutableArray arrayWithArray:games];
}

- (void) appendGame:(SGFCGame*)game
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:game
                                                 invalidArgumentName:@"game"];

  try
  {
    _wrappedDocument->AppendGame([game wrappedGame]);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }

  [(NSMutableArray*)_games addObject:game];
}

- (void) removeGame:(SGFCGame*)game
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:game
                                                 invalidArgumentName:@"game"];

  try
  {
    _wrappedDocument->RemoveGame([game wrappedGame]);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }

  [(NSMutableArray*)_games removeObject:game];
}

- (void) removeAllGames
{
  _wrappedDocument->RemoveAllGames();
  [(NSMutableArray*)_games removeAllObjects];
}

- (void) debugPrintToConsole
{
  _wrappedDocument->DebugPrintToConsole();
}

#pragma mark - Internal API - SGFCDocumentInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcDocument>) wrappedDocument
{
  return _wrappedDocument;
}

@end
