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
#import "SGFCBoardSize.h"
#import "SGFCColor.h"
#import "SGFCStonePropertyValue.h"

// Forward declarations
@class NSString;
@class SGFCGoStone;

/// @brief The SGFCGoStonePropertyValue class makes the property value
/// data of a property of type #SGFCPropertyValueTypeStone available as
/// an SGFCGoStone object.
///
/// @ingroup public-api
/// @ingroup property-value
/// @ingroup go
@interface SGFCGoStonePropertyValue : SGFCStonePropertyValue
{
}

/// @brief Returns a newly constructed SGFCGoStonePropertyValue object.
/// The object holds an SGFCGoStone object that refers to the stone
/// specified by @a stoneValue and @a color. @a boardSize indicates the size
/// of the Go board that the Go stone is located on.
///
/// @a stoneValue refers to the Go point on which the stone is located.
/// @a stoneValue can be given in any one of the notations enumerated in
/// SGFCGoPointNotation.
///
/// @exception NSInvalidArgumentException Is raised if @a stoneValue is @e nil.
/// Is also raised if @a boardSize refers to
/// a board that is not square, a board with size smaller than the minimum
/// required by the SGF standard (#SGFCBoardSizeMinimum), or a
/// board with size larger than the maximum allowed by the SGF standard
/// (#SGFCBoardSizeMaximumGo). Is also raised if @a stoneValue is
/// not given in one of the notations enumerated in SGFCGoPointNotation, or
/// if @a stoneValue violates one of the restrictions imposed by the used
/// notation (e.g. y-axis compound larger than 25 when
/// #SGFCGoPointNotationHybrid is used), or if @a stoneValue refers to an
/// invalid location on the board (e.g. an x-axis or y-axis location that
/// exceeds the board size specified by @a boardSize, or a compound < 1 when
/// #SGFCGoPointNotationFigure is used).
+ (SGFCGoStonePropertyValue*) goStonePropertyValueWithGoStoneValue:(NSString*)stoneValue
                                                         boardSize:(SGFCBoardSize)boardSize
                                                             color:(SGFCColor)color;

/// @brief Returns a newly constructed SGFCGoStonePropertyValue object.
/// The object holds an SGFCGoStone object that refers to the stone
/// specified by @a stoneValue and @a color. No attempt is made to interpret
/// @a stoneValue. As a consequence, the SGFCGoStonePropertyValue object
/// contains an SGFCGoStone object that does not hold an SGFCGoPoint
/// object.
///
/// @a stoneValue refers to the Go point on which the stone is located.
///
/// @exception NSInvalidArgumentException Is raised if @a stoneValue
/// is @e nil.
+ (SGFCGoStonePropertyValue*) goStonePropertyValueWithGoStoneValue:(NSString*)stoneValue
                                                             color:(SGFCColor)color;

/// @brief Initializes an SGFCGoStonePropertyValue object.
/// The object holds an SGFCGoStone object that refers to the stone
/// specified by @a stoneValue and @a color. @a boardSize indicates the size
/// of the Go board that the Go stone is located on.
///
/// @a stoneValue refers to the Go point on which the stone is located.
/// @a stoneValue can be given in any one of the notations enumerated in
/// SGFCGoPointNotation.
///
/// @exception NSInvalidArgumentException Is raised if @a stoneValue is @e nil.
/// Is also raised if @a boardSize refers to
/// a board that is not square, a board with size smaller than the minimum
/// required by the SGF standard (#SGFCBoardSizeMinimum), or a
/// board with size larger than the maximum allowed by the SGF standard
/// (#SGFCBoardSizeMaximumGo). Is also raised if @a stoneValue is
/// not given in one of the notations enumerated in SGFCGoPointNotation, or
/// if @a stoneValue violates one of the restrictions imposed by the used
/// notation (e.g. y-axis compound larger than 25 when
/// #SGFCGoPointNotationHybrid is used), or if @a stoneValue refers to an
/// invalid location on the board (e.g. an x-axis or y-axis location that
/// exceeds the board size specified by @a boardSize, or a compound < 1 when
/// #SGFCGoPointNotationFigure is used).
- (instancetype) initWithGoStoneValue:(NSString*)stoneValue
                            boardSize:(SGFCBoardSize)boardSize
                                color:(SGFCColor)color;

/// @brief Initializes an SGFCGoStonePropertyValue object.
/// The object holds an SGFCGoStone object that refers to the stone
/// specified by @a stoneValue and @a color. No attempt is made to interpret
/// @a stoneValue. As a consequence, the SGFCGoStonePropertyValue object
/// contains an SGFCGoStone object that does not hold an SGFCGoPoint
/// object.
///
/// @a stoneValue refers to the Go point on which the stone is located.
///
/// @exception NSInvalidArgumentException Is raised if @a stoneValue
/// is @e nil.
///
/// This is the designated initializer of SGFCPointPropertyValue.
- (instancetype) initWithGoStoneValue:(NSString*)stoneValue
                                color:(SGFCColor)color NS_DESIGNATED_INITIALIZER;

/// @brief Returns an SGFCGoStone object that contains the property value
/// data. The SGFCGoStone object does not contain an SGFCGoPoint object
/// if interpretation of the property value data is not possible.
@property(nonatomic, strong, readonly) SGFCGoStone* goStone;

@end
