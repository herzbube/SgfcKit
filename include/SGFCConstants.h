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
#import "SGFCGameType.h"
#import "SGFCNodeTraits.h"
#import "SGFCPropertyTraits.h"
#import "SGFCTypedefs.h"

// System includes
#import <Foundation/NSDictionary.h>

// Forward declarations
@class NSString;


/// @file
///
/// @brief This file defines the library's public constants.
///
/// @ingroup public-api
/// @ingroup library-support


/// @name SgfcKit constants
//@{
/// @brief The library name.
extern NSString* SGFCLibraryName;
/// @brief The library version.
extern NSString* SGFCLibraryVersion;
/// @brief The SGFC version used by the library.
extern NSString* SGFCSgfcVersion;
//@}

/// @name ISgfcMessage related constants
//@{
/// @brief Indicates an invalid line number. This is used for messages
/// that do not refer to a specific line number in a piece of SGF content.
extern const int SGFCInvalidLineNumber;
/// @brief Indicates an invalid column number. This is used for messages
/// that do not refer to a specific column number in a piece of SGF content.
extern const int SGFCInvalidColumnNumber;
/// @brief A library error number (= errno value) indicating "no error".
/// This is defined to be the value 0 (zero).
extern const int SGFCLibraryErrorNumberNoError;
//@}

/// @name String constants defined by the SGF standard
//@{
/// @brief The raw string value that corresponds to the None value as
/// defined by the SGF standard.
///
/// The SGF standard defines this to be an empty string.
extern NSString* SGFCNoneValueString;
/// @brief The raw string value that corresponds to the Double value
/// #SGFCDoubleNormal, as defined by the SGF standard.
///
/// The SGF standard defines this to be the string "1".
extern NSString* SGFCDoubleNormalString;
/// @brief The raw string value that corresponds to the Double value
/// #SGFCDoubleEmphasized, as defined by the SGF standard.
///
/// The SGF standard defines this to be the string "2".
extern NSString* SGFCDoubleEmphasizedString;
/// @brief The raw string value that corresponds to the Color value
/// #SGFCColorBlack, as defined by the SGF standard.
///
/// The SGF standard defines this to be the string "B".
extern NSString* SGFCColorBlackString;
/// @brief The raw string value that corresponds to the Color value
/// #SGFCColorWhite, as defined by the SGF standard.
///
/// The SGF standard defines this to be the string "W".
extern NSString* SGFCColorWhiteString;
/// @brief The raw string value that corresponds to a pass Move value for
/// #SGFCGameTypeGo, as defined by the SGF standard.
///
/// The SGF standard defines this to be an empty string.
extern NSString* SGFCGoMovePassString;
//@}

/// @name String constants defined by the SGF standard for #SGFCPropertyTypeRU
//@{
/// @brief The #SGFCPropertyTypeRU property value defined by the SGF
/// standard to denote #SGFCGoRulesetTypeAGA.
extern NSString* SGFCGoRulesetAGA;
/// @brief The #SGFCPropertyTypeRU property value defined by the SGF
/// standard to denote #SGFCGoRulesetTypeIng.
extern NSString* SGFCGoRulesetIng;
/// @brief The #SGFCPropertyTypeRU property value defined by the SGF
/// standard to denote #SGFCGoRulesetTypeJapanese.
extern NSString* SGFCGoRulesetJapanese;
/// @brief The #SGFCPropertyTypeRU property value defined by the SGF
/// standard to denote #SGFCGoRulesetTypeNZ.
extern NSString* SGFCGoRulesetNZ;
//@}

/// @name Mappings between libsgfc++ values and SGF standard values, and vice versa
//@{
/// @brief Maps property names as defined by the SGF standard to values from
/// the enumeration SGFCPropertyType. Dictionary keys = NSString objects,
/// dictionary values = NSNumber objects wrapping an SGFCPropertyType value.
extern NSDictionary* SGFCPropertyNameToPropertyTypeMap;
/// @brief Maps values from the enumeration SGFCPropertyType to property
/// names as defined by the SGF standard. #SGFCPropertyTypeUnknown does
/// not appear in the map. Dictionary keys = NSNumber objects wrapping an
/// SGFCPropertyType value, dictionary values = NSString objects.
extern NSDictionary* SGFCPropertyTypeToPropertyNameMap;

/// @brief Maps values from the enumeration SGFCPropertyType to values from
/// the enumeration SGFCPropertyCategory. Dictionary keys = NSNumber objects
/// wrapping an SGFCPropertyType value, dictionary values = NSNumber objects
/// wrapping an SGFCPropertyCategory value.
extern NSDictionary* SGFCPropertyTypeToPropertyCategoryMap;
/// @brief Maps values from the enumeration SGFCPropertyType to
/// SGFCPropertyTraits values. Dictionary keys = NSNumber objects
/// wrapping an SGFCPropertyType value, dictionary values = NSNumber objects
/// wrapping an SGFCPropertyTrait value.
extern NSDictionary* SGFCPropertyTypeToPropertyTraitsMap;

