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

/// @brief SGFCColor enumerates the values that a property value of type
/// #SGFCPropertyValueTypeColor can have.
///
/// @ingroup public-api
typedef NS_ENUM(NSUInteger, SGFCColor)
{
  /// @brief The property value signifies the abstract color "Black".
  ///
  /// The raw property string value is "B".
  SGFCColorBlack,
  /// @brief The property value signifies the abstract color "White".
  ///
  /// The raw property string value is "W".
  SGFCColorWhite,
};
