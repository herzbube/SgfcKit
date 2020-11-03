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
#import "SGFCPropertyType.h"

// System includes
#import <Foundation/NSObject.h>

// Forward declarations
@class NSArray;
@class SGFCProperty;

/// @brief The SGFCNode class provides access to the data of a single
/// SGF node in a tree of SGF nodes. SGFCNode also provides methods to
/// navigate the game tree. SGFCNode provides no methods to manipulate the
/// game tree - use SGFCTreeBuilder for that purpose.
///
/// @ingroup public-api
/// @ingroup game-tree
///
/// SGFCNode does not provide a stable object identity for the node objects
/// returned by its properties. For instance if you invoke the @e firstChild
/// property two times in a row and then compare the object references you will
/// find that they are different. However, the two objects will compare as
/// equal so that they can be properly used within collections.
///
/// @verbatim
/// SGFCNode* aNode = [...]
///
/// SGFCNode* firstChild1 = aNode.firstChild;
/// SGFCNode* firstChild2 = aNode.firstChild;
///
/// BOOL objectsHaveSameIdentity = (firstChild1 == firstChild2);     // NO
/// BOOL objectsAreEqual = ([firstChild1 isEqual:firstChild2]);      // YES
/// BOOL nodesAreEqual = ([firstChild1 isEqualToNode:firstChild2]);  // YES
///
/// NSMutableDictionary aDictionary = [...]
/// aDictionary[firstChild1] = "foo";
/// aDictionary[firstChild2] = "bar";        // Overwrites the previous entry
/// int numberOfEntries = aDictionary.count  // 1
/// @endverbatim
@interface SGFCNode : NSObject
{
}

/// @brief Returns a newly constructed SGFCNode object that has no parent,
/// child or sibling and is not associated with any game.
+ (SGFCNode*) node;

/// @brief Initializes an SGFCNode object that has no parent,
/// child or sibling and is not associated with any game.
///
/// This is the designated initializer of SGFCNode.
- (id) init NS_DESIGNATED_INITIALIZER;

/// @brief Returns a Boolean value that indicates whether the receiver and a
/// given SGFCNode object are equal.
- (BOOL) isEqualToNode:(SGFCNode*)aNode;

/// @brief Returns a Boolean value that indicates whether the receiver and a
/// given object are equal.
///
/// NSObject override.
- (BOOL) isEqual:(id)anObject;

/// @brief Returns an integer that can be used as a table address in a hash
/// table structure.
///
/// NSObject override.
- (NSUInteger) hash;

/// @brief Returns the node's first child node. Returns @e nil if
/// the node has no children.
@property(nonatomic, strong, readonly) SGFCNode* firstChild;

/// @brief Returns the node's last child node. Returns @e nil if
/// the node has no children.
@property(nonatomic, strong, readonly) SGFCNode* lastChild;

/// @brief Returns a collection of child nodes of the node. The collection
/// is ordered, beginning with the first child node and ending with the
/// last child node. The collection is empty if the node has no children.
@property(nonatomic, strong, readonly) NSArray* children;

/// @brief Returns YES if the node has one or more children. Returns
/// NO if the node has no children.
@property(nonatomic, readonly) BOOL hasChildren;

/// @brief Returns the node's next sibling node. Returns @e nil if
/// the node has no next sibling node, i.e. if the node is the last child
/// of its parent.
@property(nonatomic, strong, readonly) SGFCNode* nextSibling;

/// @brief Returns YES if the node has a next sibling node. Returns NO
/// if the node has no next sibling node, i.e. if the node is the last child
/// of its parent.
@property(nonatomic, readonly) BOOL hasNextSibling;

/// @brief Returns the node's previous sibling node. Returns @e nil if
/// the node has no previous sibling node, i.e. if the node is the first
/// child of its parent.
@property(nonatomic, strong, readonly) SGFCNode* previousSibling;

/// @brief Returns YES if the node has a previous sibling node. Returns
/// NO if the node has no previous sibling node, i.e. if the node is the
/// first child of its parent.
@property(nonatomic, readonly) BOOL hasPreviousSibling;

/// @brief Returns the node's parent node. Returns @e nil if the node
/// has no parent node, i.e. if the node is the root node of a game tree.
@property(nonatomic, weak, readonly) SGFCNode* parent;

/// @brief Returns YES if the node has a parent node. Returns NO if the
/// node has no parent node, i.e. if the node is the root node of a game
/// tree.
@property(nonatomic, readonly) BOOL hasParent;

/// @brief Returns YES if the node is a descendant of @a node, i.e. if the
/// node is anywhere below @a node in the game tree. Returns NO if the
/// node is not a descendant of @a node.
///
/// @exception NSInvalidArgumentException Is raised if @a node is @e nil.
- (BOOL) isDescendantOfNode:(SGFCNode*)node;

/// @brief Returns YES if the node is an ancestor of @a node, i.e. if the
/// node is a direct or indirect parent of @a node. Returns NO if the
/// node is not an ancestor of @a node.
///
/// @exception NSInvalidArgumentException Is raised if @a node is @e nil.
- (BOOL) isAncestorOfNode:(SGFCNode*)node;

/// @brief Returns the root node of the game tree that contains the node.
/// Returns @e nil if the node is already the root node.
@property(nonatomic, strong, readonly) SGFCNode* root;

/// @brief Returns YES if the node is the root node of a game tree. Returns
/// NO if the node is not the root node of a game tree.
@property(nonatomic, readonly) BOOL isRoot;

/// @brief A collection with the properties of the node. The collection is empty
/// if the node has no properties. The collection has no particular order.
/// No SGFCPropertyType except #SGFCPropertyTypeUnknown may appear more than
/// once in the collection. No property name may appear more than once in the
/// collection.
///
/// The SGF standard defines that only one of each property is allowed per
/// node. This is the reason why the setter prevents setting a collection
/// that contains duplicate property types or names. Names are checked to
/// prevent duplicates of custom properties, which have
/// #SGFCPropertyTypeUnknow.
///
/// The SGF standard does not define an order in which properties have to
/// appear within a node. In fact, it explicitly states that different
/// applications may use different ordering, and that the order may change
/// every time that the SGF data is saved.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value, or if the property is set with a collection that contains
/// @e nil elements, or if an SGFCPropertyType other than
/// #SGFCPropertyTypeUnknown appears more than once in the collection, or if a
/// property name appears more than once in the collection.
@property(nonatomic, strong) NSArray* properties;

/// @brief Returns the property with the specified type @a propertyType if
/// the node has such a property. Returns @e nil if the node has no
/// such property.
///
/// The SGF standard defines that only one of each property is allowed per
/// node.
- (SGFCProperty*) propertyWithType:(SGFCPropertyType)propertyType;

@end
