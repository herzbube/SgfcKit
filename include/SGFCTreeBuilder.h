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

// System includes
#import <Foundation/NSObject.h>

// Forward declarations
@class SGFCGame;
@class SGFCNode;

/// @brief The SGFCTreeBuilder interface provides methods to manipulate the
/// nodes of a game tree.
///
/// @ingroup public-api
/// @ingroup game-tree
///
/// Do @b NOT attempt to create an SGFCTreeBuilder object yourself, instead
/// always use the SGFCTreeBuilder object provided by an SGFCGame instance
/// whose game tree you want to manipulate.
@interface SGFCTreeBuilder : NSObject
{
}

/// @brief Do @b NOT use this initializer.
- (instancetype) init NS_UNAVAILABLE;

/// @brief Returns the SGFCGame object whose game tree the methods in the
/// SGFCTreeBuilder operate on.
@property(nonatomic, weak, readonly) SGFCGame* game;

/// @brief Sets the first child node of @a node to @a child, replacing
/// everything below @a node with @a child (which may be @e nil). Use
/// insertChild:ToNode:beforeReferenceChild:() if you want to keep the existing
/// nodes below @a node.
///
/// If @a child is already part of the game tree in some other
/// location, it is moved, together with the entire sub tree dangling from
/// it, from its current location to the new location.
///
/// The previous first child node, the siblings behind that, and the sub
/// trees dangling from all of these nodes, are discarded once no one holds
/// a reference to them anymore.
///
/// @exception NSInvalidArgumentException Is raised if @a node is @e nil,
/// if @a child is an ancestor of @a node, or if @a child is equal to
/// @a node.
- (void) setFirstChild:(SGFCNode*)child
                ofNode:(SGFCNode*)node;

/// @brief Adds @a child as the last child to @a node. @a child may not
/// be @e nil.
///
/// If @a child is already part of the game tree in some other
/// location, it is moved, together with the entire sub tree dangling from
/// it, from its current location to the new location.
///
/// This method exists for convenience. The operations it performs can also
/// be achieved by invoking insertChild:ToNode:beforeReferenceChild:() and
/// specifying @e nil as the @a referenceChild argument.
///
/// @exception NSInvalidArgumentException Is raised if @a node is @e nil,
/// if @a child is @e nil, if @a child is an ancestor of @a node, or
/// if @a child is equal to @a node.
- (void) appendChild:(SGFCNode*)child
              toNode:(SGFCNode*)node;

/// @brief Inserts @a child as a child to @a node, before the reference
/// child node @a referenceChild. @a child may not be @e nil.
/// @a referenceChild may be @e nil, but if it's not then it must be a
/// child of @a node.
///
/// If @a referenceChild is @e nil then @a child is inserted as the
/// last child of @a node. The result is the same as if appendChild:ToNode:()
/// had been invoked on @a node.
///
/// If @a child is already part of the game tree in some other
/// location, it is moved, together with the entire sub tree dangling from
/// it, from its current location to the new location.
///
/// @exception NSInvalidArgumentException Is raised if @a node is @e nil,
/// if @a child is @e nil, if @a referenceChild is not @e nil
/// but it's not a child of the node, if @a child is an ancestor of @a node,
/// or if @a child is equal to @a node.
- (void) insertChild:(SGFCNode*)child
              toNode:(SGFCNode*)node
beforeReferenceChild:(SGFCNode*)referenceChild;

/// @brief Removes @a child from @a node. @a child may not be @e nil.
/// @a child must be a child of the node.
///
/// The game tree is relinked to close the gap.
///
/// @a child and the entire sub tree dangling from it, is discarded once
/// no one holds a reference to it anymore.
///
/// @exception NSInvalidArgumentException Is raised if @a node is @e nil,
/// if @a child is @e nil, or if @a child is not a child of @a node.
- (void) removeChild:(SGFCNode*)child
            fromNode:(SGFCNode*)node;

/// @brief Replaces @a oldChild with @a newChild. @a oldChild and
/// @a newChild may not be @e nil. @a oldChild must be a child of
/// @a node.
///
/// If @a newChild is already part of the game tree in some other
/// location, it is moved, together with the entire sub tree dangling from
/// it, from its current location to the new location.
///
/// @a oldChild and the entire sub tree dangling from it, is discarded
/// once no one holds a reference to it anymore.
///
/// @exception NSInvalidArgumentException Is raised if @a node is @e nil,
/// if @a oldChild or @a newChild are @e nil, if @a oldChild is not a
/// child of @a node, if @a newChild is an ancestor of @a node, or if
/// @a newChild is equal to @a node.
- (void) replaceChild:(SGFCNode*)oldChild
         withNewChild:(SGFCNode*)newChild
               inNode:(SGFCNode*)node;

/// @brief Sets the next sibling node of @a node to @a nextSibling,
/// replacing the previous next sibling node, the siblings behind that, and
/// the sub trees dangling from all of these siblings with @a nextSibling
/// (which may be @e nil). Use insertChild:ToNode:beforeReferenceChild:() if you
/// want to keep the next sibling nodes.
///
/// @a node must not be the root node of a game tree because a root node by
/// definition can't have siblings.
///
/// If @a nextSibling is already part of the game tree in some other
/// location, it is moved, together with the entire sub tree dangling from
/// it, from its current location to the new location.
///
/// The previous next sibling node, the siblings behind that, and the sub
/// trees dangling from all of these siblings, are discarded once no one
/// holds a reference to them anymore.
///
/// @exception NSInvalidArgumentException Is raised if @a node is @e nil,
/// if @a node is the root node of a game tree, if @a nextSibling is not
/// @e nil and an ancestor of @a node, or if @a nextSibling is equal
/// to @a node.
- (void) setNextSibling:(SGFCNode*)nextSibling
                 ofNode:(SGFCNode*)node;

/// @brief Sets the parent node of @a node to @a parent.
/// @a parent may be @e nil.
///
/// If @a parent is not @e nil and @a node is already a child of
/// @a parent, then this method has no effect.
///
/// If @a parent is not @e nil and @a node is not yet a child of
/// @a parent, then @a node is added as the last child of @a parent. The
/// result is the same as if appendChild:ToNode:() had been invoked on @a parent
/// with @a node as the argument.
///
/// If @a parent is not @e nil and if @a node is already part of the
/// game tree in some other location, @a node is moved, together with the
/// entire sub tree dangling from it, from its current location to the
/// new location.
///
/// If @a parent is @e nil then @a node and the entire sub tree
/// dangling from it, is discarded once no one holds a reference to it
/// anymore. The game tree is relinked to close the gap. The result is the
/// same as if removeChild:fromNode:() had been invoked on the node's parent
/// with @a node as the argument.
///
/// @exception NSInvalidArgumentException Is raised if @a node is @e nil,
/// if @a parent is a descendant of @a node, or if @a parent is equal to
/// @a node.
- (void) setParent:(SGFCNode*)parent
            ofNode:(SGFCNode*)node;

@end
