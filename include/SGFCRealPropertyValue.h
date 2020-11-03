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
#import "SGFCTypedefs.h"

/// @brief The SGFCRealPropertyValue interface provides access to one of
/// the values of a property of an SGF node. The value type is
/// #SGFCPropertyValueTypeReal.
///
/// @ingroup public-api
/// @ingroup property-value
///
/// SGFCRealPropertyValue is immutable, i.e. once the
/// SGFCRealPropertyValue object is constructed it cannot be changed.
@interface SGFCRealPropertyValue : SGFCSinglePropertyValue
{
}

/// @brief Returns a newly constructed SGFCRealPropertyValue object.
/// The object holds the Real value @a realValue.
+ (SGFCRealPropertyValue*) realPropertyValueWithRealValue:(SGFCReal)realValue;

/// @brief Initializes an SGFCRealPropertyValue object.
/// The object holds the Real value @a realValue.
///
/// This is the designated initializer of SGFCRealPropertyValue.
- (id) initWithRealValue:(SGFCReal)realValue NS_DESIGNATED_INITIALIZER;

/// @brief Returns the property value interpreted as an SGFCReal value.
///
/// @exception #SGFCInvalidOperationException Is raised if hasTypedValue()
/// returns NO.
@property(nonatomic, readonly) SGFCReal realValue;

@end
