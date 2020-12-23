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
#import "SGFCDouble.h"
#import "SGFCTypedefs.h"

// System includes
#import <Foundation/NSObject.h>

// Forward declarations
@class SGFCColorPropertyValue;
@class SGFCComposedPropertyValue;
@class SGFCDoublePropertyValue;
@class SGFCGoMovePropertyValue;
@class SGFCGoPointPropertyValue;
@class SGFCGoStonePropertyValue;
@class SGFCMovePropertyValue;
@class SGFCNumberPropertyValue;
@class SGFCPointPropertyValue;
@class SGFCRealPropertyValue;
@class SGFCSimpleTextPropertyValue;
@class SGFCSinglePropertyValue;
@class SGFCStonePropertyValue;
@class SGFCTextPropertyValue;

/// @brief The SGFCPropertyValueFactory class is a class that contains only
/// class methods. The class methods are factory methods used to construct
/// SGFCPropertyValue objects, and objects of every known sub-type of
/// SGFCPropertyValue.
///
/// @ingroup public-api
/// @ingroup factory
/// @ingroup property-value
@interface SGFCPropertyValueFactory : NSObject
{
}

/// @name Single property values - Basic value types
//@{
/// @brief Returns a newly constructed SGFCNumberPropertyValue object
/// that has the SGFCNumber value @a numberValue.
+ (SGFCNumberPropertyValue*) propertyValueWithNumber:(SGFCNumber)numberValue;

/// @brief Returns a newly constructed SGFCRealPropertyValue object
/// that has the SGFCReal value @a realValue.
+ (SGFCRealPropertyValue*) propertyValueWithReal:(SGFCReal)realValue;

/// @brief Returns a newly constructed SGFCDoublePropertyValue object
/// that has the SGFCDouble value @a doubleValue.
+ (SGFCDoublePropertyValue*) propertyValueWithDouble:(SGFCDouble)doubleValue;

/// @brief Returns a newly constructed SGFCColorPropertyValue object
/// that has the SGFCColor value @a colorValue.
+ (SGFCColorPropertyValue*) propertyValueWithColor:(SGFCColor)colorValue;

/// @brief Returns a newly constructed SGFCSimpleTextPropertyValue object
/// that has the SimpleText value @a simpleTextValue.
///
/// @exception NSInvalidArgumentException Is raised if @a simpleTextValue
/// is @e nil.
+ (SGFCSimpleTextPropertyValue*) propertyValueWithSimpleText:(NSString*)simpleTextValue;

/// @brief Returns a newly constructed SGFCTextPropertyValue object
/// that has the Text value @a textValue.
///
/// @exception NSInvalidArgumentException Is raised if @a textValue
/// is @e nil.
+ (SGFCTextPropertyValue*) propertyValueWithText:(NSString*)textValue;

/// @brief Returns a newly constructed SGFCPointPropertyValue object
/// that has the Point value @a pointValue.
///
/// @exception NSInvalidArgumentException Is raised if @a pointValue
/// is @e nil.
+ (SGFCPointPropertyValue*) propertyValueWithPoint:(NSString*)pointValue;

/// @brief Returns a newly constructed SGFCMovePropertyValue object
/// that has the Move value @a moveValue.
///
/// @exception NSInvalidArgumentException Is raised if @a moveValue
/// is @e nil.
+ (SGFCMovePropertyValue*) propertyValueWithMove:(NSString*)moveValue;

/// @brief Returns a newly constructed SGFCStonePropertyValue object
/// that has the Stone value @a stoneValue.
///
/// @exception NSInvalidArgumentException Is raised if @a stoneValue
/// is @e nil.
+ (SGFCStonePropertyValue*) propertyValueWithStone:(NSString*)stoneValue;

/// @brief Returns a newly constructed SGFCSinglePropertyValue object
/// that has the string value @a value. The object has value type
/// #SGFCPropertyValueTypeUnknown.
///
/// @exception NSInvalidArgumentException Is raised if @a value
/// is @e nil.
+ (SGFCSinglePropertyValue*) propertyValueWithValue:(NSString*)value;
//@}

