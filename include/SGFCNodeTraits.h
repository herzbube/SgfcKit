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
#import <Foundation/NSObjCRuntime.h>

/// @brief file

/// @brief An SGFCNodeTraits value describes the traits of an
/// SGFCNode object. The value is a combination of individual flags
/// defined in the SGFCNodeTrait enumeration.
///
/// @ingroup public-api
///
/// All bitwise operators have been overloaded to make the SGFCNodeTraits
/// typedef interoperate with the SGFCNodeTrait enumeration as
/// conveniently as possible. There are some limitations, though, because
/// SGFCNodeTraits is a typedef and not a true type (i.e. it's not a
/// class or struct). For instance, the assignment operator cannot be
/// overloaded so it's not possible to assign an SGFCNodeTrait enumeration
/// member directly to an SGFCNodeTraits variable. Consequently, whenever
/// SGFCNodeTrait (the enum type) needs to be treated interchangeably with
/// SGFCNodeTraits (the typdef) a static_cast must be done. This works
/// because SGFCNodeTraits (the typedef) is used as the underlying type
/// of SGFCNodeTrait (the enum type).
///
/// @verbatim
/// SGFCNodeTraits traits = static_cast<SGFCNodeTraits>(SGFCNodeTraitInheritable);
/// @endverbatim
///
/// @see SGFCNodeTraitsNone
/// @see SGFCNodeTraitsAll
///
/// @note Using an unsigned numerical type as the underlying type of this
/// typedef is important to make the bitwise operators, specifically the
/// shift left and shift right operators, unambiguous and safe to use.
typedef unsigned long long SGFCNodeTraits;

/// @brief SGFCNodeTrait enumerates the individual traits that an
/// SGFCNode object can have. An SGFCNode object can have several
/// traits, which is why the enumeration values are defined as flags that can
/// be combined into a single SGFCNodeTraits value.
///
/// @ingroup public-api
///
/// @see SGFCNodeTraitsNone
/// @see SGFCNodeTraitsAll
typedef NS_ENUM(SGFCNodeTraits, SGFCNodeTrait)
{
  /// @brief The node is a root node. Root nodes are nodes that are at the
  /// root of a tree of nodes, i.e. which have no parent node.
  ///
  /// As per the SGF standard, root properties can be stored only in root
  /// nodes. A root property is a property that is classified as
  /// #SGFCPropertyCategoryRoot.
  SGFCNodeTraitRoot = 1ULL,

  /// @brief The node is a game info node. Game info nodes are nodes that
  /// contain one or more game info properties. A game info property is a
  /// property that is classified as #SGFCPropertyCategoryGameInfo.
  ///
  /// As per the SGF standard, game info properties are usually (but not
  /// always) stored in root nodes. A root node is a node that has the trait
  /// #SGFCNodeTraitRoot. When several game trees are located below a common
  /// root node, game info properties are stored in the nodes where a game
  /// first becomes distinguishable from all other games in the tree.
  ///
  /// As per the SGF standard, there may be only one game info node on any
  /// path within a tree of nodes, i.e. if some game info properties occur in
  /// one node there may not be any further game info properties in the
  /// following nodes:
  /// - On the path from the root node to this node.
  /// - In the subtree below this node.
  ///
  /// SgfcKit does not enforce this rule from the SGF standard, but it uses
  /// the rule in certain parts of its implementation, such as when an
  /// SGFCGame is queried for game info nodes.
  SGFCNodeTraitGameInfo = 2ULL,

  /// @brief The node is a move node. Move nodes are nodes that contain one
  /// or more move properties. A move property is a property that is
  /// classified as #SGFCPropertyCategoryMove.
  ///
  /// As per the SGF standard, move properties must not be mixed with setup
  /// properties within the same node. In theory a node can therefore not have
  /// both traits #SGFCNodeTraitMove and #SGFCNodeTraitSetup at the same
  /// time. In practice SgfcKit does not enforce the SGF standard rule.
  ///
  /// As per the SGF standard, it's bad style to have move properties in
  /// root nodes, although it isn't forbidden. Ideally a node should therefore
  /// not have both traits #SGFCNodeTraitMove and #SGFCNodeTraitRoot at the
  /// same time.
  SGFCNodeTraitMove = 4ULL,

  /// @brief The node is a setup node. Setup nodes are nodes that contain one
  /// or more setup properties. A setup property is a property that is
  /// classified as #SGFCPropertyCategorySetup.
  ///
  /// As per the SGF standard, setup properties must not be mixed with move
  /// properties within the same node. In theory a node can therefore not have
  /// both traits #SGFCNodeTraitSetup and #SGFCNodeTraitMove at the same
  /// time. In practice SgfcKit does not enforce the SGF standard rule.
  SGFCNodeTraitSetup = 8ULL,

  /// @brief The node contains one or more properties that are classified as
  /// #SGFCPropertyCategoryNodeAnnotation.
  SGFCNodeTraitNodeAnnotation = 16ULL,

  /// @brief The node contains one or more properties that are classified as
  /// #SGFCPropertyCategoryMoveAnnotation.
  ///
  /// A node with this trait should also have the trait #SGFCNodeTraitMove.
  SGFCNodeTraitMoveAnnotation = 32ULL,

  /// @brief The node contains one or more properties that are classified as
  /// #SGFCPropertyCategoryMarkup.
  SGFCNodeTraitMarkup = 64ULL,

  /// @brief The node contains one or more properties that are classified as
  /// #SGFCPropertyCategoryTiming.
  SGFCNodeTraitTiming = 128ULL,

  /// @brief The node contains one or more properties with the trait
  /// SgfcPropertyTrait::Inheritable.
  SGFCNodeTraitInheritable = 256ULL,
};
