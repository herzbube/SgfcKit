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
#import "SGFCNodeTraits.h"
#import "SGFCPropertyCategory.h"
#import "SGFCPropertyType.h"

// System includes
#import <Foundation/NSObject.h>

// Forward declarations
@class NSArray;
@class SGFCGameInfo;
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
+ (instancetype) node;

/// @brief Initializes an SGFCNode object that has no parent,
/// child or sibling and is not associated with any game.
///
/// This is the designated initializer of SGFCNode.
- (instancetype) init NS_DESIGNATED_INITIALIZER;

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

/// @name Game tree navigation
//@{
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

/// @brief Returns YES if the node is the root node of a game tree. Returns
/// NO if the node is not the root node of a game tree.
@property(nonatomic, readonly) BOOL isRoot;
//@}

/// @name Node traits
//@{
/// @brief Returns the node's traits.
///
/// Returns #SGFCNodeTraitsNone if the node is not the root node
/// of a game tree and if it has either no properties or only properties
/// with #SGFCPropertyCategoryMiscellaneous.
///
/// @see SGFCNodeTraits
@property(nonatomic, readonly) SGFCNodeTraits traits;

/// @brief Returns YES if the node has the trait @a trait. Returns NO
/// if the node does not have the trait @a trait.
///
/// @see SgfcNodeTrait
- (BOOL) hasTrait:(SGFCNodeTrait)trait;
//@}

/// @name Game tree search
//@{
/// @brief Returns the root node of the game tree that contains the node.
/// Returns the node itself if the node has no parent, i.e. if it is
/// itself the root node.
@property(nonatomic, strong, readonly) SGFCNode* root;

/// @brief Returns the first node among the node itself and its ancestors
/// that has the trait #SGFCNodeTraitGameInfo. Returns @e nil if there
/// is no such node.
///
/// The search starts with the node itself, then progresses to the node's
/// parent, the node's parent's parent, etc. up to the root node of the
/// game tree. The search returns the first node whose GetTraits() method
/// returns a value that includes #SGFCNodeTraitGameInfo.
///
/// @see #SGFCNodeTraitGameInfo
@property(nonatomic, strong, readonly) SGFCNode* gameInfoNode;

/// @brief Returns an ordered collection of nodes that form the main
/// variation of game play found on the node itself and its first child
/// descendants.
///
/// The main variation is defined as the depth-first path that starts with
/// the node itself and continues along the first child descendants down
/// to the last node that has no more children. The collection that is
/// returned therefore contains the following nodes in the listed order:
///
/// - Element 0: The node itself
/// - Element 1: The node's first child
/// - Element 2: The node's first child's first child
/// - Etc.
///
/// If the node has no children the returned collection contains only the
/// node itself.
///
/// This is a convenience method that is most useful when invoked on a
/// game info node, i.e. a node that has the trait #SGFCNodeTraitGameInfo.
@property(nonatomic, strong, readonly) NSArray* mainVariationNodes;
//@}

/// @name Game info access
//@{
/// @brief Returns a newly constructed SGFCGameInfo object with values
/// taken from the properties in the root node that root() returns
/// and the game info node that gameInfoNode() returns.
///
/// If gameInfoNode() returns @e nil then the SGFCGameInfo object
/// contains only values taken from the properties in the root node, but
/// all values that would normally be taken from the properties in the game
/// info node have default values.
///
/// If the content in the root node indicates that the game type is
/// #SGFCGameTypeGo then the returned object is an SGFCGoGameInfo object.
/// The game type is #SGFCGameTypeGo in the following cases:
/// - If the root node contains a property of type #SGFCPropertyTypeGM
///   that either has no value, or that has a single Number value, and that
///   value is 0.
/// - Or if the root node does not contain a property of type
///   #SGFCPropertyTypeGM.
///
/// @see SGFCcGame::createGameInfo()
- (SGFCGameInfo*) createGameInfo;

/// @brief Writes all root property values in @a gameInfo to the
/// corresponding properties in the root node that root() returns,
/// and all game info property values in @a gameInfo to the game info node
/// that gameInfoNode() returns.
///
/// If gameInfoNode() returns @e nil then the game info property
/// values in @a gameInfo are written to the root node.
///
/// Game info property values are written only if they are not equal to
/// their default values (already existing property values are overwritten).
/// Game info property values that are equal to their default value cause
/// the property to be removed, if it exists, from the game info node.
///
/// Root property values are always written, regardless of whether they
/// are equal to their default values.
///
/// @exception NSInvalidArgumentException Is raised if @a gameInfo is @e nil.
- (void) writeGameInfo:(SGFCGameInfo*)gameInfo;
//@}

