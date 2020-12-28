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

/// @brief SGFCGameResultType enumerates the main result types with which
/// a game can end. Depending on the enumerator additional values are needed
/// to determine the exact nature of the game result.
///
/// @ingroup public-api
/// @ingroup game
///
/// @see SGFCGameInfo
typedef NS_ENUM(NSUInteger, SGFCGameResultType)
{
  /// @brief The black player wins the game. The nature of the win is detailed
  /// by an accompanying SGFCWinType value.
  SGFCGameResultTypeBlackWin,

  /// @brief The white player wins. The nature of the win is detailed
  /// by an accompanying SGFCWinType value.
  SGFCGameResultTypeWhiteWin,

  /// @brief The game ends with a draw (jigo).
  SGFCGameResultTypeDraw,

  /// @brief The game ends with no result, or with suspended play.
  SGFCGameResultTypeNoResult,

  /// @brief The game ends with an unknown result.
  SGFCGameResultTypeUnknownResult,
};
