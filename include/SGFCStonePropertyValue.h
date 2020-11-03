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
/// The object holds the Stone value @a moveValue.
///
/// @exception NSInvalidArgumentException Is raised if @a stoneValue
/// is @e nil.
+ (SGFCStonePropertyValue*) stonePropertyValueWithStoneValue:(NSString*)stoneValue;

/// @brief Initializes an SGFCStonePropertyValue object.
/// The object holds the Stone value @a stoneValue.
///
/// @exception NSInvalidArgumentException Is raised if @a stoneValue
/// is @e nil.
///
/// This is the designated initializer of SGFCStonePropertyValue.
- (id) initWithStoneValue:(NSString*)stoneValue NS_DESIGNATED_INITIALIZER;

/// @brief Returns the uninterpreted Stone value. This is the same value
/// that rawValue() returns.
///
/// The SGF standard does not provide a universal definition of how a Stone
/// value should look like. Instead it says that the interpretation of
/// Stone values is game specific.
@property(nonatomic, strong, readonly) NSString* stoneValue;

/// @brief Returns an SGFCGoStonePropertyValue object if the game tree that
/// this property value is associated with has #SGFCGameTypeGo. Returns
/// @e nil otherwise. The caller is not the owner of the returned
/// object.
- (SGFCGoStonePropertyValue*) toGoStoneValue;

@end
