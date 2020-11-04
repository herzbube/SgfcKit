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
@class SGFCDocument;
@class SGFCDocumentWriteResult;

/// @brief The SGFCDocumentWriter interface provides functions to generate
/// SGF data from SGFCDocument objects and to either write that data to the
/// filesystem or make it available as an in-memory string.
/// SGFCDocumentWriter operates the SGFC backend to achieve its task. Use
/// SGFCKitFactory to construct new SGFCDocumentWriter objects.
///
/// @ingroup public-api
/// @ingroup sgfc-frontend
/// @ingroup document
@interface SGFCDocumentWriter : NSObject
{
}

/// @brief Returns a newly constructed SGFCDocumentWriter object.
+ (SGFCDocumentWriter*) documentWriter;

/// @brief Initializes an SGFCDocumentWriter object.
///
/// This is the designated initializer of SGFCArguments.
- (id) init NS_DESIGNATED_INITIALIZER;

/// @brief Returns an object with the collection of arguments that
/// SGFCDocumentWriter passes on to SGFC whenever it performs a write
/// operation.
///
/// The collection of arguments is initially empty. Add arguments to the
/// collection to change the way how SGFC writes SGF content. The collection
/// retains its state between write operations so that repeated write
/// operations use the same arguments.
@property(nonatomic, strong, readonly) SGFCArguments* arguments;

/// @brief Writes the content of @a document to a single .sgf file located
/// at the specified path, using the arguments that arguments() currently
/// returns.
///
/// @return An SGFCDocumentWriteResult object that provides the result of
/// the write operation.
///
/// @exception SGFCDocumentStructureException Is raised if @a document cannot
/// be encoded into a string due to some fundamental error in the object tree.
/// Currently the only known case is if the document contains one or more
/// games that have no root node.
- (SGFCDocumentWriteResult*) writeSgfContent:(SGFCDocument*)document
                                      toFile:(NSString*)sgfFilePath;

/// @brief Writes the content of @a document into the specified string
/// object @a sgfContent, using the arguments that arguments() currently
/// returns.
///
/// @return An SGFCDocumentWriteResult object that provides the result of
/// the write operation.
///
/// @exception SGFCDocumentStructureException Is raised if @a document cannot
/// be encoded into a string due to some fundamental error in the object tree.
/// Currently the only known case is if the document contains one or more
/// games that have no root node.
- (SGFCDocumentWriteResult*) writeSgfContent:(SGFCDocument*)document
                                    toString:(out NSString**)sgfContent;

/// @brief Encodes the content of @a document into an SGF content stream
/// and prints that stream to stdout for debugging purposes.
///
/// This is useful to see the SGF content that the writer would pass to
/// SGFC for parsing and writing.
///
/// @todo Remove this prior to release.
- (void) debugPrintToConsole:(SGFCDocument*)document;

@end
