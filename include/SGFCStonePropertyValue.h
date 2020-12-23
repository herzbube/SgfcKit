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
#import "SGFCSinglePropertyValue.h"

// Forward declarations
@class NSString;
@class SGFCGoStonePropertyValue;

/// @brief The SGFCStonePropertyValue interface provides access to one of
/// the values of a property of an SGF node. The value type is
/// #SGFCPropertyValueTypeStone.
///
/// @ingroup public-api
/// @ingroup property-value
///
/// SGFCStonePropertyValue is immutable, i.e. once the
/// SGFCStonePropertyValue object is constructed it cannot be changed.
@interface SGFCStonePropertyValue : SGFCSinglePropertyValue
{
}

/// @brief Returns a newly constructed SGFCStonePropertyValue object.
/// The object holds the Stone value @a stoneValue.
///
/// @exception NSInvalidArgumentException Is raised if @a stoneValue
/// is @e nil.
+ (instancetype) stonePropertyValueWithStoneValue:(NSString*)stoneValue;

/// @brief Initializes an SGFCStonePropertyValue object.
/// The object holds the Stone value @a stoneValue.
///
/// @exception NSInvalidArgumentException Is raised if @a stoneValue
/// is @e nil.
///
/// This is the designated initializer of SGFCStonePropertyValue.
- (instancetype) initWithStoneValue:(NSString*)stoneValue NS_DESIGNATED_INITIALIZER;

/// @brief Returns the property value interpreted as a Stone value.
@property(nonatomic, strong, readonly) NSString* stoneValue;

/// @brief Returns an SGFCGoStonePropertyValue object if the property
/// value object was created specifically for #SGFCGameTypeGo. Returns
/// @e nil otherwise. The caller is not the owner of the returned
/// object.
- (SGFCGoStonePropertyValue*) toGoStoneValue;

@end