/// @name Single property values - Go game value types
//@{
/// @brief Returns a newly constructed SGFCGoPointPropertyValue object
/// that has the Point value @a pointValue. @a boardSize indicates the
/// size of the Go board that the Go point is located on.
///
/// @a pointValue can be given in any one of the notations enumerated in
/// SGFCGoPointNotation.
///
/// Regardless of the notation in which @a pointValue is given, the
/// resulting SGFCGoPointPropertyValue object uses the SGF notation as
/// the raw property value.
///
/// @exception NSInvalidArgumentException Is raised if @a pointValue is @e nil.
/// Is also raised if @a boardSize refers to
/// a board with size smaller than the minimum
/// required by the SGF standard (#SGFCBoardSizeMinimum), or a
/// board with size larger than the maximum allowed by the SGF standard
/// (#SGFCBoardSizeMaximumGo). Is also raised if @a pointValue is
/// not given in one of the notations enumerated in SGFCGoPointNotation, or
/// if @a pointValue violates one of the restrictions imposed by the used
/// notation (e.g. y-axis compound larger than 25 when
/// #SGFCGoPointNotationHybrid is used), or if @a pointValue refers to an
/// invalid location on the board (e.g. an x-axis or y-axis location that
/// exceeds the board size specified by @a boardSize, or a compound < 1 when
/// #SGFCGoPointNotationFigure is used).
+ (SGFCGoPointPropertyValue*) propertyValueWithGoPoint:(NSString*)pointValue
                                             boardSize:(SGFCBoardSize)boardSize;

/// @brief Returns a newly constructed SGFCGoMovePropertyValue object
/// that has the Move value @a moveValue. @a color is the color of the
/// player who made the move. The move is not a pass move. @a boardSize
/// indicates the size of the Go board that the Go move is played on.
///
/// @a moveValue refers to the location (a Go point) of the stone that is
/// placed by the move on the board. @a moveValue can be given in any one of
/// the notations enumerated in SGFCGoPointNotation.
///
/// Regardless of the notation in which @a moveValue is given, the
/// resulting SGFCGoMovePropertyValue object uses the SGF notation as
/// the raw property value.
///
/// @exception NSInvalidArgumentException Is raised if @a moveValue is @e nil.
/// Is also raised if @a boardSize refers to
/// a board with size smaller than the minimum
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
+ (SGFCGoMovePropertyValue*) propertyValueWithGoMove:(NSString*)moveValue
                                           boardSize:(SGFCBoardSize)boardSize
                                               color:(SGFCColor)color;

/// @brief Returns a newly constructed SGFCGoMovePropertyValue object
/// that has no value. @a color is the color of the player who made the
/// move. The move is a pass move.
///
/// The resulting SGFCGoMovePropertyValue object uses
/// #SGFCGoMovePassString as the raw property value.
+ (SGFCGoMovePropertyValue*) propertyValueWithGoMovePlayedByColor:(SGFCColor)color;

/// @brief Returns a newly constructed SGFCGoStonePropertyValue object
/// that has the Stone value @a stoneValue. @a color is the color of the
/// stone. @a boardSize indicates the size of the Go board that the Go
/// stone is located on.
///
/// @a stoneValue refers to the Go point on which the stone is located.
/// @a stoneValue can be given in any one of the notations enumerated in
/// SGFCGoPointNotation.
///
/// Regardless of the notation in which @a stoneValue is given, the
/// resulting SGFCGoStonePropertyValue object uses the SGF notation as
/// the raw property value.
///
/// @exception NSInvalidArgumentException Is raised if @a stoneValue is @e nil.
/// Is also raised if @a boardSize refers to
/// a board with size smaller than the minimum
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
+ (SGFCGoStonePropertyValue*) propertyValueWithGoStone:(NSString*)stoneValue
                                             boardSize:(SGFCBoardSize)boardSize
                                                 color:(SGFCColor)color;
//@}

/// @name Composed property values - Basic value types
//@{
/// @brief Returns a newly constructed SGFCComposedPropertyValue object
/// that consists of two SGFCNumberPropertyValue objects, which have
/// the SGFCNumber values @a numberValue1 and @a numberValue2.
+ (SGFCComposedPropertyValue*) composedPropertyValueWithNumber:(SGFCNumber)numberValue1
                                                        number:(SGFCNumber)numberValue2;

/// @brief Returns a newly constructed SGFCComposedPropertyValue object
/// that consists of two SGFCSimpleTextPropertyValue objects, which have
/// the SimpleText values @a simpleTextValue1 and @a simpleTextValue2.
///
/// @exception NSInvalidArgumentException Is raised if @a simpleTextValue1
/// is @e nil or if @a simpleTextValue2 is @e nil.
+ (SGFCComposedPropertyValue*) composedPropertyValueWithSimpleText:(NSString*)simpleTextValue1
                                                        simpleText:(NSString*)simpleTextValue2;

