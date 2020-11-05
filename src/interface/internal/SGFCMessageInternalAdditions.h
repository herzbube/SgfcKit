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
#import "../../../include/SGFCMessage.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcMessage.h>

// C++ Standard Library includes
#include <memory>

/// @brief The SGFCMessageInternalAdditions category adds a library-internal
/// API to the SGFCMessage class.
///
/// @ingroup private-api
/// @ingroup sgfc-message
@interface SGFCMessage(SGFCMessageInternalAdditions)

/// @brief Initializes an SGFCMessage object. The object wraps the libsgfc++
/// object @a wrappedMessage.
///
/// This is the designated initializer of SGFCMessage.
///
/// @exception NSInvalidArgumentException Is raised if @a wrappedMessage is
/// @e nullptr.
- (instancetype) initWithWrappedMessage:(std::shared_ptr<LibSgfcPlusPlus::ISgfcMessage>)wrappedMessage;

/// @brief Returns the wrapped libsgfc++ object.
- (std::shared_ptr<LibSgfcPlusPlus::ISgfcMessage>) wrappedMessage;

@end
