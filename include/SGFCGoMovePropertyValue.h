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
#import "SGFCMovePropertyValue.h"

// Forward declarations
@class NSString;
@class SGFCGoMove;

/// @brief The SGFCGoMovePropertyValue class makes the property value
/// data of a property of type #SGFCPropertyValueTypeMove available as
/// an SGFCGoMove object.
///
/// @ingroup public-api
/// @ingroup property-value
/// @ingroup go
@interface SGFCGoMovePropertyValue : SGFCMovePropertyValue
{
}

/// @brief Returns a newly constructed SGFCGoMovePropertyValue object.
/// The object holds an SGFCGoMove object that refers to the move
/// specified by @a moveValue and @a color. The move is not a pass move.
/// @a boardSize indicates the size of the Go board that the Go move is
/// played on.
///
/// @a moveValue refers to the location (a Go point) of the stone that is
/// placed by the move on the board. @a moveValue can be given in any one of
/// the notations enumerated in SGFCGoPointNotation.
///
/// @exception NSInvalidArgumentException Is raised if @a moveValue is @e nil.
/// Is also raised if @a boardSize refers to
/// a board that is not square, a board with size smaller than the minimum
/// required by the SGF standard (#SGFCBoardSizeMinimum), or a
/// board with size larger than the maximum allowed by the SGF standard
/// (#SGFCBoardSizeMaximumGo). Is also raised if @a moveValue is
/// not given in one of the notations enumerated in SGFCGoPointNotation, or
/// if @a moveValue violates one of the restrictions imposed by the used
/// notation (e.g. y-axis compound larger than 25 when
/// #SGFCGoPointNotationHybrid is used), or if @a moveValue refers to an
/// invalid location on the board (e.g. an x-axis or y-axis location that
/// exceeds the board size specified by @a boardSize, or a compound < 1 when
/// #SGFCGoPointNotationFigure is used).
+ (SGFCGoMovePropertyValue*) goMovePropertyValueWithGoMoveValue:(NSString*)moveValue
                                                      boardSize:(SGFCBoardSize)boardSize
                                                          color:(SGFCColor)color;

/// @brief Returns a newly constructed SGFCGoMovePropertyValue object.
/// The object holds an SGFCGoMove object that refers to the move
/// specified by @a moveValue and @a color. The move is not a pass move. No
/// attempt is made to interpret @a moveValue. As a consequence, the
/// SGFCGoMovePropertyValue object contains an SGFCGoMove object that does
/// not hold an SGFCGoPoint object.
///
/// @a moveValue refers to the location (a Go point) of the stone that is
/// placed by the move on the board.
///
/// @exception NSInvalidArgumentException Is raised if @a stoneValue
/// is @e nil.
+ (SGFCGoMovePropertyValue*) goMovePropertyValueWithGoMoveValue:(NSString*)moveValue
                                                          color:(SGFCColor)color;

/// @brief Returns a newly constructed SGFCGoMovePropertyValue object.
/// The object holds an SGFCGoMove object that refers to the move
/// specified by @a color. The move is a pass move.
+ (SGFCGoMovePropertyValue*) goMovePropertyValueWithColor:(SGFCColor)color;

/// @brief Initializes an SGFCGoMovePropertyValue object.
/// The object holds an SGFCGoMove object that refers to the move
/// specified by @a moveValue and @a color. The move is not a pass move.
/// @a boardSize indicates the size of the Go board that the Go move is
/// played on.
///
/// @a moveValue refers to the location (a Go point) of the stone that is
/// placed by the move on the board. @a moveValue can be given in any one of
/// the notations enumerated in SGFCGoPointNotation.
///
/// @exception NSInvalidArgumentException Is raised if @a moveValue is @e nil.
/// Is also raised if @a boardSize refers to
/// a board that is not square, a board with size smaller than the minimum
/// required by the SGF standard (#SGFCBoardSizeMinimum), or a
/// board with size larger than the maximum allowed by the SGF standard
/// (#SGFCBoardSizeMaximumGo). Is also raised if @a moveValue is
/// not given in one of the notations enumerated in SGFCGoPointNotation, or
/// if @a moveValue violates one of the restrictions imposed by the used
/// notation (e.g. y-axis compound larger than 25 when
/// #SGFCGoPointNotationHybrid is used), or if @a moveValue refers to an
/// invalid location on the board (e.g. an x-axis or y-axis location that
/// exceeds the board size specified by @a boardSize, or a compound < 1 when
/// #SGFCGoPointNotationFigure is used).
- (instancetype) initWithGoMoveValue:(NSString*)moveValue
                           boardSize:(SGFCBoardSize)boardSize
                               color:(SGFCColor)color;

/// @brief Initializes an SGFCGoMovePropertyValue object.
/// The object holds an SGFCGoMove object that refers to the move
/// specified by @a moveValue and @a color. The move is not a pass move. No
/// attempt is made to interpret @a moveValue. As a consequence, the
/// SGFCGoMovePropertyValue object contains an SGFCGoMove object that does
/// not hold an SGFCGoPoint object.
///
/// @a moveValue refers to the location (a Go point) of the stone that is
/// placed by the move on the board.
///
/// @exception NSInvalidArgumentException Is raised if @a stoneValue
/// is @e nil.
- (instancetype) initWithGoMoveValue:(NSString*)moveValue
                               color:(SGFCColor)color;

/// @brief Initializes an SGFCGoMovePropertyValue object.
/// The object holds an SGFCGoMove object that refers to the move
/// specified by @a color. The move is a pass move.
///
/// This is the designated initializer of SGFCPointPropertyValue.
- (instancetype) initWithColor:(SGFCColor)color NS_DESIGNATED_INITIALIZER;

/// @brief Returns an SGFCGoMove object that contains the property value
/// data. The SGFCGoMove object does not contain an SGFCGoPoint object
/// if interpretation of the property value data is not possible.
@property(nonatomic, strong, readonly) SGFCGoMove* goMove;

@end
