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

/// @brief SGFCCoordinateSystem enumerates the coordinate systems supported
/// by game-specific representations of Point values.
///
/// @ingroup public-api
typedef NS_ENUM(NSUInteger, SGFCCoordinateSystem)
{
  /// @brief The coordinate system's origin is in the upper-left corner.
  ///
  /// For instance, this coordinate system is used by #SGFCGoPointNotationSgf
  /// and #SGFCGoPointNotationFigure.
  SGFCCoordinateSystemUpperLeftOrigin,

  /// @brief The coordinate system's origin is in the lower-left corner.
  ///
  /// For instance, this coordinate system is used by
  /// #SGFCGoPointNotationHybrid.
  SGFCCoordinateSystemLowerLeftOrigin,
};
