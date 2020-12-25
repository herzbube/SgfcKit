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

/// @brief SGFCPropertyCategory enumerates the categories used in the SGF
/// standard to classify properties. A property can fall into one category
/// only.
///
/// @ingroup public-api
///
/// The SGF standard uses the term "property type" instead of
/// "property category". Because SgfcKit already has the SGFCPropertyType
/// enumeration it was necessary to invent the new term "category".
typedef NS_ENUM(NSUInteger, SGFCPropertyCategory)
{
  /// @brief The property is a root property. Root properties define some
  /// global "attribute" that applies to the entire tree of nodes below the
  /// node that contains them. Examples: Board size, game type, SGF file
  /// format.
  ///
  /// As per the SGF standard, root properties can be stored only in root
  /// nodes. A root node is a node that has the trait #SGFCNodeTraitRoot.
  SGFCPropertyCategoryRoot,

  /// @brief The property is a game info property. Game info properties
  /// provide some information about the game played (e.g. who, where, when,
  /// what, result, rules, etc.).
  ///
  /// A node that contains one or more game info properties has the
  /// trait #SGFCNodeTraitGameInfo.
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
  SGFCPropertyCategoryGameInfo,

  /// @brief The property is a move property. Move properties concentrate on
  /// the move made, not on the position arrived at by the move.
  ///
  /// A node that contains one or more move properties has the
  /// trait #SGFCNodeTraitMove.
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
  SGFCPropertyCategoryMove,

  /// @brief The property is a setup property. Setup properties concentrate on
  /// the current position.
  ///
  /// A node that contains one or more setup properties has the
  /// trait #SGFCNodeTraitSetup.
  ///
  /// As per the SGF standard, setup properties must not be mixed with move
  /// properties within the same node. In theory a node can therefore not have
  /// both traits #SGFCNodeTraitSetup and #SGFCNodeTraitMove at the same
  /// time. In practice SgfcKit does not enforce the SGF standard rule.
  SGFCPropertyCategorySetup,

  /// @brief The property in some way annotates the node that contains it.
  ///
  /// A node that contains one or more node annotation properties has the
  /// trait #SGFCNodeTraitNodeAnnotation.
  SGFCPropertyCategoryNodeAnnotation,

  /// @brief The property in some way annotates the move that is contained in
  /// the same node as the property.
  ///
  /// A node that contains one or more move annotation properties has the
  /// trait #SGFCNodeTraitMoveAnnotation.
  SGFCPropertyCategoryMoveAnnotation,

  /// @brief The property in some way marks up one or more points.
  ///
  /// A node that contains one or more markup properties has the
  /// trait #SGFCNodeTraitMarkup.
  SGFCPropertyCategoryMarkup,

  /// @brief The property provides a value related to timing.
  ///
  /// A node that contains one or more timing properties has the
  /// trait #SGFCNodeTraitTiming.
  SGFCPropertyCategoryTiming,

  /// @brief The property is a miscellaneous property, i.e. it cannot be
  /// placed in a more specific category.
  SGFCPropertyCategoryMiscellaneous,
};
