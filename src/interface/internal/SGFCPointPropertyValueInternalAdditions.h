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
#import "../../../include/SGFCPointPropertyValue.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcPointPropertyValue.h>

// C++ Standard Library includes
#import <memory>

/// @brief The SGFCPointPropertyValueInternalAdditions category adds a
/// library-internal API to the SGFCPointPropertyValue class.
///
/// @ingroup internals
/// @ingroup property-value
@interface SGFCPointPropertyValue(SGFCPointPropertyValueInternalAdditions)

/// @brief Initializes an SGFCPointPropertyValue object. The object wraps
/// the libsgfc++ object @a wrappedPointPropertyValue.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedPointPropertyValue is @e nullptr.
- (instancetype) initWithWrappedPointPropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcPointPropertyValue>)wrappedPointPropertyValue;

/// @brief Sets the wrapped libsgfc++ object to @a wrappedPointPropertyValue.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedPointPropertyValue is @e nullptr.
- (void) setWrappedPointPropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcPointPropertyValue>)wrappedPointPropertyValue;

@end
