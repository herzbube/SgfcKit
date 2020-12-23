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

// TODO Cleanup unneeded stuff

// Project includes
#import "SGFCBoardSize.h"
#import "SGFCGameType.h"
#import "SGFCPropertyType.h"
#import "SGFCTypedefs.h"

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

///// @name ISgfcMessage related constants
////@{
///// @brief Indicates an invalid line number. This is used for fatal error
///// messages that do not refer to a specific line number in a piece of
///// SGF content.
//extern const int SGFCInvalidLineNumber;
///// @brief Indicates an invalid column number. This is used for fatal error
///// messages that do not refer to a specific column number in a piece of
///// SGF content.
//extern const int SGFCInvalidColumnNumber;
////@}

/// @name String constants defined by the SGF standard
//@{
/// @brief The raw string value that corresponds to the None value as
/// defined by the SGF standard.
///
/// The SGF standard defines this to be an empty string.
//extern NSString* SGFCNoneValueString;
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
//extern NSString* SGFCGoMovePassString;
///// @brief Maps property names as defined by the SGF standard to values from
///// the enumeration SGFCPropertyType.
//extern const std::map<NSString*, SGFCPropertyType> SGFCPropertyNameToPropertyTypeMap;
///// @brief Maps values from the enumeration SGFCPropertyType to property
///// names as defined by the SGF standard. #SGFCPropertyTypeUnknown does
///// not appear in the map.
//extern const std::map<SGFCPropertyType, NSString*> SGFCPropertyTypeToPropertyNameMap;
///// @brief Maps game type Number values as defined by the SGF standard to
///// values from the enumeration SGFCGameType.
//extern const std::map<SgfcNumber, SGFCGameType> SGFCGameTypeAsNumberToGameTypeMap;
///// @brief Maps values from the enumeration SGFCGameType to Number values
///// as defined by the SGF standard. SGFCGameTypeUnknown does not appear
///// in the map.
//extern const std::map<SGFCGameType, SgfcNumber> SGFCGameTypeToGameTypeAsNumberMap;
//@}

/// @name Other constants for values defined by the SGF standard
//@{
/// @brief The default game type if the #SGFCPropertyTypeGM property does
/// not exist.
///
/// The SGF standard defines this to be #SGFCGameTypeGo.
extern const SGFCGameType SGFCDefaultGameType;

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
///   #BoardSizeMaximumGo, or if the board size is not square.
///
/// SGFCGame::boardSize() returns this value, for instance, if the
/// #SGFCPropertyTypeSZ property is present in a game's root node but has
/// an invalid size.
extern const SGFCBoardSize SGFCBoardSizeInvalid;
//@}
