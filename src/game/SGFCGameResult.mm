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
#import "../../include/SGFCGameResult.h"
#import "../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/SgfcGameResult.h>

SGFCGameResult SGFCGameResultMake(SGFCGameResultType gameResultType, SGFCWinType winType, SGFCReal score, BOOL isValid)
{
  SGFCGameResult gameResult;

  gameResult.GameResultType = gameResultType;
  gameResult.WinType = winType;
  gameResult.Score = score;
  gameResult.IsValid = isValid;

  return gameResult;
}

SGFCGameResult SGFCGameResultFromPropertyValue(NSString* propertyValue)
{
  auto gameResult = LibSgfcPlusPlus::SgfcGameResult::FromPropertyValue(
    [SGFCMappingUtility fromSgfcKitSimpleText:propertyValue]);

  return [SGFCMappingUtility toSgfcKitGameResult:gameResult];
}

NSString* SGFCGameResultToPropertyValue(SGFCGameResult gameResult)
{
  LibSgfcPlusPlus::SgfcGameResult mappedGameResult =
    [SGFCMappingUtility fromSgfcKitGameResult:gameResult];

  return [SGFCMappingUtility toSgfcKitString:LibSgfcPlusPlus::SgfcGameResult::ToPropertyValue(mappedGameResult)];
}

BOOL SGFCGameResultEqualToGameResult(SGFCGameResult gameResult1, SGFCGameResult gameResult2)
{
  if (gameResult1.GameResultType != gameResult2.GameResultType)
    return NO;
  else if (gameResult1.WinType != gameResult2.WinType)
    return NO;
  else if (gameResult1.Score != gameResult2.Score)
    return NO;
  else if (gameResult1.IsValid != gameResult2.IsValid)
    return NO;
  else
    return YES;
}

BOOL SGFCGameResultNotEqualToGameResult(SGFCGameResult gameResult1, SGFCGameResult gameResult2)
{
  return SGFCGameResultEqualToGameResult(gameResult1, gameResult2) ? NO : YES;
}
