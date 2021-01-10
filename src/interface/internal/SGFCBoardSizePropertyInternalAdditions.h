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
#import "../../../include/SGFCBoardSizeProperty.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcBoardSizeProperty.h>

// C++ Standard Library includes
#import <memory>

/// @brief The SGFCBoardSizePropertyInternalAdditions category adds a
/// library-internal API to the SGFCBoardSizeProperty class.
///
/// @ingroup private-api
/// @ingroup property
@interface SGFCBoardSizeProperty(SGFCBoardSizePropertyInternalAdditions)

/// @brief Initializes an SGFCBoardSizeProperty object. The object wraps
/// the libsgfc++ object @a wrappedBoardSizeProperty.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedBoardSizeProperty is @e nullptr.
- (instancetype) initWithWrappedBoardSizeProperty:(std::shared_ptr<LibSgfcPlusPlus::ISgfcBoardSizeProperty>)wrappedBoardSizeProperty;

/// @brief Initializes an SGFCBoardSizeProperty object. The object wraps
/// the libsgfc++ object @a wrappedBoardSizeProperty and uses @a propertyValues
/// as the property value wrapper objects.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedBoardSizeProperty is @e nullptr or @a propertyValues is @e nil.
- (instancetype) initWithWrappedBoardSizeProperty:(std::shared_ptr<LibSgfcPlusPlus::ISgfcBoardSizeProperty>)wrappedBoardSizeProperty
                                   propertyValues:(NSArray*)propertyValues;

/// @brief Returns the wrapped libsgfc++ object.
- (std::shared_ptr<LibSgfcPlusPlus::ISgfcBoardSizeProperty>) wrappedBoardSizeProperty;

@end
