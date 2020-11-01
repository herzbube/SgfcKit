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

/// @brief The SGFCSimpleTextPropertyValue interface provides access to one of
/// the values of a property of an SGF node. The value type is
/// #SGFCPropertyValueTypeSimpleText.
///
/// @ingroup public-api
/// @ingroup property-value
///
/// SGFCSimpleTextPropertyValue is immutable, i.e. once the
/// SGFCSimpleTextPropertyValue object is constructed it cannot be changed.
@interface SGFCSimpleTextPropertyValue : SGFCSinglePropertyValue
{
}

/// @brief Returns a newly constructed SGFCSimpleTextPropertyValue object.
/// The object holds the SimpleText value @a simpleTextValue.
+ (SGFCSimpleTextPropertyValue*) simpleTextPropertyValueWithSimpleTextValue:(NSString*)simpleTextValue;

/// @brief Initializes an SGFCSimpleTextPropertyValue object.
/// The object holds the SimpleText value @a simpleTextValue.
///
/// This is the designated initializer of SGFCSimpleTextPropertyValue.
- (id) initWithSimpleTextValue:(NSString*)simpleTextValue;

/// @brief Returns the property value interpreted as a SimpleText string.
///
/// @exception #SGFCInvalidOperationException Is raised if hasTypedValue()
/// returns NO.
@property(nonatomic, strong, readonly) NSString* simpleTextValue;

@end
