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
#import "../../../include/SGFCGoPoint.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcGoPoint.h>

// C++ Standard Library includes
#import <memory>

/// @brief The SGFCGoPointInternalAdditions category adds a library-internal
/// API to the SGFCGoPoint class.
///
/// @ingroup internals
/// @ingroup go
@interface SGFCGoPoint(SGFCGoPointInternalAdditions)

/// @brief Initializes an SGFCGoPoint object. The object wraps the libsgfc++
/// object @a wrappedGoPoint.
///
/// This is the designated initializer of SGFCGoPoint.
///
/// @exception NSInvalidArgumentException Is raised if @a wrappedArgument is
/// @e nullptr.
- (instancetype) initWithWrappedGoPoint:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoPoint>)wrappedGoPoint;

@end
