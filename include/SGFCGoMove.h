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
#import "SGFCColor.h"

// System includes
#import <Foundation/NSObject.h>

// Forward declarations
@class SGFCGoPoint;
@class SGFCGoStone;

/// @brief The SGFCGoMove class represents a move in a Go game.
///
/// A move in a Go game is defined by the color of the player who made the
/// move and, if it is not a pass move, by the location of the stone that was
/// placed by the move on the Go board. SGFCGoMove uses a reference to an
/// SGFCGoStone object to record the latter of these two pieces of
/// information.
///
/// @ingroup public-api
/// @ingroup go
///
/// Do @b NOT attempt to create an SGFCGoMove object yourself, instead
/// always use the SGFCGoMove object provided by other library objects (e.g.
/// an SGFCGoMovePropertyValue instance).
@interface SGFCGoMove : NSObject
{
}

/// @brief Do @b NOT use this initializer.
- (instancetype) init NS_UNAVAILABLE;

/// @brief Returns YES if the move is a pass move. Returns NO if the
/// move is not a pass move.
@property(nonatomic, readonly, getter=isPassMove) BOOL passMove;

/// @brief Returns the stone that was placed on the Go board by the move.
/// Returns @e nil if isPassMove() returns YES.
@property(nonatomic, strong, readonly) SGFCGoStone* stone;

/// @brief Returns the color of the player who made the move.
///
/// If isPassMove() returns NO, this method returns the same value as
/// the SGFCGoStone::GetColor() method of the SGFCGoStone object returned
/// by stone().
@property(nonatomic, readonly) SGFCColor playerColor;

/// @brief Returns the location of the stone that was placed by the move on
/// the Go board. Returns @e nil if isPassMove() returns YES.
///
/// This is a convenience method that returns the same value as the
/// SGFCGoStone::location() property of the SGFCGoStone object returned
/// by stone().
@property(nonatomic, strong, readonly) SGFCGoPoint* stoneLocation;

@end
