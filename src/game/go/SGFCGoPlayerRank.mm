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
#import "../../../include/SGFCGoPlayerRank.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/SGFCGoPlayerRank.h>

// Prevent C++ name mangling
extern "C"
{
  SGFCGoPlayerRank SGFCGoPlayerRankMake(SGFCNumber rank, SGFCGoPlayerRankType rankType, SGFCGoPlayerRatingType ratingType, BOOL isValid)
  {
    SGFCGoPlayerRank goPlayerRank;

    goPlayerRank.Rank = rank;
    goPlayerRank.RankType = rankType;
    goPlayerRank.RatingType = ratingType;
    goPlayerRank.IsValid = isValid;

    return goPlayerRank;
  }

  SGFCGoPlayerRank SGFCGoPlayerRankFromPropertyValue(NSString* propertyValue)
  {
    auto goPlayerRank = LibSgfcPlusPlus::SgfcGoPlayerRank::FromPropertyValue(
      [SGFCMappingUtility fromSgfcKitSimpleText:propertyValue]);

    return [SGFCMappingUtility toSgfcKitGoPlayerRank:goPlayerRank];
  }

  NSString* SGFCGoPlayerRankToPropertyValue(SGFCGoPlayerRank goPlayerRank)
  {
    LibSgfcPlusPlus::SgfcGoPlayerRank mappedGoPlayerRank = [SGFCMappingUtility fromSgfcKitGoPlayerRank:goPlayerRank];

    return [SGFCMappingUtility toSgfcKitString:LibSgfcPlusPlus::SgfcGoPlayerRank::ToPropertyValue(mappedGoPlayerRank)];
  }

  BOOL SGFCGoPlayerRankEqualToGoPlayerRank(SGFCGoPlayerRank goPlayerRank1, SGFCGoPlayerRank goPlayerRank2)
  {
    if (goPlayerRank1.Rank != goPlayerRank2.Rank)
      return NO;
    else if (goPlayerRank1.RankType != goPlayerRank2.RankType)
      return NO;
    else if (goPlayerRank1.RatingType != goPlayerRank2.RatingType)
      return NO;
    else if (goPlayerRank1.IsValid != goPlayerRank2.IsValid)
      return NO;
    else
      return YES;
  }

  BOOL SGFCGoPlayerRankNotEqualToGoPlayerRank(SGFCGoPlayerRank goPlayerRank1, SGFCGoPlayerRank goPlayerRank2)
  {
    return SGFCGoPlayerRankEqualToGoPlayerRank(goPlayerRank1, goPlayerRank2) ? NO : YES;
  }
}