/// @name Property access
//@{
/// @brief Returns YES if the node has one or more properties. Returns
/// NO if the node has no properties.
@property(nonatomic, readonly) BOOL hasProperties;

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

/// @brief Adds @a property as the last property to the node's
/// collection of properties. If the collection already contains a duplicate
/// property that duplicate is removed first. @a property may not be
/// @e nil.
///
/// Duplicate elimination works like this:
/// - If @a property has #SGFCPropertyTypeUnknown then the collection is
///   searched for a duplicate by property name only.
/// - If @a property has a property type that is not
///   #SGFCPropertyTypeUnknown then the collection is searched for a
///   duplicate both by property type and by property name.
///
/// The method does nothing if the node's collection of properties already
/// contains @a property.
///
/// @exception NSInvalidArgumentException Is raised if @a property is @e nil.
- (void) setProperty:(SGFCProperty*)property;

/// @brief Adds @a property as the last property to the node's
/// collection of properties. @a property may not be @e nil.
///
/// @exception NSInvalidArgumentException Is raised if @a property is @e nil,
/// if @a property is already in the node's collection of properties, or
/// the node's collection of properties already contains another property
/// with the same SGFCPropertyType (except #SGFCPropertyTypeUnknown which
/// may appear more than once) or the same property name.
- (void) appendProperty:(SGFCProperty*)property;

/// @brief Removes @a property from the node's collection of properties.
///
/// @exception NSInvalidArgumentException Is raised if @a property is not
/// part of the node's collection of properties.
- (void) removeProperty:(SGFCProperty*)property;

/// @brief Removes all properties from the node's collection of properties.
- (void) removeAllProperties;

/// @brief Returns the property with the specified type @a propertyType if
/// the node has such a property. Returns @e nil if the node has no
/// such property.
///
/// If @a propertyType is #SGFCPropertyTypeUnknown and the node has several
/// such properties, returns the property that appears first in the list
/// that is returned by properties().
///
/// The SGF standard defines that only one of each property is allowed per
/// node.
- (SGFCProperty*) propertyWithType:(SGFCPropertyType)propertyType;

/// @brief Returns the property with the specified name @a propertyName if
/// the node has such a property. Returns @e nil if the node has no
/// such property.
///
/// The SGF standard defines that only one of each property is allowed per
/// node.
///
/// @exception NSInvalidArgumentException Is raised if @a propertyName is
/// @e nil.
- (SGFCProperty*) propertyWithName:(NSString*)propertyName;

/// @brief Returns a collection with the properties of the node that are
/// classified as @a propertyCategory. The collection is empty if the
/// node has no properties with the requested category. The collection has
/// no particular order.
- (NSArray*) propertiesWithCategory:(SGFCPropertyCategory)propertyCategory;

/// @brief Returns a collection with the most recent occurrence of each
/// property that has the trait #SGFCPropertyTraitInheritable, when found
/// on the node itself and its ancestors. The collection is empty if no
/// properties were found. The collection has no particular order.
///
/// The detailed search logic is this:
/// - Determine a list of properties that have the trait
///   #SGFCPropertyTraitInheritable.
/// - Start examining the node itself, then the node's parent, etc. up to
///   the game tree's root node.
/// - When a node contains one of the inheritable properties, include that
///   property in the search result returned by the method, then stop
///   looking for that particular property.
/// - Stop the search when all properties have been found.
///
/// The SGF standard's description of inheritable properties includes the
/// concept of a "setting getting cleared". The implication is that if a
/// "setting is cleared" then, from the node's perspective, things should
/// look as if the property that defines the setting has never been there
/// in the first place. Ideally then the search result returned by the
/// method should not include a property if that property's most recent
/// occurrence "cleared the setting". The problem is the interpretation of
/// when a setting is "being cleared". The SGF standard says that this
/// @b typically happens when the property is set with an empty value - but
/// @b typically is not @b always. Because the SGF standard is not
/// definitive about the meaning, the method does not make assumptions. It
/// simply returns a property's most recent occurrence and leaves the
/// interpretation of the property value to the library client.
@property(nonatomic, strong, readonly) NSArray* inheritedProperties;

@end