/// @brief Returns a newly constructed SGFCComposedPropertyValue object
/// that consists of an SGFCNumberPropertyValue object and an
/// SGFCSimpleTextPropertyValue object, which have the SGFCNumber and
/// SimpleText values @a numberValue and @a simpleTextValue, respectively.
///
/// @exception NSInvalidArgumentException Is raised if @a simpleTextValue
/// is @e nil.
+ (SGFCComposedPropertyValue*) composedPropertyValueWithNumber:(SGFCNumber)numberValue
                                                    simpleText:(NSString*)simpleTextValue;

/// @brief Returns a newly constructed SGFCComposedPropertyValue object
/// that consists of two SGFCPointPropertyValue objects, which have the
/// Point values @a pointValue1 and @a pointValue2, respectively.
///
/// @exception NSInvalidArgumentException Is raised if @a pointValue1
/// is @e nil or if @a pointValue2 is @e nil.
+ (SGFCComposedPropertyValue*) composedPropertyValueWithPoint:(NSString*)pointValue1
                                                        point:(NSString*)pointValue2;

/// @brief Returns a newly constructed SGFCComposedPropertyValue object
/// that consists of an SGFCPointPropertyValue object and an
/// SGFCSimpleTextPropertyValue object, which have the Point and SimpleText
/// values @a pointValue and @a simpleTextValue, respectively.
///
/// @exception NSInvalidArgumentException Is raised if @a pointValue
/// is @e nil or if @a simpleTextValue is @e nil.
+ (SGFCComposedPropertyValue*) composedPropertyValueWithPoint:(NSString*)pointValue
                                                   simpleText:(NSString*)simpleTextValue;

/// @brief Returns a newly constructed SGFCComposedPropertyValue object
/// that consists of an SGFCStonePropertyValue object and an
/// SGFCPointPropertyValue object, which have the Stone and Point values
/// @a stoneValue and @a pointValue, respectively.
///
/// @exception NSInvalidArgumentException Is raised if @a stoneValue
/// is @e nil or if @a pointValue is @e nil.
+ (SGFCComposedPropertyValue*) composedPropertyValueWithStone:(NSString*)stoneValue
                                                        point:(NSString*)pointValue;

/// @brief Returns a newly constructed SGFCComposedPropertyValue object
/// that consists of two SGFCSinglePropertyValue objects @a valueObject1
/// and @a valueObject2.
///
/// @exception NSInvalidArgumentException Is raised if @a valueObject1
/// is @e nil or if @a valueObject2 is @e nil.
+ (SGFCComposedPropertyValue*) composedPropertyValueWithValue1:(SGFCSinglePropertyValue*)valueObject1
                                                        value2:(SGFCSinglePropertyValue*)valueObject2;
//@}

/// @name Composed property values - Go game value types
//@{
/// @brief Returns a newly constructed SGFCComposedPropertyValue object
/// that consists of two SGFCGoPointPropertyValue objects, which have the
/// Point values @a pointValue1 and @a pointValue2, respectively.
///
/// @exception NSInvalidArgumentException Is raised if @a pointValue1
/// is @e nil or if @a pointValue2 is @e nil.
+ (SGFCComposedPropertyValue*) composedPropertyValueWithGoPoint:(NSString*)pointValue1
                                                        goPoint:(NSString*)pointValue2
                                                      boardSize:(SGFCBoardSize)boardSize;

/// @brief Returns a newly constructed SGFCComposedPropertyValue object
/// that consists of an SGFCGoPointPropertyValue object and an
/// SGFCSimpleTextPropertyValue object, which have the Point and SimpleText
/// values @a pointValue and @a simpleTextValue, respectively.
///
/// @exception NSInvalidArgumentException Is raised if @a pointValue
/// is @e nil or if @a simpleTextValue is @e nil.
+ (SGFCComposedPropertyValue*) composedPropertyValueWithGoPoint:(NSString*)pointValue
                                                      boardSize:(SGFCBoardSize)boardSize
                                                     simpleText:(NSString*)simpleTextValue;

/// @brief Returns a newly constructed SGFCComposedPropertyValue object
/// that consists of an SGFCGoStonePropertyValue object and an
/// SGFCGoPointPropertyValue object, which have the Stone and Point values
/// @a stoneValue and @a pointValue, respectively.
///
/// @exception NSInvalidArgumentException Is raised if @a stoneValue
/// is @e nil or if @a pointValue is @e nil.
+ (SGFCComposedPropertyValue*) composedPropertyValueWithGoStone:(NSString*)stoneValue
                                                          color:(SGFCColor)color
                                                        goPoint:(NSString*)pointValue
                                                      boardSize:(SGFCBoardSize)boardSize;
//@}

@end
