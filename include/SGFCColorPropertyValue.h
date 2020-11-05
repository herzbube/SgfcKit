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
#import "SGFCSinglePropertyValue.h"

/// @brief The SGFCColorPropertyValue interface provides access to one of
/// the values of a property of an SGF node. The value type is
/// #SGFCPropertyValueTypeColor.
///
/// @ingroup public-api
/// @ingroup property-value
///
/// SGFCColorPropertyValue is immutable, i.e. once the
/// SGFCColorPropertyValue object is constructed it cannot be changed.
@interface SGFCColorPropertyValue : SGFCSinglePropertyValue
{
}

/// @brief Returns a newly constructed SGFCColorPropertyValue object.
/// The object holds the Color value @a colorValue.
+ (instancetype) colorPropertyValueWithColorValue:(SGFCColor)colorValue;

/// @brief Initializes an SGFCColorPropertyValue object.
/// The object holds the Color value @a colorValue.
///
/// This is the designated initializer of SGFCColorPropertyValue.
- (instancetype) initWithColorValue:(SGFCColor)colorValue NS_DESIGNATED_INITIALIZER;

/// @brief Returns the property value interpreted as an SGFCColor value.
///
/// @exception #SGFCInvalidOperationException Is raised if hasTypedValue()
/// returns NO.
@property(nonatomic, readonly) SGFCColor colorValue;

@end
