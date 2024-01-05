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
#import "../../../include/SGFCGameTypeProperty.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcGameTypeProperty.h>

// C++ Standard Library includes
#import <memory>

/// @brief The SGFCGameTypePropertyInternalAdditions category adds a
/// library-internal API to the SGFCGameTypeProperty class.
///
/// @ingroup internals
/// @ingroup property
@interface SGFCGameTypeProperty(SGFCGameTypePropertyInternalAdditions)

/// @brief Initializes an SGFCGameTypeProperty object. The object wraps
/// the libsgfc++ object @a wrappedGameTypeProperty.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedGameTypeProperty is @e nullptr.
- (instancetype) initWithWrappedGameTypeProperty:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGameTypeProperty>)wrappedGameTypeProperty;

/// @brief Initializes an SGFCGameTypeProperty object. The object wraps
/// the libsgfc++ object @a wrappedGameTypeProperty and uses @a propertyValues
/// as the property value wrapper objects.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedGameTypeProperty is @e nullptr or @a propertyValues is @e nil.
- (instancetype) initWithWrappedGameTypeProperty:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGameTypeProperty>)wrappedGameTypeProperty
                                  propertyValues:(NSArray*)propertyValues;

/// @brief Returns the wrapped libsgfc++ object.
- (std::shared_ptr<LibSgfcPlusPlus::ISgfcGameTypeProperty>) wrappedGameTypeProperty;

@end
