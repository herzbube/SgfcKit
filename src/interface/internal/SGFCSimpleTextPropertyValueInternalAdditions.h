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
#import "../../../include/SGFCSimpleTextPropertyValue.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcSimpleTextPropertyValue.h>

// C++ Standard Library includes
#include <memory>

/// @brief The SGFCSimpleTextPropertyValueInternalAdditions category adds a
/// library-internal API to the SGFCSimpleTextPropertyValue class.
///
/// @ingroup private-api
/// @ingroup property-value
@interface SGFCSimpleTextPropertyValue(SGFCSimpleTextPropertyValueInternalAdditions)

/// @brief Initializes an SGFCSimpleTextPropertyValue object. The object wraps
/// the libsgfc++ object @a wrappedSimpleTextPropertyValue.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedSimpleTextPropertyValue is  @e nullptr.
- (id) initWithWrappedSimpleTextPropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcSimpleTextPropertyValue>)wrappedSimpleTextPropertyValue;

/// @brief Returns the wrapped libsgfc++ object.
- (std::shared_ptr<LibSgfcPlusPlus::ISgfcSimpleTextPropertyValue>) wrappedSimpleTextPropertyValue;

@end
