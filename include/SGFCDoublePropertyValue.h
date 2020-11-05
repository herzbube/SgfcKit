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
#import "SGFCDouble.h"
#import "SGFCSinglePropertyValue.h"

/// @brief The SGFCDoublePropertyValue interface provides access to one of
/// the values of a property of an SGF node. The value type is
/// #SGFCPropertyValueTypeDouble.
///
/// @ingroup public-api
/// @ingroup property-value
///
/// SGFCDoublePropertyValue is immutable, i.e. once the
/// SGFCDoublePropertyValue object is constructed it cannot be changed.
@interface SGFCDoublePropertyValue : SGFCSinglePropertyValue
{
}

/// @brief Returns a newly constructed SGFCDoublePropertyValue object.
/// The object holds the Double value @a doubleValue.
+ (SGFCDoublePropertyValue*) doublePropertyValueWithDoubleValue:(SGFCDouble)doubleValue;

/// @brief Initializes an SGFCDoublePropertyValue object.
/// The object holds the Double value @a doubleValue.
///
/// This is the designated initializer of SGFCDoublePropertyValue.
- (instancetype) initWithDoubleValue:(SGFCDouble)doubleValue NS_DESIGNATED_INITIALIZER;

/// @brief Returns the property value interpreted as an SGFCDouble value.
///
/// @exception #SGFCInvalidOperationException Is raised if hasTypedValue()
/// returns NO.
@property(nonatomic, readonly) SGFCDouble doubleValue;

@end
