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
#import "../../../include/SGFCGoMovePropertyValue.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcGoMovePropertyValue.h>

// C++ Standard Library includes
#include <memory>

/// @brief The SGFCGoMovePropertyValueInternalAdditions category adds a
/// library-internal API to the SGFCGoMovePropertyValue class.
///
/// @ingroup private-api
/// @ingroup property-value
/// @ingroup go
@interface SGFCGoMovePropertyValue(SGFCGoMovePropertyValueInternalAdditions)

/// @brief Initializes an SGFCGoMovePropertyValue object. The object wraps
/// the libsgfc++ object @a wrappedGoMovePropertyValue.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedGoMovePropertyValue is  @e nullptr.
- (instancetype) initWithWrappedGoMovePropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoMovePropertyValue>)wrappedGoMovePropertyValue;

/// @brief Returns the wrapped libsgfc++ object.
- (std::shared_ptr<LibSgfcPlusPlus::ISgfcGoMovePropertyValue>) wrappedGoMovePropertyValue;

@end
