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
#import "../../../include/SGFCGoStone.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcGoStone.h>

// C++ Standard Library includes
#include <memory>

/// @brief The SGFCGoStoneInternalAdditions category adds a library-internal
/// API to the SGFCGoStone class.
///
/// @ingroup private-api
/// @ingroup go
@interface SGFCGoStone(SGFCGoStoneInternalAdditions)

/// @brief Initializes an SGFCGoStone object. The object wraps the libsgfc++
/// object @a wrappedGoStone.
///
/// This is the designated initializer of SGFCGoStone.
///
/// @exception NSInvalidArgumentException Is raised if @a wrappedArgument is
/// @e nullptr.
- (id) initWithWrappedGoStone:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoStone>)wrappedGoStone;

@end
