// -----------------------------------------------------------------------------
// Copyright 2024 Patrick Näf (herzbube@herzbube.ch)
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
#import "../../../include/SGFCTreeBuilder.h"

/// @brief The SGFCTreeBuilderInternalAdditions category adds a library-internal
/// API to the SGFCTreeBuilder class.
///
/// @ingroup internals
/// @ingroup game-tree
@interface SGFCTreeBuilder(SGFCTreeBuilderInternalAdditions)

/// @brief Initializes an SGFCTreeBuilder object. The tree builder operates on
/// the game tree represented by @a game.
///
/// This is the designated initializer of SGFCTreeBuilder.
///
/// @exception NSInvalidArgumentException Is raised if @a game is @e nil.
- (instancetype) initWithGame:(SGFCGame*)game;

@end
