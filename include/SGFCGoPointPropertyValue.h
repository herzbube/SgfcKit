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
#include "SGFCBoardSize.h"
#include "SGFCPointPropertyValue.h"

// Forward declarations
@class SGFCGoPoint;

/// @brief The SGFCGoPointPropertyValue class makes the property value
/// data of a property of type #SGFCPropertyValueTypePoint available as
/// an SGFCGoPoint object.
///
/// @ingroup public-api
/// @ingroup property-value
/// @ingroup go
@interface SGFCGoPointPropertyValue : SGFCPointPropertyValue
{
}

/// @brief Returns a newly constructed SGFCGoPointPropertyValue object. The
/// object holds an SGFCGoPoint object that refers to the point
/// specified by @a pointValue. @a boardSize indicates the size of the Go
/// board that the Go point is located on.
///
/// @a pointValue can be given in any one of the notations enumerated in
/// SGFCGoPointNotation.
///
/// @exception NSInvalidArgumentException Is raised if @a pointValue
/// is @e nil. Is also raised if @a boardSize refers to
/// a board that is not square, a board with size smaller than the minimum
/// required by the SGF standard (#SGFCBoardSizeMinimum), or a
/// board with size larger than the maximum allowed by the SGF standard
/// (#SGFCBoardSizeMaximumGo). Is also thrown if @a pointValue is
/// not given in one of the notations enumerated in SGFCGoPointNotation, or
/// if @a pointValue violates one of the restrictions imposed by the used
/// notation (e.g. y-axis compound larger than 25 when
/// #SGFCGoPointNotationHybrid is used), or if @a pointValue refers to an
/// invalid location on the board (e.g. an x-axis or y-axis location that
/// exceeds the board size specified by @a boardSize, or a compound < 1 when
/// #SGFCGoPointNotationFigure is used).
+ (SGFCGoPointPropertyValue*) goPointPropertyValueWithPointValue:(NSString*)pointValue
                                                       boardSize:(SGFCBoardSize)boardSize;

/// @brief Initializes an SGFCGoPointPropertyValue object. The object
/// holds an SGFCGoPoint object that refers to the point specified by
/// @a pointValue. @a boardSize indicates the size of the Go board that the Go
/// point is located on.
///
/// @a pointValue can be given in any one of the notations enumerated in
/// SGFCGoPointNotation.
///
/// @exception NSInvalidArgumentException Is raised if @a pointValue
/// is @e nil. Is also raised if @a boardSize refers to
/// a board that is not square, a board with size smaller than the minimum
/// required by the SGF standard (#SGFCBoardSizeMinimum), or a
/// board with size larger than the maximum allowed by the SGF standard
/// (#SGFCBoardSizeMaximumGo). Is also thrown if @a pointValue is
/// not given in one of the notations enumerated in SGFCGoPointNotation, or
/// if @a pointValue violates one of the restrictions imposed by the used
/// notation (e.g. y-axis compound larger than 25 when
/// #SGFCGoPointNotationHybrid is used), or if @a pointValue refers to an
/// invalid location on the board (e.g. an x-axis or y-axis location that
/// exceeds the board size specified by @a boardSize, or a compound < 1 when
/// #SGFCGoPointNotationFigure is used).
- (id) initWithPointValue:(NSString*)pointValue
                boardSize:(SGFCBoardSize)boardSize;

/// @brief Returns an SGFCGoPoint object that contains the property value
/// data and makes it available in various forms and notations. Returns
/// @e nil if interpretation of the property value data is not possible.
@property(nonatomic, strong, readonly) SGFCGoPoint* goPoint;

@end
