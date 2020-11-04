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
#import "SGFCExitCode.h"

// System includes
#import <Foundation/NSObject.h>

// Forward declarations
@class SGFCDocument;

/// @brief The SGFCDocumentReadResult class provides access to the result
/// of a read operation performed by SGFCDocumentReader.
///
/// @ingroup public-api
/// @ingroup sgfc-frontend
/// @ingroup document
///
/// SGFCDocumentReadResult is immutable, i.e. once the
/// SGFCDocumentReadResult object is constructed it cannot be changed.
///
/// Do @b NOT attempt to create an SGFCDocumentReadResult object yourself,
/// instead always use the SGFCDocumentReadResult object returned by one of
/// SGFCDocumentReader's read operations.
@interface SGFCDocumentReadResult : NSObject
{
}

/// @brief Do @b NOT use this initializer, it always raises
/// SGFCInvalidOperationException.
///
/// @exception SGFCInvalidOperationException Is raised whenever this initializer
/// is invoked.
- (id) init;


/// @brief Returns an SGFCExitCode value that best fits the result of the
/// read operation. The numeric value of the SGFCExitCode corresponds to
/// one of the exit codes of SGFC.
@property(nonatomic, readonly) SGFCExitCode exitCode;

/// @brief Returns YES if the SGF data that was loaded and parsed by the
/// read operation is valid. Returns NO if the SGF data is not valid.
///
/// The SGF data is considered valid if the read operation did not
/// generate a fatal error. A fatal error shows up in the collection of
/// SGFCMessage objects that parseResult() returns, as an SGFCMessage
/// object with message type #SGFCMessageTypeFatalError.
///
/// Typical fatal errors are invalid arguments, or the SGF data could not
/// be read e.g. because the specified SGF file does not exist.
///
/// @todo The SGF data should probably also be considered invalid if
/// there were critical errors.
@property(nonatomic, readonly, getter=isSgfDataValid) BOOL sgfDataValid;

/// @brief Returns a collection of SGFCMessage objects which together form
/// the parse result of the read operation. The messages appear in the order
/// in which they were generated by SGFC. The collection is empty if the
/// read operation did not generate any messages.
@property(nonatomic, strong, readonly) NSArray* parseResult;

/// @brief Returns the document object that provides access to the SGF data
/// in structured form. If isSgfDataValid() returns NO the document
/// object that is returned contains no data.
@property(nonatomic, strong, readonly) SGFCDocument* document;

/// @brief Prints the content of the SGFCDocumentReadResult to stdout for
/// debugging purposes.
///
/// @todo Remove this prior to release.
- (void) debugPrintToConsole;

@end
