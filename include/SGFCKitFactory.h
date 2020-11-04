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
@class SGFCArguments;
@class SGFCCommandLine;
@class SGFCDocument;
@class SGFCDocumentReader;
@class SGFCDocumentWriter;
@class SGFCGame;
@class SGFCNode;
@class SGFCPropertyFactory;
@class SGFCPropertyValueFactory;

/// @brief The SGFCKitFactory class is a class that contains only class methods.
/// The class methods are factory methods used to construct various library
/// objects.
///
/// @ingroup public-api
/// @ingroup factory
@interface SGFCKitFactory : NSObject
{
}

/// @brief Returns a newly constructed SGFCArguments object that initially
/// contains no arguments. Use the SGFCArguments object's add methods to
/// populate it with arguments.
+ (SGFCArguments*) emptyArguments;

/// @brief Returns a newly constructed SGFCCommandLine object that passes
/// the specified command line arguments to SGFC.
///
/// @param arguments The command line arguments to pass to SGFC. Invoke the
/// SGFCCommandLine::isCommandLineValid() method on the resulting object to
/// find out whether the arguments are valid.
///
/// @note The content of @a arguments is copied, so if you change the
/// content it will not affect the SGFCCommandLine object returned from
/// this method.
///
/// @exception NSInvalidArgumentException Is raised if @a arguments is @e nil.
+ (SGFCCommandLine*) commandLineWithArguments:(SGFCArguments*)arguments;

/// @brief Returns a newly constructed SGFCCommandLine object that passes
/// no command line arguments to SGFC.
+ (SGFCCommandLine*) commandLineWithNoArguments;

/// @brief Returns a newly constructed SGFCDocumentReader object.
+ (SGFCDocumentReader*) documentReader;

/// @brief Returns a newly constructed SGFCDocumentWriter object.
+ (SGFCDocumentWriter*) documentWriter;

/// @brief Returns a newly constructed SGFCDocument object. The
/// SGFCDocument is empty and contains no games.
+ (SGFCDocument*) document;

/// @brief Returns a newly constructed SGFCDocument object. The
/// SGFCDocument content consists of the specified game @a game. The
/// SGFCDocument object takes ownership of @a game.
///
/// If @a game is @e nil the returned SGFCDocument object is empty and contains
/// no games.
+ (SGFCDocument*) documentWithGame:(SGFCGame*)game;

/// @brief Returns a newly constructed SGFCGame object. The game type is
/// #SGFCDefaultGameType. The game is not associated with any
/// document. The game has no game tree.
+ (SGFCGame*) game;

/// @brief Returns a newly constructed SGFCGame object. The game tree's
/// root node is @a rootNode. The game type depends on the content of the
/// root node. The game is not associated with any document. The SGFCGame
/// object takes ownership of @a rootNode.
///
/// If @a rootNode is @e nil the returned SGFCGame object has no game tree and
/// its game type is #SGFCDefaultGameType.
+ (SGFCGame*) gameWithRootNode:(SGFCNode*)rootNode;

/// @brief Returns a newly constructed SGFCNode object that has no parent,
/// child or sibling and is not associated with any game.
+ (SGFCNode*) node;

/// @brief Returns a newly constructed SGFCPropertyFactory object
/// that can be used to create SGFCProperty objects, and objects of every
/// known sub-type of SGFCProperty.
+ (SGFCPropertyFactory*) propertyFactory;

/// @brief Returns a newly constructed SGFCPropertyValueFactory object
/// that can be used to create SGFCPropertyValue objects, and objects of
/// every known sub-type of SGFCPropertyValue.
+ (SGFCPropertyValueFactory*) propertyValueFactory;

@end
