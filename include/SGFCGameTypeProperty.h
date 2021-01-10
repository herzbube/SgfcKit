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
#import "SGFCGameType.h"
#import "SGFCProperty.h"
#import "SGFCTypedefs.h"

// Forward declarations
@class SGFCNumberPropertyValue;

/// @brief The SGFCGameTypeProperty class is a specialization of
/// SGFCProperty for #SGFCPropertyTypeGM. It simplifies access to the
/// property value and provides the value in the form of an SGFCGameType
/// value.
///
/// @ingroup public-api
/// @ingroup property
@interface SGFCGameTypeProperty : SGFCProperty
{
}

/// @brief Returns a newly constructed SGFCGameTypeProperty object that
/// has no value. The property is not associated with any node.
+ (instancetype) gameTypeProperty;

/// @brief Returns a newly constructed SGFCGameTypeProperty object that
/// has the specified property value @a numberPropertyValue. The property is not
/// associated with any node. The SGFCGameTypeProperty object takes
/// ownership of the SGFCNumberPropertyValue object @a numberPropertyValue.
///
/// @exception NSInvalidArgumentException Is raised if @a numberPropertyValue is
/// @e nil.
+ (instancetype) gameTypePropertyWithNumberPropertyValue:(SGFCNumberPropertyValue*)numberPropertyValue;

/// @brief Initializes an SGFCGameTypeProperty object. The property
/// has no value. The property is not associated with any node.
///
/// This is the designated initializer of SGFCGameTypeProperty.
- (instancetype) init NS_DESIGNATED_INITIALIZER;

/// @brief Initializes an SGFCGameTypeProperty object. The property
/// has the specified property value @a numberPropertyValue. The property is not
/// associated with any node. The SGFCGameTypeProperty object takes
/// ownership of the SGFCNumberPropertyValue object @a numberPropertyValue.
///
/// @exception NSInvalidArgumentException Is raised if @a numberPropertyValue is
/// @e nil.
- (instancetype) initWithNumberPropertyValue:(SGFCNumberPropertyValue*)numberPropertyValue;

/// @brief Returns the property value(s) interpreted as an SGFCGameType
/// value.
///
/// @retval SGFCGameType If the property has a single Number value, and
///         that value is defined in the SGF standard, then the SGFCGameType
///         value that corresponds to the Number value is returned. The
///         value is guaranteed not to be #SGFCGameTypeUnknown.
/// @retval #SGFCDefaultGameType If the property has no value.
///         The value is guaranteed not to be #SGFCGameTypeUnknown.
/// @retval #SGFCGameTypeUnknown If the property's value(s) cannot be
///         converted to a Number value (the property has more than one
///         value, or the single value is not a Number value), or if
///         conversion is possible but the Number value is not defined in
///         the SGF standard. Invoke gameTypeAsNumber() to obtain the
///         game type as Number value.
@property(nonatomic, readonly) SGFCGameType gameType;

/// @brief Returns the property value(s) interpreted as an SGFCNumber value.
///
/// This is useful if gameType() returns #SGFCGameTypeUnknown because
/// the Number value is not defined in the SGF standard and cannot be mapped
/// to a member of the enumeration SGFCGameType.
///
/// @retval SGFCNumber If the property contains a single Number value, then
///         that Number value is returned. If the property has no value,
///         then this method returns the Number value that corresponds to
///         #SGFCDefaultGameType.
/// @retval #SGFCGameTypeNaN If the property's value(s) cannot be
///         converted to a Number value, either because the property has
///         more than one value, or its single value is not a Number value.
@property(nonatomic, readonly) SGFCNumber gameTypeAsNumber;

@end
