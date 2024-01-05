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
#import "../../../include/SGFCProperty.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcProperty.h>

// C++ Standard Library includes
#import <memory>

/// @brief The SGFCPropertyInternalAdditions category adds a
/// library-internal API to the SGFCProperty class.
///
/// @ingroup internals
/// @ingroup property
@interface SGFCProperty(SGFCPropertyInternalAdditions)

/// @brief Initializes an SGFCProperty object. The object wraps the libsgfc++
/// object @a wrappedProperty.
///
/// @exception NSInvalidArgumentException Is raised if @a wrappedProperty is
/// @e nullptr.
- (instancetype) initWithWrappedProperty:(std::shared_ptr<LibSgfcPlusPlus::ISgfcProperty>)wrappedProperty;

/// @brief Returns the wrapped libsgfc++ object.
- (std::shared_ptr<LibSgfcPlusPlus::ISgfcProperty>) wrappedProperty;

/// @brief Sets the wrapped libsgfc++ object to @a wrappedProperty.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedProperty is @e nullptr.
- (void) setWrappedProperty:(std::shared_ptr<LibSgfcPlusPlus::ISgfcProperty>)wrappedProperty;

/// @brief Sets the wrapped libsgfc++ object to @a wrappedProperty and the
/// property value wrapper objects to @a propertyValues.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedProperty is @e nullptr or @a propertyValues is @e nil.
- (void) setWrappedProperty:(std::shared_ptr<LibSgfcPlusPlus::ISgfcProperty>)wrappedProperty
             propertyValues:(NSArray*)propertyValues;

@end
