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
#import "SGFCSinglePropertyValue.h"
#import "SGFCTypedefs.h"

/// @brief The SGFCNumberPropertyValue interface provides access to one of
/// the values of a property of an SGF node. The value type is
/// #SGFCPropertyValueTypeNumber.
///
/// @ingroup public-api
/// @ingroup property-value
///
/// SGFCNumberPropertyValue is immutable, i.e. once the
/// SGFCNumberPropertyValue object is constructed it cannot be changed.
@interface SGFCNumberPropertyValue : SGFCSinglePropertyValue
{
}

/// @brief Returns a newly constructed SGFCNumberPropertyValue object.
/// The object holds the Number value @a numberValue.
+ (instancetype) numberPropertyValueWithNumberValue:(SGFCNumber)numberValue;

/// @brief Returns a newly constructed SGFCNumberPropertyValue object.
/// The object holds an SGFCNumber value that corresponds to @a gameType.
/// @a gameType must not be #SGFCGameTypeUnknown.
///
/// @exception NSInvalidArgumentException Is raised if @a gameType is
/// #SGFCGameTypeUnknown.
+ (instancetype) numberPropertyValueWithGameType:(SGFCGameType)gameType;

/// @brief Initializes an SGFCNumberPropertyValue object.
/// The object holds the Number value @a numberValue.
///
/// This is the designated initializer of SGFCNumberPropertyValue.
- (instancetype) initWithNumberValue:(SGFCNumber)numberValue NS_DESIGNATED_INITIALIZER;

/// @brief Initializes an SGFCNumberPropertyValue object.
/// The object holds an SGFCNumber value that corresponds to @a gameType.
/// @a gameType must not be #SGFCGameTypeUnknown.
///
/// @exception NSInvalidArgumentException Is raised if @a gameType is
/// #SGFCGameTypeUnknown.
- (instancetype) initWithGameType:(SGFCGameType)gameType;

/// @brief Returns the property value interpreted as an SGFCNumber value.
@property(nonatomic, readonly) SGFCNumber numberValue;

@end
