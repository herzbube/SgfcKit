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
#import "../../../include/SGFCMovePropertyValue.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcMovePropertyValue.h>

// C++ Standard Library includes
#include <memory>

/// @brief The SGFCMovePropertyValueInternalAdditions category adds a
/// library-internal API to the SGFCMovePropertyValue class.
///
/// @ingroup private-api
/// @ingroup property-value
@interface SGFCMovePropertyValue(SGFCMovePropertyValueInternalAdditions)

/// @brief Initializes an SGFCMovePropertyValue object. The object wraps
/// the libsgfc++ object @a wrappedMovePropertyValue.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedMovePropertyValue is  @e nullptr.
- (id) initWithWrappedMovePropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcMovePropertyValue>)wrappedMovePropertyValue;

/// @brief Sets the wrapped libsgfc++ object to @a wrappedMovePropertyValue.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedMovePropertyValue is @e nullptr.
- (void) setWrappedMovePropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcMovePropertyValue>)wrappedMovePropertyValue;

@end
