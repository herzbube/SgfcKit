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
#import "../../../include/SGFCGameInfo.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcGameInfo.h>

// C++ Standard Library includes
#import <memory>

/// @brief The SGFCGameInfoInternalAdditions category adds a
/// library-internal API to the SGFCGameInfo class.
///
/// @ingroup internals
/// @ingroup property-value
/// @ingroup game
@interface SGFCGameInfo(SGFCGameInfoInternalAdditions)

/// @brief Initializes an SGFCGameInfo object. The object wraps
/// the libsgfc++ object @a wrappedGameInfo.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedGameInfo is @e nullptr.
- (instancetype) initWithWrappedGameInfo:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGameInfo>)wrappedGameInfo;

/// @brief Returns the wrapped libsgfc++ object.
- (std::shared_ptr<LibSgfcPlusPlus::ISgfcGameInfo>) wrappedGameInfo;

/// @brief Sets the wrapped libsgfc++ object to @a wrappedGameInfo.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedGameInfo is @e nullptr.
- (void) setWrappedGameInfo:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGameInfo>)wrappedGameInfo;

@end