/// @brief Maps game type Number values as defined by the SGF standard to
/// values from the enumeration SGFCGameType. Dictionary keys = NSNumber objects
/// wrapping an int value (NSNumber::numberWithInt:()), dictionary values =
/// NSNumber objects wrapping an SGFCGameType value.
extern NSDictionary* SGFCGameTypeAsNumberToGameTypeMap;
/// @brief Maps values from the enumeration SGFCGameType to Number values
/// as defined by the SGF standard. SGFCGameTypeUnknown does not appear
/// in the map. Dictionary keys = NSNumber objects wrapping an SGFCGameType
/// value, dictionary values = NSNumber objects wrapping an int value
/// (NSNumber::numberWithInt:()).
extern NSDictionary* SGFCGameTypeToGameTypeAsNumberMap;
//@}

/// @name Other constants for values defined by the SGF standard
//@{
/// @brief The default game type if the #SGFCPropertyTypeGM property does
/// not exist.
///
/// The SGF standard defines this to be #SGFCGameTypeGo.
extern const SGFCGameType SGFCDefaultGameType;

/// @brief An SGFCNumber value that denotes a game type that is
/// "not a number".
///
/// SGFCGame and SGFCGameTypeProperty both provide a gameTypeAsNumber()
/// property to obtain the raw SGFCNumber value of an #SGFCPropertyTypeGM
/// property. If the raw SGFCNumber value cannot be determined because it
/// has multiple property values, or a single property value that cannot be
/// converted to an SGFCNumber value, then the gameTypeAsNumber() properties
/// return this constant.
///
/// The constant has an underlying numeric value, but one that is extremely
/// unlikely to occur in real SGF content. Do not rely on the actual
/// constant's numeric value.
extern const SGFCNumber SGFCGameTypeNaN;

/// @brief The minimum board size that is required for #SGFCPropertyTypeSZ.
///
/// The SGF standard defines this to be 1x1.
extern const SGFCBoardSize SGFCBoardSizeMinimum;

/// @brief The maximum board size that is allowed for #SGFCPropertyTypeSZ
/// if the game type is #SGFCGameTypeGo.
///
/// The SGF standard defines this to be 52x52.
extern const SGFCBoardSize SGFCBoardSizeMaximumGo;

/// @brief The default board size if the game type is #SGFCGameTypeGo.
///
/// The SGF standard defines this to be 19x19.
extern const SGFCBoardSize SGFCBoardSizeDefaultGo;

/// @brief The default board size if the game type is #SGFCGameTypeChess.
///
/// The SGF standard defines this to be 8x8.
extern const SGFCBoardSize SGFCBoardSizeDefaultChess;
//@}

/// @name Exception names
//@{
/// @brief Exception that is raised when invoking a method or operation is
/// invalid for the receiver's current state.
extern NSExceptionName const SGFCInvalidOperationException;

/// @brief Exception that is raised when SgfcKit encounters an error in the
/// way how an SGFCDocument is structured.
extern NSExceptionName const SGFCDocumentStructureException;

/// @brief Exception that is raised when a requested method or operation is not
/// implemented.
extern NSExceptionName const SGFCNotImplementedException;
//@}

/// @name Other constants
//@{
/// @brief A board size value denoting "no board size".
///
/// SGFCGame::boardSize() returns this value, for instance, if the
/// #SGFCPropertyTypeSZ property is not present in a game's root node,
/// or if the game has no root node, and the game type is not one of the
/// few game types with a known default board size.
extern const SGFCBoardSize SGFCBoardSizeNone;

/// @brief A board size value denoting "invalid board size".
///
/// A board size is invalid if it violates the constraints defined by the
/// SGF standard:
/// - All game types: If the board size is below the minimum size
///   #BoardSizeMinimum.
/// - For #SGFCGameTypeGo: If the board size is above the maximum size
///   #BoardSizeMaximumGo.
///
/// SGFCGame::boardSize() returns this value, for instance, if the
/// #SGFCPropertyTypeSZ property is present in a game's root node but has
/// an invalid size.
extern const SGFCBoardSize SGFCBoardSizeInvalid;

/// @brief A Number value that denotes "no handicap stones" value for
/// #SGFCPropertyTypeHA (a Go specific property).
extern const SGFCNumber SGFCHandicapStonesNone;

/// @brief A Real value that denotes "no komi" value for
/// #SGFCPropertyTypeKM (a Go specific property).
extern const SGFCReal SGFCKomiNone;

/// @brief An SGFCNodeTraits value that denotes a node that has no traits.
extern const SGFCNodeTraits SGFCNodeTraitsNone;

/// @brief An SGFCNodeTraits value that denotes a node that has all traits.
/// It makes no sense for a node to actually have all traits, this is merely
/// a convenience constant for working with flags.
///
/// This constant is set up to have all bits set in the underlying primitive
/// numeric type, so you should not rely on any particular numeric value.
extern const SGFCNodeTraits SGFCNodeTraitsAll;

/// @brief An SGFCPropertyTraits value that denotes a property that has no
/// traits.
extern const SGFCPropertyTraits SGFCPropertyTraitsNone;

/// @brief An SGFCPropertyTraits value that denotes a property that has all
/// traits. It makes no sense for a property to actually have all traits,
/// this is merely a convenience constant for working with flags.
///
/// This constant is set up to have all bits set in the underlying primitive
/// numeric type, so you should not rely on any particular numeric value.
extern const SGFCPropertyTraits SGFCPropertyTraitsAll;
//@}
