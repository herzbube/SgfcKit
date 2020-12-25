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

/// @brief The SGFCGame clas provides access to the data of one SGF
/// game tree, in the form of a tree of SGFCNode objects.
///
/// @ingroup public-api
/// @ingroup game-tree
///
/// Each branch in the game tree is either a separate game, or a variation in
/// game play for its parent game. A tree without branches is a single game
/// without variations.
///
/// A list of games can be obtained by invoking gameInfoNodes().
///
/// According to the SGF standard, the game tree's root node must contain
/// root properties, which are used to define some global "attributes" that
/// affect all games. Notably these include the game type and the board size.
/// This means that if a game tree contains multiple games, all of them must
/// have the same game type and the same board size.
@interface SGFCGame : NSObject
{
}

/// @brief Returns a newly constructed SGFCGame object. The game type is
/// #SGFCDefaultGameType. The game is not associated with any
/// document. The game has a game tree that consists of an empty root node.
+ (instancetype) game;

/// @brief Returns a newly constructed SGFCGame object. The game tree's
/// root node is @a rootNode. The game type depends on the content of the
/// root node. The game is not associated with any document. The SGFCGame
/// object takes ownership of @a rootNode.
///
/// If @a rootNode is @e nil the returned SGFCGame object has no game tree and
/// its game type is #SGFCDefaultGameType.
+ (instancetype) gameWithRootNode:(SGFCNode*)rootNode;

/// @brief Initializes an SGFCGame object. The game type is
/// #SGFCDefaultGameType. The game is not associated with any
/// document. The game has a game tree that consists of an empty root node.
- (instancetype) init;

/// @brief Initializes an SGFCGame object. The game tree's
/// root node is @a rootNode. The game type depends on the content of the
/// root node. The game is not associated with any document. The SGFCGame
/// object takes ownership of @a rootNode.
///
/// If @a rootNode is @e nil the SGFCGame object is initialized without a game
/// tree and with game type #SGFCDefaultGameType.
///
/// This is the designated initializer of SGFCGame.
- (instancetype) initWithRootNode:(SGFCNode*)rootNode NS_DESIGNATED_INITIALIZER;

/// @brief Returns the property value(s) found in the root node property of
/// type #SGFCPropertyTypeGM, interpreted as an SGFCGameType value.
///
/// @retval SGFCGameType If the property is present and has a single Number
///         value, and that value is defined in the SGF standard, then the
///         SGFCGameType value that corresponds to the Number value is
///         returned. The value is guaranteed not to be
///         #SGFCGameTypeUnknown.
/// @retval #SGFCDefaultGameType If the property is not present,
///         or if the game has no root node, or if the property is present
///         but has no value. The value is guaranteed not to be
///         #SGFCGameTypeUnknown.
/// @retval #SGFCGameTypeUnknown If the property is present but its
///         value(s) cannot be converted to a Number value (the property
///         has more than one value, or the single value is not a Number
///         value), or if conversion is possible but the Number value is
///         not defined in the SGF standard. Invoke gameTypeAsNumber()
///         to obtain the game type as Number value.
@property(nonatomic, readonly) SGFCGameType gameType;

/// @brief Returns the property value(s) found in the root node property of
/// type #SGFCPropertyTypeGM, as an SGFCNumber value.
///
/// This is useful if gameType() returns #SGFCGameTypeUnknown because
/// the Number value is not defined in the SGF standard and cannot be
/// mapped to a member of the enumeration SGFCGameType.
///
/// @retval SGFCNumber If the property is present and contains a single
///         Number value, then that Number value is returned. If the
///         property is not present, or if the game has no root node, or if
///         the property is present but has no value, then this method
///         returns the Number value that corresponds to
///         #SGFCDefaultGameType.
/// @retval #SGFCGameTypeNaN If the property is present but its
///         value(s) cannot be converted to a Number value, either because
///         the property has more than one value, or its single value is
///         not a Number value.
@property(nonatomic, readonly) SGFCNumber gameTypeAsNumber;

/// @brief Returns YES if the game has a board size. Returns NO if the
/// game has no board size.
///
/// The game has no board size if boardSize() returns
/// #SGFCBoardSizeNone or #SGFCBoardSizeInvalid.
///
/// @exception #SGFCInvalidOperationException Is raised if a property object
/// for #SGFCPropertyTypeSZ is found in the game's root node, but the property
/// object is not an instance of SGFCBoardSizeProperty.
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
///         either its property value(s) cannot be converted to an
///         SGFCBoardSize value (the property has more than one value, or
///         it has a single value that is neither a Number nor a composed
///         value consisting of two Number values), or if conversion is
///         possible but the SGFCBoardSize value violates the constraints
///         defined by the SGF standard. See the documentation of
///         #SGFCBoardSizeInvalid for details.
@property(nonatomic, readonly) SGFCBoardSize boardSize;

/// @brief Returns YES if the game has a root node. Returns NO if the
/// game has no root node.
@property(nonatomic, readonly) BOOL hasRootNode;

/// @brief The game tree's root node. Returns @e nil if hasRootNode() returns
/// NO. Setting a new value discards the previous root node, and with it the
/// entire previous game tree.
@property(nonatomic, strong) SGFCNode* rootNode;

/// @brief Returns the game tree's game info nodes. Returns an empty list
/// if the game tree has no game info nodes.
///
/// This is a convenience method that searches the game tree's nodes on
/// behalf of the caller and returns the result. The search logic is this:
/// - Starting with the root node every node is examined whether it contains
///   one or more game info properties. These are properties that are
///   classified as #SGFCPropertyCategoryGameInfo.
/// - When a node contains at least one game info property it is
///   considered to be a game info node and included in the search result
///   returned by the method.
/// - The search does not continue below a game info node. This is because
///   the SGF standard mandates that there may be only one game info node
///   on any path within a tree of nodes. If the root node contains at
///   least one game info property, the search result will therefore contain
///   only the root node. Since game info properties are usually stored in
///   the root node this is actually the expected outcome for most of the
///   SGF content out there.
/// - The search is performed depth-first.
///
/// @see #SGFCNodeTraitsGameInfo
@property(nonatomic, strong, readonly) NSArray* gameInfoNodes;

/// @brief Returns an SGFCTreeBuilder object that can be used to manipulate the
/// game tree.
@property(nonatomic, strong, readonly) SGFCTreeBuilder* treeBuilder;

@end
