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
@class SGFCGoMovePropertyValue;

/// @brief The SGFCMovePropertyValue interface provides access to one of
/// the values of a property of an SGF node. The value type is
/// #SGFCPropertyValueTypeMove.
///
/// @ingroup public-api
/// @ingroup property-value
///
/// SGFCMovePropertyValue is immutable, i.e. once the
/// SGFCMovePropertyValue object is constructed it cannot be changed.
@interface SGFCMovePropertyValue : SGFCSinglePropertyValue
{
}

/// @brief Returns a newly constructed SGFCMovePropertyValue object.
/// The object holds the Move value @a moveValue.
///
/// @exception NSInvalidArgumentException Is raised if @a moveValue
/// is @e nil.
+ (instancetype) movePropertyValueWithMoveValue:(NSString*)moveValue;

/// @brief Initializes an SGFCMovePropertyValue object.
/// The object holds the Move value @a moveValue.
///
/// @exception NSInvalidArgumentException Is raised if @a moveValue
/// is @e nil.
///
/// This is the designated initializer of SGFCMovePropertyValue.
- (instancetype) initWithMoveValue:(NSString*)moveValue NS_DESIGNATED_INITIALIZER;

/// @brief Returns the property value interpreted as a Move value.
@property(nonatomic, strong, readonly) NSString* moveValue;

/// @brief Returns an SGFCGoMovePropertyValue object if the property
/// value object was created specifically for #SGFCGameTypeGo. Returns
/// @e nil otherwise. The caller is not the owner of the returned
/// object.
- (SGFCGoMovePropertyValue*) toGoMoveValue;

@end
