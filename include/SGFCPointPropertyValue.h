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
@class SGFCGoPointPropertyValue;

/// @brief The SGFCPointPropertyValue interface provides access to one of
/// the values of a property of an SGF node. The value type is
/// #SGFCPropertyValueTypePoint.
///
/// @ingroup public-api
/// @ingroup property-value
///
/// SGFCPointPropertyValue is immutable, i.e. once the
/// SGFCPointPropertyValue object is constructed it cannot be changed.
@interface SGFCPointPropertyValue : SGFCSinglePropertyValue
{
}

/// @brief Returns a newly constructed SGFCPointPropertyValue object.
/// The object holds the Point value @a pointValue.
+ (SGFCPointPropertyValue*) pointPropertyValueWithPointValue:(NSString*)pointValue;

/// @brief Initializes an SGFCPointPropertyValue object.
/// The object holds the Point value @a pointValue.
///
/// This is the designated initializer of SGFCPointPropertyValue.
- (id) initWithPointValue:(NSString*)pointValue;

/// @brief Returns the uninterpreted Point value. This is the same value
/// that rawValue() returns.
///
/// The SGF standard does not provide a universal definition of how a Point
/// value should look like. Instead it says that the interpretation of
/// Point values is game specific.
@property(nonatomic, strong, readonly) NSString* pointValue;

/// @brief Returns an SGFCGoPointPropertyValue object if the game tree that
/// this property value is associated with has #SGFCGameTypeGo. Returns
/// @e nil otherwise. The caller is not the owner of the returned
/// object.
- (SGFCGoPointPropertyValue*) toGoPointValue;

@end