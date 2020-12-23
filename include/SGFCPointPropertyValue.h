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
///
/// @exception NSInvalidArgumentException Is raised if @a pointValue
/// is @e nil.
+ (instancetype) pointPropertyValueWithPointValue:(NSString*)pointValue;

/// @brief Initializes an SGFCPointPropertyValue object.
/// The object holds the Point value @a pointValue.
///
/// @exception NSInvalidArgumentException Is raised if @a pointValue
/// is @e nil.
///
/// This is the designated initializer of SGFCPointPropertyValue.
- (instancetype) initWithPointValue:(NSString*)pointValue NS_DESIGNATED_INITIALIZER;

/// @brief Returns the property value interpreted as a Point value.
@property(nonatomic, strong, readonly) NSString* pointValue;

/// @brief Returns an SGFCGoPointPropertyValue object if the property
/// value object was created specifically for #SGFCGameTypeGo. Returns
/// @e nil otherwise. The caller is not the owner of the returned
/// object.
- (SGFCGoPointPropertyValue*) toGoPointValue;

@end
