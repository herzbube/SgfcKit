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

/// @brief SGFCDouble enumerates the values that a property value of type
/// #SgfcPropertyValueTypeDouble can have.
///
/// @ingroup public-api
///
/// @attention Do not rely on the numeric value underlying each enumeration
/// member. Specifically, do not attempt to map the numeric value to the
/// Double representation in the SGF content.
typedef NS_ENUM(NSUInteger, SGFCDouble)
{
  /// @brief The property value signifies "normal" importance. Example: If the
  /// property #SGFCPropertyTypeGB has this value, then it means
  /// "good for black".
  ///
  /// The raw property string value is "1".
  SGFCDoubleNormal,
  /// @brief The property value signifies "emphasized" importance. Example: If
  /// the property #SGFCPropertyTypeGB has this value, then it means
  /// "very good for black".
  ///
  /// The raw property string value is "2".
  SGFCDoubleEmphasized,
};
