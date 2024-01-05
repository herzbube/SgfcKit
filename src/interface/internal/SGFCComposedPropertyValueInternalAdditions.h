// -----------------------------------------------------------------------------
// Copyright 2024 Patrick Näf (herzbube@herzbube.ch)
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
#import "../../../include/SGFCComposedPropertyValue.h"
#import "SGFCPropertyValueInternal.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcComposedPropertyValue.h>

// C++ Standard Library includes
#import <memory>

/// @brief The SGFCComposedPropertyValueInternalAdditions category adds a
/// library-internal API to the SGFCComposedPropertyValue class, first by
/// declaring methods unique to the category, and second by adopting the
/// SGFCPropertyValueInternal protocol.
///
/// @ingroup internals
/// @ingroup property-value
@interface SGFCComposedPropertyValue(SGFCComposedPropertyValueInternalAdditions) <SGFCPropertyValueInternal>

/// @brief Initializes an SGFCComposedPropertyValue object. The object wraps
/// the libsgfc++ object @a wrappedComposedPropertyValue.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedComposedPropertyValue is @e nullptr.
- (instancetype) initWithWrappedComposedPropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcComposedPropertyValue>)wrappedComposedPropertyValue;

/// @brief Returns the wrapped libsgfc++ object.
- (std::shared_ptr<LibSgfcPlusPlus::ISgfcComposedPropertyValue>) wrappedComposedPropertyValue;

@end
