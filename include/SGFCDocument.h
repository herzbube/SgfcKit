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

// System includes
#import <objc/NSObject.h>

// Forward declarations
@class NSArray;
@class SGFCGame;

/// @brief The SGFCDocument class provides access to a collection of SGF
/// games. When you read an SGF file, the SGF data in that file becomes an
/// SGFCDocument.
///
/// @ingroup public-api
/// @ingroup document
@interface SGFCDocument : NSObject
{
}

/// @brief Returns true if the document has no content. Returns false if
/// the document has some content.
///
/// The document is empty if it contains no games.
@property(nonatomic, readonly, getter=isEmpty) bool empty;

/// @brief A collection of SGFCGame objects that together make up the document.
/// The collection does not contain @e nil values. The collection does not
/// contain duplicates.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value, or if the property is set with a collection that contains
/// duplicates.
@property(nonatomic, strong) NSArray* games;

/// @brief Adds @a game as the last game to the collection of games that
/// together make up the document. @a game may not be @e nil.
///
/// @exception NSInvalidArgumentException Is raised if @a game is @e nil or
/// if @a game is already in the collection.
- (void) appendGame:(SGFCGame*)game;

/// @brief Removes @a game from the collection of games that together make
/// up the document.
///
/// @exception NSInvalidArgumentException Is raised if @a game is not part of
/// the collection of games that together make up the document.
- (void) removeGame:(SGFCGame*)game;

/// @brief Removes all games from the collection of games that together make
/// up the document.
- (void) removeAllGames;

/// @brief Prints the content of the SGFCDocument to stdout for debugging
/// purposes.
///
/// @todo Remove this prior to release.
- (void) debugPrintToConsole;

@end
