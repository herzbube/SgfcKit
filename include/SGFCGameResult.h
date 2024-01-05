// -----------------------------------------------------------------------------
// Copyright 2024 Patrick Näf (herzbube@herzbube.ch)
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

// Project includes
#import "SGFCGameResultType.h"
#import "SGFCTypedefs.h"
#import "SGFCWinType.h"

// System includes
#import <Foundation/NSObjCRuntime.h>

/// @brief The SGFCGameResult struct is a simple type that can hold the
/// decomposed values of an #SGFCPropertyTypeRE property value.
///
/// @ingroup public-api
/// @ingroup property-value
/// @ingroup game
///
/// @see SGFCGameResultMake
/// @see SGFCGameResultFromPropertyValue
/// @see SGFCGameResultToPropertyValue
/// @see SGFCGameResultEqualToGameResult
/// @see SGFCGameResultNotEqualToGameResult
typedef struct
{
  /// @brief The result type. The default is
  /// #SGFCGameResultTypeUnknownResult.
  SGFCGameResultType GameResultType;

  /// @brief The win type. The default is #SGFCWinTypeWinWithScore.
  ///
  /// The win type only has meaning if SGFCGameResult::GameResultType is
  /// either #SGFCGameResultTypeBlackWin or #SGFCGameResultTypeWhiteWin.
  SGFCWinType WinType;

  /// @brief The score. The default is 0.0.
  ///
  /// The score only has meaning if SGFCGameResult::GameResultType is
  /// either #SGFCGameResultTypeBlackWin or #SGFCGameResultTypeWhiteWin and
  /// if #SGFCGameResult::WinType is #SGFCWinTypeWinWithScore.
  SGFCReal Score;

  /// @brief YES if the SGFCGameResult object holds a valid game result.
  /// NO if the SGFCGameResult object holds an invalid game result. The
  /// default is NO.
  ///
  /// This is mainly used to indicate whether
  /// SGFCGameResultFromPropertyValue() was successful in decomposing
  /// the #SGFCPropertyTypeRE property value. A library client that manually
  /// creates an SGFCGameResult object can simply set this to YES to
  /// assert a valid game result.
  BOOL IsValid;
} SGFCGameResult;

// Prevent C++ name mangling
#ifdef __cplusplus
extern "C"
{
#endif
  /// @brief Returns an SGFCGameResult value initialized with @a gameResultType,
  /// @a winType, @a score and @a isValid.
  extern SGFCGameResult SGFCGameResultMake(SGFCGameResultType gameResultType, SGFCWinType winType, SGFCReal score, BOOL isValid);

  /// @brief Decomposes the content of @a propertyValue into distinct game
  /// result type, win type and score values.
  ///
  /// See the SGF standard specification for the mandatory structure of an
  /// #SGFCPropertyTypeRE property value.
  ///
  /// @return SGFCGameResult An object with the decomposed game
  /// result type, win type and score values. The object's
  /// SGFCGameResult::IsValid member is YES if decomposition was successful,
  /// otherwise it is NO.
  extern SGFCGameResult SGFCGameResultFromPropertyValue(NSString* propertyValue);

  /// @brief Composes a property value for #SGFCPropertyTypeRE from the
  /// game result type, win type and score values in @a gameResult.
  ///
  /// See the SGF standard specification for the mandatory structure of an
  /// #SGFCPropertyTypeRE property value.
  ///
  /// @return NSString A property value for #SGFCPropertyTypeRE that
  /// conforms to the SGF standard's mandatory formatting, or
  /// #SGFCNoneValueString if the SGFCGameResult::IsValid
  /// member of @a gameResult is NO.
  extern NSString* SGFCGameResultToPropertyValue(SGFCGameResult gameResult);

  /// @brief Returns YES if the properties @e GameResultType, @e WinType,
  /// @e Score and @e IsValid are the same for @a gameResult1 and @a gameResult2.
  /// Returns NO if any of these properties are different.
  extern BOOL SGFCGameResultEqualToGameResult(SGFCGameResult gameResult1, SGFCGameResult gameResult2);

  /// @brief Returns YES if any of the properties @e GameResultType,
  /// @e WinType, @e Score or @e IsValid are different for @a gameResult1 and
  /// @a gameResult2. Returns NO if all properties are the same.
  extern BOOL SGFCGameResultNotEqualToGameResult(SGFCGameResult gameResult1, SGFCGameResult gameResult2);
#ifdef __cplusplus
}
#endif
