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
#import "SGFCCoordinateSystem.h"
#import "SGFCGoPointNotation.h"

// System includes
#import <Foundation/NSObject.h>

// Forward declarations
@class NSString;

/// @brief The SGFCGoPoint class represents a point on a Go board.
///
/// @ingroup public-api
/// @ingroup go
///
/// A point on a Go board is an intersection of two lines. A point's location
/// is identified by a position in a two-dimensional coordinate system. The
/// horizontal axis is the x-axis, sometimes also called column. The vertical
/// axis is the y-axis, sometimes also called row.
///
/// SGFCGoPoint has methods that make the point location available
/// as numeric values in several coordinate systems (enumerated in
/// SGFCCoordinateSystem). There are two methods: One for the x-axis
/// position and one for the y-axis position. Both provide 1-based values.
///
/// In addition SGFCGoPoint has methods that make the point location
/// available as string values in several notations (enumerated in
/// SGFCGoPointNotation). There are three methods:
/// - One method that provides the location as a single string value.
/// - And two methods that provide the x-axis and y-axis compounds of
///   the location, respectively, as two separate string values.
///
/// Do @b NOT attempt to create an SGFCGoPoint object yourself, instead
/// always use the SGFCGoPoint object provided by other library objects (e.g.
/// an SGFCGoPointPropertyValue instance).
@interface SGFCGoPoint : NSObject
{
}

/// @brief Do @b NOT use this initializer.
- (id) init NS_UNAVAILABLE;

/// @brief Returns the 1-based numeric x-axis position of the point in the
/// desired coordinate system @a coordinateSystem.
- (NSUInteger) xPositionInCoordinateSystem:(SGFCCoordinateSystem)coordinateSystem;

/// @brief Returns the 1-based numeric y-axis position of the point in the
/// desired coordinate system @a coordinateSystem.
- (NSUInteger) yPositionInCoordinateSystem:(SGFCCoordinateSystem)coordinateSystem;

/// @brief Returns YES if positionInGoPointNotation:(),
/// xPositionInGoPointNotation:() and yPositionInGoPointNotation:()
/// return a non-empty string for the desired notation @a goPointNotation.
/// Returns NO if these methods return an empty string.
///
/// The methods may return an empty string if the desired notation cannot
/// represent the point location. See the documentation of each
/// SgfcGoPointNotation enum value for a definition of the notation and its
/// limitations. Notably, the "A1" hybrid notation cannot represent
/// point locations with an x- or y-axis position greater than 25.
- (BOOL) hasPositionInGoPointNotation:(SGFCGoPointNotation)goPointNotation;

/// @brief Returns the position of the point as a single string value in
/// the desired notation @a goPointNotation. Returns an empty string if
/// hasPositionInGoPointNotation:() returns NO for @a goPointNotation.
- (NSString*) positionInGoPointNotation:(SGFCGoPointNotation)goPointNotation;

/// @brief Returns the x-axis compound of the point's position in the
/// desired notation @a goPointNotation. Returns an empty string if
/// hasPositionInGoPointNotation:() returns NO for @a goPointNotation.
- (NSString*) xPositionInGoPointNotation:(SGFCGoPointNotation)goPointNotation;

/// @brief Returns the y-axis compound of the point's position in the
/// desired notation @a goPointNotation. Returns an empty string if
/// hasPositionInGoPointNotation:() returns NO for @a goPointNotation.
- (NSString*) yPositionInGoPointNotation:(SGFCGoPointNotation)goPointNotation;

@end
