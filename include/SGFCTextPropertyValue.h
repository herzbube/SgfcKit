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

/// @brief The SGFCTextPropertyValue interface provides access to one of
/// the values of a property of an SGF node. The value type is
/// #SGFCPropertyValueTypeText.
///
/// @ingroup public-api
/// @ingroup property-value
///
/// SGFCTextPropertyValue is immutable, i.e. once the
/// SGFCTextPropertyValue object is constructed it cannot be changed.
@interface SGFCTextPropertyValue : SGFCSinglePropertyValue
{
}

/// @brief Returns a newly constructed SGFCTextPropertyValue object.
/// The object holds the Text value @a textValue.
///
/// @exception NSInvalidArgumentException Is raised if @a textValue
/// is @e nil.
+ (SGFCTextPropertyValue*) textPropertyValueWithTextValue:(NSString*)textValue;

/// @brief Initializes an SGFCTextPropertyValue object.
/// The object holds the Text value @a textValue.
///
/// @exception NSInvalidArgumentException Is raised if @a textValue
/// is @e nil.
///
/// This is the designated initializer of SGFCTextPropertyValue.
- (id) initWithTextValue:(NSString*)textValue;

/// @brief Returns the property value interpreted as a Text string.
///
/// @exception #SGFCInvalidOperationException Is raised if hasTypedValue()
/// returns NO.
@property(nonatomic, strong, readonly) NSString* textValue;

@end
