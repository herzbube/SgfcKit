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
#import "../../../include/SGFCDocument.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcDocument.h>

// C++ Standard Library includes
#include <memory>

/// @brief The SGFCDocumentInternalAdditions category adds a library-internal
/// API to the SGFCDocument class.
///
/// @ingroup private-api
/// @ingroup document
@interface SGFCDocument(SGFCDocumentInternalAdditions)

/// @brief Initializes an SGFCDocument object. The object wraps the libsgfc++
/// object @a wrappedDocument.
///
/// This is the designated initializer of SGFCDocument.
///
/// @exception NSInvalidArgumentException Is raised if @a wrappedDocument is
/// @e nullptr.
- (instancetype) initWithWrappedDocument:(std::shared_ptr<LibSgfcPlusPlus::ISgfcDocument>)wrappedDocument;

/// @brief Returns the wrapped libsgfc++ object.
- (std::shared_ptr<LibSgfcPlusPlus::ISgfcDocument>) wrappedDocument;

@end
