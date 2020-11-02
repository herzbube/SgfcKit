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
#include "SGFCColor.h"

// System includes
#import <Foundation/NSObject.h>

// Forward declarations
@class SGFCGoPoint;

/// @brief The SGFCGoStone class represents a Go stone.
///
/// @ingroup public-api
/// @ingroup go
///
/// A Go stone on a Go board is defined by its color and by its location on
/// the Go board. SGFCGoStone stores an SGFCColor value and a reference to an
/// SGFCGoPoint object to record these two pieces of information.
///
/// A Go stone for which the location on the Go board is not known, or that
/// is not located on the board at all, does not store a reference to an
/// SGFCGoPoint object.
///
/// Do @b NOT attempt to create an SGFCGoStone object yourself, instead
/// always use the SGFCGoStone object provided by other library objects (e.g.
/// an SGFCGoStonePropertyValue instance).
@interface SGFCGoStone : NSObject
{
}

/// @brief Do @b NOT use this initializer, it always raises
/// SGFCInvalidOperationException.
///
/// @exception SGFCInvalidOperationException Is raised whenever this initializer
/// is invoked.
- (id) init;

/// @brief Returns the color of the stone.
@property(nonatomic, readonly) SGFCColor color;

/// @brief Returns YES if the stone is located on the board and its
/// location is known (location() does not return @e nil). Returns
/// NO if the location of the stone on the Go board is not known,
/// or if the stone is not located on the board at all (location()
/// returns @e nil).
@property(nonatomic, readonly) BOOL hasLocation;

/// @brief Returns the location of the stone on the Go board. Returns
/// @e nil if the location of the stone on the Go board is not known,
/// or if the stone is not located on the board at all.
@property(nonatomic, strong, readonly) SGFCGoPoint* location;

@end
