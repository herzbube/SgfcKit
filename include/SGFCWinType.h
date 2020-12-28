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

#pragma once

// System includes
#import <Foundation/NSObjCRuntime.h>

/// @brief SGFCWinType enumerates how a player can win a game. An SGFCWinType
/// value is used to accompany a game result type value of either
/// #SGFCGameResultTypeBlackWin or #SGFCGameResultTypeWhiteWin.
///
/// @ingroup public-api
/// @ingroup game
///
/// @see SGFCGameInfo
typedef NS_ENUM(NSUInteger, SGFCWinType)
{
  /// @brief The player wins the game by normal play which results in a
  /// score. The actual score is detailed by an accompanying SGFCReal value.
  SGFCWinTypeWinWithScore,

  /// @brief The player wins the game by normal play which results in no
  /// score, or an unknown score. Some game types, such as chess, don't have
  /// a score.
  SGFCWinTypeWinWithoutScore,

  /// @brief The player wins the game by resignation.
  SGFCWinTypeWinByResignation,

  /// @brief The player wins the game on time.
  SGFCWinTypeWinOnTime,

  /// @brief The player wins the game by forfeit.
  SGFCWinTypeWinByForfeit,
};
