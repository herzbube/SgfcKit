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

// Project includes
#import "SGFCTypedefs.h"

// System includes
#import <Foundation/NSObjCRuntime.h>

/// @brief The SGFCBoardSize struct is a simple type that can hold the value
/// of #SGFCPropertyTypeSZ. The constant #SGFCBoardSizeNone
/// is used to indicate that #SGFCPropertyTypeSZ does not exist on a game
/// tree's root node.
///
/// @ingroup public-api
/// @ingroup property-value
/// @ingroup game
///
/// The SGF standard specifies that for square boards the SGF property must
/// hold only a single SGFCNumber value. SGFCBoardSize is not that flexible,
/// it always stores two values. In case of a square board the two values hold
/// the same numeric value.
///
/// @see SGFCBoardSizeMake
/// @see SGFCBoardSizeIsSquare
/// @see SGFCBoardSizeEqualToBoardSize
/// @see SGFCBoardSizeNotEqualToBoardSize
typedef struct
{
  /// @brief The number of columns of the board. The default is 1, which is
  /// the minimum allowed by the SGF standard.
  SGFCNumber Columns;

  /// @brief The number of rows of the board. The default is 1, which is
  /// the minimum allowed by the SGF standard.
  SGFCNumber Rows;
} SGFCBoardSize;

// Prevent C++ name mangling
#ifdef __cplusplus
extern "C"
{
#endif
  /// @brief Returns an SGFCBoardSize value initialized with @a columns and
  /// @a rows.
  extern SGFCBoardSize SGFCBoardSizeMake(SGFCNumber columns, SGFCNumber rows);

  /// @brief Returns YES if @a boardSize represents a square board. Returns NO
  /// if @a boardSize represents a rectangular board.
  extern BOOL SGFCBoardSizeIsSquare(SGFCBoardSize boardSize);

  /// @brief Returns YES if the number of columns and rows is the same for
  /// @a boardSize1 and @a boardSize2. Returns NO if either the number of
  /// columns or rows or both is different.
  extern BOOL SGFCBoardSizeEqualToBoardSize(SGFCBoardSize boardSize1, SGFCBoardSize boardSize2);

  /// @brief Returns YES if either the number of columns or rows or both
  /// is different for @a boardSize1 and @a boardSize2. Returns NO if the
  /// number of columns and rows is the same.
  extern BOOL SGFCBoardSizeNotEqualToBoardSize(SGFCBoardSize boardSize1, SGFCBoardSize boardSize2);
#ifdef __cplusplus
}
#endif
