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
#import "SGFCTypedefs.h"

// System includes
#import <Foundation/NSObject.h>

// Forward declarations
@class SGFCNode;
@class SGFCTreeBuilder;

/// @brief The SGFCGame class provides access to the data of one SGF game, in
/// the form of a tree of SGFCNode objects. Each branch in the tree is a
/// variation in game play. A tree without branches is a game without
/// variations.
///
/// @ingroup public-api
/// @ingroup game-tree
@interface SGFCGame : NSObject
{
}

/// @brief Returns a newly constructed SGFCGame object. The game type is
/// #SGFCDefaultGameType. The game is not associated with any
/// document. The game has no game tree.
+ (SGFCGame*) game;

/// @brief Returns a newly constructed SGFCGame object. The game tree's
/// root node is @a rootNode. The game type depends on the content of the
/// root node. The game is not associated with any document. The SGFCGame
/// object takes ownership of @a rootNode.
///
/// @exception NSInvalidArgumentException Is raised if @a rootNode is @e nil.
+ (SGFCGame*) gameWithRootNode:(SGFCNode*)rootNode;

/// @brief Initializes an SGFCGame object. The game type is
/// #SGFCDefaultGameType. The game is not associated with any
/// document. The game has no game tree.
- (id) init;

/// @brief Initializes an SGFCGame object. The game tree's
/// root node is @a rootNode. The game type depends on the content of the
/// root node. The game is not associated with any document. The SGFCGame
/// object takes ownership of @a rootNode.
///
/// This is the designated initializer of SGFCGame.
///
/// @exception NSInvalidArgumentException Is raised if @a rootNode is @e nil.
- (id) initWithRootNode:(SGFCNode*)rootNode;

/// @brief Returns the game type found in the root node property of type
/// #SGFCPropertyTypeGM, as an enumeration value.
///
/// @retval SGFCGameType If the property is present and has a value defined
///         in the SGF standard, returns the SGFCGameType value that
///         corresponds to the property value. The value is guaranteed not
///         to be #SGFCGameTypeUnknown.
/// @retval #SGFCDefaultGameType If the property is not present,
///         or if the game has no root node, or if the property is present
///         but has no value (e.g. while the game tree is being set up
///         programmatically). The value is guaranteed not to be
///         #SGFCGameTypeUnknown.
/// @retval #SGFCGameTypeUnknown If the property is present and has a value
///         that is not defined in the SGF standard. Invoke gameTypeAsNumber()
///         to obtain the game type as Number value.
///
/// @exception NSInternalInconsistencyException Is raised if a property object
/// for #SGFCPropertyTypeGM is found in the game's root node, but the property
/// object is not an instance of ISgfcGameTypeProperty.
@property(nonatomic, readonly) SGFCGameType gameType;

/// @brief Returns the game type found in the root node property of type
/// #SGFCPropertyTypeGM, as a Number value. This is useful if gameType()
/// returns #SGFCGameTypeUnknown because the Number value is not defined
/// in the SGF standard and cannot be mapped to a member of the enumeration
/// SGFCGameType.
///
/// @retval SGFCNumber The Number value of the root node's
///         #SGFCPropertyTypeGM property. If the property is not present,
///         or if the game has no root node, or if the property is present
///         but has no value (e.g. while the game tree is being set up
///         programmatically), this is the Number value that corresponds to
///         #SGFCDefaultGameType.
///
/// @exception NSInternalInconsistencyException Is raised if a property object
/// for #SGFCPropertyTypeGM is found in the game's root node, but the property
/// object is not an instance of ISgfcGameTypeProperty.
@property(nonatomic, readonly) SGFCNumber gameTypeAsNumber;

/// @brief Returns YES if the game has a board size. Returns NO if the
/// game has no board size.
///
/// The game has no board size if boardSize() returns
/// #SGFCBoardSizeNone or #SGFCBoardSizeInvalid.
///
/// @exception NSInternalInconsistencyException Is raised if a property object
/// for #SGFCPropertyTypeSZ is found in the game's root node, but the property
/// object is not an instance of ISgfcBoardSizeProperty.
@property(nonatomic, readonly) BOOL hasBoardSize;

/// @brief Returns the board size found in the root node property of type
/// #SGFCPropertyTypeSZ, as an SGFCBoardSize value.
///
/// @retval SGFCBoardSize If the property is present and has a valid value.
///         The value is guaranteed not to be #SGFCBoardSizeNone
///         nor #SGFCBoardSizeInvalid.
/// @retval #SGFCBoardSizeDefaultGo If gameType() returns
///         #SGFCGameTypeGo and one of the following is true: The game has
///         no root node, or the game has a root node but the property is
///         not present, or the game has a root node and the property is
///         present but has no value (e.g. while the game tree is being set
///         up programmatically).
/// @retval #SGFCBoardSizeDefaultChess If gameType() returns
///         #SGFCGameTypeChess and one of the following is true: The game
///         has a root node but the property is not present, or the game has
///         a root node and the property is present but has no value (e.g.
///         while the game tree is being set up programmatically).
/// @retval #SGFCBoardSizeNone If gameType() returns neither
///         #SGFCGameTypeGo nor #SGFCGameTypeChess (these are the two game
///         types for which the SGF standard defines a default board size)
///         and one of the following is true: The game has a root node but
///         the property is not present, or the game has a root node and the
///         property is present but has no value (e.g. while the game tree
///         is being set up programmatically).
/// @retval #SGFCBoardSizeInvalid If the property is present but
///         has an invalid value. A board size is invalid if it violates
///         the constraints defined by the SGF standard. See the
///         documentation of #SGFCBoardSizeInvalid for details.
///
/// @exception NSInternalInconsistencyException Is raised if a property object
/// for #SGFCPropertyTypeSZ is found in the game's root node, but the property
/// object is not an instance of ISgfcBoardSizeProperty.
@property(nonatomic, readonly) SGFCBoardSize boardSize;

/// @brief Returns YES if the game has a root node. Returns NO if the
/// game has no root node.
@property(nonatomic, readonly) BOOL hasRootNode;

/// @brief The game tree's root node. Returns @e nil if hasRootNode() returns
/// NO. Setting a new value discards the previous root node, and with it the
/// entire previous game tree.
@property(nonatomic, strong) SGFCNode* rootNode;

/// @brief Returns an SGFCTreeBuilder object that can be used to manipulate the
/// game tree.
@property(nonatomic, strong, readonly) SGFCTreeBuilder* treeBuilder;

@end
