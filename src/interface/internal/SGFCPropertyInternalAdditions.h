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
#import "../../../include/SGFCProperty.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcProperty.h>

// C++ Standard Library includes
#include <memory>

/// @brief The SGFCPropertyInternalAdditions category adds a
/// library-internal API to the SGFCProperty class.
///
/// @ingroup private-api
/// @ingroup property
@interface SGFCProperty(SGFCPropertyInternalAdditions)

/// @brief Returns the wrapped libsgfc++ object.
- (std::shared_ptr<LibSgfcPlusPlus::ISgfcProperty>) wrappedProperty;

@end
