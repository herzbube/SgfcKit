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

// System includes
#import <Foundation/NSObject.h>

// Forward declarations
@class NSString;
@class SGFCArguments;
@class SGFCDocumentReadResult;

/// @brief The SGFCDocumentReader interface provides functions to generate
/// SGFCDocument objects by reading SGF data from the filesystem or from
/// in-memory data. SGFCDocumentReader operates the SGFC backend to achieve
/// its task. Use SGFCKitFactory to construct new SGFCDocumentReader
/// objects.
///
/// @ingroup public-api
/// @ingroup sgfc-frontend
/// @ingroup document
@interface SGFCDocumentReader : NSObject
{
}

/// @brief Returns a newly constructed SGFCDocumentReader object.
+ (instancetype) documentReader;

/// @brief Initializes an SGFCDocumentReader object.
///
/// This is the designated initializer of SGFCArguments.
- (instancetype) init NS_DESIGNATED_INITIALIZER;

/// @brief Returns an object with the collection of arguments that
/// SGFCDocumentReader passes on to SGFC whenever it performs a read
/// operation.
///
/// The collection of arguments is initially empty. Add arguments to the
/// collection to change the way how SGFC reads SGF content. The collection
/// retains its state between read operations so that repeated read
/// operations use the same arguments.
@property(nonatomic, strong, readonly) SGFCArguments* arguments;

/// @brief Reads SGF data from a single .sgf file located at the specified
/// path and puts the data through the SGFC parser, using the arguments that
/// arguments() currently returns.
///
/// @return An SGFCDocumentReadResult object that provides the result of
/// the read operation.
- (SGFCDocumentReadResult*) readSgfContentFromFile:(NSString*)sgfFilePath;

/// @brief Reads SGF data from the specified string and puts the data
/// through the SGFC parser, using the arguments that arguments()
/// currently returns.
///
/// @return An SGFCDocumentReadResult object that provides the result of
/// the read operation.
- (SGFCDocumentReadResult*) readSgfContentFromString:(NSString*)sgfContent;

@end
