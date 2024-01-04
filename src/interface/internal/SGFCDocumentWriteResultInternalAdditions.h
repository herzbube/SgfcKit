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
#import "../../../include/SGFCDocumentWriteResult.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcDocumentWriteResult.h>

// C++ Standard Library includes
#import <memory>

/// @brief The SGFCDocumentWriteResultInternalAdditions category adds a
/// library-internal API to the SGFCDocumentWriteResult class.
///
/// @ingroup internals
/// @ingroup sgfc-frontend
/// @ingroup document
@interface SGFCDocumentWriteResult(SGFCDocumentWriteResultInternalAdditions)

/// @brief Initializes an SGFCDocumentWriteResult object. The object wraps the
/// libsgfc++ object @a wrappedDocumentWriteResult.
///
/// This is the designated initializer of SGFCDocumentWriteResult.
///
/// @exception NSInvalidArgumentException Is raised if
/// @a wrappedDocumentWriteResult is @e nullptr.
- (instancetype) initWithWrappedDocumentWriteResult:(std::shared_ptr<LibSgfcPlusPlus::ISgfcDocumentWriteResult>)wrappedDocumentWriteResult;

/// @brief Returns the wrapped libsgfc++ object.
- (std::shared_ptr<LibSgfcPlusPlus::ISgfcDocumentWriteResult>) wrappedDocumentWriteResult;

@end
