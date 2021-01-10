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
#import "SGFCProperty.h"

// Forward declarations
@class SGFCComposedPropertyValue;
@class SGFCNumberPropertyValue;

/// @brief The SGFCBoardSizeProperty class is a specialization of
/// SGFCProperty for #SGFCPropertyTypeSZ. It simplifies access to the
/// property value and provides the value in the form of an SGFCBoardSize
/// object.
///
/// @ingroup public-api
/// @ingroup property
@interface SGFCBoardSizeProperty : SGFCProperty
{
}

/// @brief Returns a newly constructed SGFCBoardSizeProperty object that
/// has no value. The property is not associated with any node.
+ (instancetype) boardSizeProperty;

/// @brief Returns a newly constructed SGFCBoardSizeProperty object that
/// has the specified property value @a numberPropertyValue. The property is not
/// associated with any node. The SGFCBoardSizeProperty object takes
/// ownership of the SGFCNumberPropertyValue object @a numberPropertyValue.
///
/// This convenience constructor returns an SGFCBoardSizeProperty object that
/// describes a square board.
///
/// @exception NSInvalidArgumentException Is raised if @a numberPropertyValue is
/// @e nil.
+ (instancetype) boardSizePropertyWithNumberPropertyValue:(SGFCNumberPropertyValue*)numberPropertyValue;

/// @brief Returns a newly constructed SGFCBoardSizeProperty object that
/// has the specified property value @a composedPropertyValue. The property is
/// not associated with any node. The SGFCBoardSizeProperty object takes
/// ownership of the SGFCComposedPropertyValue object @a composedPropertyValue.
///
/// This convenience constructor returns an SGFCBoardSizeProperty object that
/// describes a rectangular board.
///
/// @exception NSInvalidArgumentException Is raised if @a composedPropertyValue
/// is @e nil or if the @a composedPropertyValue object is not composed of two
/// SGFCNumberPropertyValue objects.
+ (instancetype) boardSizePropertyWithComposedPropertyValue:(SGFCComposedPropertyValue*)composedPropertyValue;

/// @brief Initializes an SGFCBoardSizeProperty object. The property
/// has no value. The property is not associated with any node.
///
/// This is the designated initializer of SGFCBoardSizeProperty.
- (instancetype) init NS_DESIGNATED_INITIALIZER;

/// @brief Initializes an SGFCBoardSizeProperty object. The property
/// has the specified property value @a numberPropertyValue. The property is not
/// associated with any node. The SGFCBoardSizeProperty object takes
/// ownership of the SGFCNumberPropertyValue object @a numberPropertyValue.
///
/// The initialized SGFCBoardSizeProperty object
/// describes a square board.
///
/// @exception NSInvalidArgumentException Is raised if @a numberPropertyValue is
/// @e nil.
- (instancetype) initWithNumberPropertyValue:(SGFCNumberPropertyValue*)numberPropertyValue;

/// @brief Initializes an SGFCBoardSizeProperty object that
/// has the specified property value @a composedPropertyValue. The property is
/// not associated with any node. The SGFCBoardSizeProperty object takes
/// ownership of the SGFCComposedPropertyValue object @a composedPropertyValue.
///
/// The initialized SGFCBoardSizeProperty object
/// describes a rectangular board.
///
/// @exception NSInvalidArgumentException Is raised if @a composedPropertyValue
/// is @e nil or if the @a composedPropertyValue object is not composed of two
/// SGFCNumberPropertyValue objects.
- (instancetype) initWithComposedPropertyValue:(SGFCComposedPropertyValue*)composedPropertyValue;

/// @brief Returns the property value interpreted as an SgfcBoardSize value.
///
/// @retval SGFCBoardSize If the property has a valid value. The value is
///         guaranteed not to be #SGFCBoardSizeNone nor
///         #SGFCBoardSizeInvalid.
/// @retval #SGFCBoardSizeDefaultGo If the property has no value,
///         and @a gameType is #SGFCGameTypeGo.
/// @retval #SGFCBoardSizeDefaultChess If the property has no
///         value, and @a gameType is #SGFCGameTypeChess.
/// @retval #SGFCBoardSizeNone If the property has no value, but
///         @a gameType is neither #SGFCGameTypeGo nor #SGFCGameTypeChess.
/// @retval #SGFCBoardSizeInvalid If the property value(s) cannot
///         be converted to an SGFCBoardSize value (the property has more
///         than one value, or it has a single value that is neither a
///         Number nor a composed value consisting of two Number values),
///         or if conversion is possible but the SGFCBoardSize value
///         violates the constraints defined by the SGF standard. See the
///         documentation of #SGFCBoardSizeInvalid for details.
- (SGFCBoardSize) boardSizeForGameType:(SGFCGameType)gameType;

@end
