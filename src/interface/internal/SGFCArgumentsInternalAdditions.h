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
#import "../../../include/SGFCArguments.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcArguments.h>

// C++ Standard Library includes
#import <memory>

/// @brief The SGFCArgumentsInternalAdditions category adds a library-internal
/// API to the SGFCArguments class.
///
/// @ingroup internals
/// @ingroup sgfc-arguments
@interface SGFCArguments(SGFCArgumentsInternalAdditions)

/// @brief Initializes an SGFCArguments object. The object wraps the libsgfc++
/// object @a wrappedArguments.
///
/// @exception NSInvalidArgumentException Is raised if @a wrappedArguments is
/// @e nullptr.
- (instancetype) initWithWrappedArguments:(std::shared_ptr<LibSgfcPlusPlus::ISgfcArguments>)wrappedArguments;

/// @brief Returns the wrapped libsgfc++ object.
- (std::shared_ptr<LibSgfcPlusPlus::ISgfcArguments>) wrappedArguments;

@end
