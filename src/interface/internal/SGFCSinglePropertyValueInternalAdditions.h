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
#import "../../../include/SGFCSinglePropertyValue.h"
#import "SGFCPropertyValueInternal.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcSinglePropertyValue.h>

// C++ Standard Library includes
#include <memory>

/// @brief The SGFCSinglePropertyValueInternalAdditions category adds a
/// library-internal API to the SGFCSinglePropertyValue class, first by
/// declaring methods unique to the category, and second by adopting the
/// SGFCPropertyValueInternal protocol.
///
/// @ingroup private-api
/// @ingroup property-value
@interface SGFCSinglePropertyValue(SGFCSinglePropertyValueInternalAdditions) <SGFCPropertyValueInternal>

//// @brief Initializes an SGFCSinglePropertyValue object. The object wraps
/// the libsgfc++ object @a wrappedSinglePropertyValue.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedSinglePropertyValue is  @e nullptr.
- (id) initWithWrappedSinglePropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcSinglePropertyValue>)wrappedSinglePropertyValue;

// @brief Returns the wrapped libsgfc++ object.
- (std::shared_ptr<LibSgfcPlusPlus::ISgfcSinglePropertyValue>) wrappedSinglePropertyValue;

/// @brief Sets the wrapped libsgfc++ object to @a wrappedSinglePropertyValue.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedSinglePropertyValue is @e nullptr.
- (void) setWrappedSinglePropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcSinglePropertyValue>)wrappedSinglePropertyValue;

@end
