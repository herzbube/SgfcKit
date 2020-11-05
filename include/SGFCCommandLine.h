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
@class NSArray;
@class NSString;
@class SGFCArguments;
@class SGFCMessage;

/// @brief The SGFCCommandLine interface is used to operate the SGFC backend
/// in command line mode. Use SGFCKitFactory to construct new
/// SGFCCommandLine objects.
///
/// @ingroup public-api
/// @ingroup sgfc-frontend
///
/// The SGFCCommandLine interface is designed to give clients control over
/// when they want to execute load and save operations, and how they want the
/// operations to behave. Clients specify SGFC command line arguments when
/// they construct the SGFCCommandLine object. The SGFC command line
/// arguments cannot be changed after construction.
///
/// A client typically uses the SGFCCommandLine interface by following this
/// sequence, which corresponds to invoking SGFC on the command line with an
/// input file path and an output file path.
/// - Use SGFCKitFactory to construct the object.
/// - Verify that SGFC command line arguments are valid.
/// - If SGFC command line arguments are valid: Load SGF content.
/// - Access parse results.
/// - If SGF content is valid: Save SGF content.
///
/// A client may deviate from this sequence e.g. by repeatedly loading SGF
/// content without saving (syntax checking), or by repeatedly saving the
/// same SGF content to different locations.
///
/// A client that deviates from the sequence must still follow a certain
/// common-sense protocol in using the interface:
/// - It may not load SGF content if the SGFC command line arguments are not
///   valid. Use isCommandLineValid() to check this.
/// - It may not save SGF content that was found to be invalid during loading,
///   or save SGF content without prior loading any content. Use
///   isSgfContentValid() to check this.
@interface SGFCCommandLine : NSObject
{
}

/// @brief Returns a newly constructed SGFCCommandLine object that passes
/// the specified command line arguments to SGFC.
///
/// @param arguments The command line arguments to pass to SGFC. Invoke the
/// isCommandLineValid() method on the resulting object to
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

/// @brief Initializes an SGFCCommandLine object that passes
/// the specified command line arguments to SGFC.
///
/// @param arguments The command line arguments to pass to SGFC. Invoke the
/// isCommandLineValid() method on the resulting object to
/// find out whether the arguments are valid.
///
/// @note The content of @a arguments is copied, so if you change the
/// content it will not affect the SGFCCommandLine object returned from
/// this method.
///
/// @exception NSInvalidArgumentException Is raised if @a arguments is @e nil.
- (instancetype) initWithArguments:(SGFCArguments*)arguments;

/// @brief Initializes an SGFCCommandLine object that passes
/// no command line arguments to SGFC.
///
/// This is the designated initializer of SGFCArguments.
- (instancetype) initWithNoArguments NS_DESIGNATED_INITIALIZER;

/// @brief Returns the SGFC command line arguments that were used to
/// construct the SGFCCommandLine object. The collection that is returned
/// consists of SGFCArgument objects.
@property(nonatomic, strong, readonly) NSArray* arguments;

/// @brief Returns YES if the SGFC command line arguments that
/// arguments() returns are valid. Returns NO if they are not valid.
///
/// One known case where the command line arguments can be invalid is if
/// an illegal parameter is specified for one of the arguments that require
/// a parameter. Example: #SGFCArgumentTypeBeginningOfSgfData requires an
/// integer parameter. The argument is invalid if an integer value is
/// specified that is not within the accepted range.
///
/// There may be other cases. Invoke invalidCommandLineReason() to learn
/// the actual reason why the command line arguments are not valid.
@property(nonatomic, readonly, getter=isCommandLineValid) BOOL commandLineValid;

/// @brief Returns an SGFCMessage object with message type
/// #SGFCMessageTypeFatalError that describes why the SGFC command
/// line arguments that arguments() returns are not valid. This method
/// may only be invoked if isCommandLineValid() returns NO.
///
/// @exception SGFCInvalidOperationException Is raised if isCommandLineValid()
/// returns YES.
@property(nonatomic, strong, readonly) SGFCMessage* invalidCommandLineReason;

/// @brief Loads a single .sgf file from the specified path and puts it
/// through the SGFC parser. This method may only be invoked if
/// isCommandLineValid() returns YES.
///
/// @return An SGFCExitCode value whose numeric value matches one of the
/// exit codes of SGFC.
///
/// @exception SGFCInvalidOperationException Is raised if isCommandLineValid()
/// returns NO.
/// @exception NSInvalidArgumentException Is raised if @a sgfFilePath is @e nil.
- (SGFCExitCode) loadSgfContentFromFile:(NSString*)sgfFilePath;

/// @brief Loads the specified SGF content and puts it through the SGFC
/// parser. This method may only be invoked if isCommandLineValid() returns
/// YES.
///
/// @return An SGFCExitCode value whose numeric value matches one of the
/// exit codes of SGFC.
///
/// @exception SGFCInvalidOperationException Is raised if isCommandLineValid()
/// returns NO.
/// @exception NSInvalidArgumentException Is raised if @a sgfContent is @e nil.
- (SGFCExitCode) loadSgfContentFromString:(NSString*)sgfContent;

/// @brief Returns YES if the SGF content that was loaded and parsed by the
/// most recent invocation of either loadSgfContentFromFile:() or
/// loadSgfContentFromString:() is valid. Returns NO if the SGF content is not
/// valid, or if none of the methods have been invoked yet.
///
/// The SGF content is considered valid if loadSgfContentFromFile:() or
/// loadSgfContentFromString:() have been invoked at least once, and if their
/// invocation did not generate a fatal error. A fatal error shows up in the
/// collection of SGFCMessage objects that parseResult() returns, as an
/// SGFCMessage object with message type #SGFCMessageTypeFatalError.
///
/// @exception SGFCInvalidOperationException Is raised if isCommandLineValid()
/// returns NO.
@property(nonatomic, readonly, getter=isSgfContentValid) BOOL sgfContentValid;

/// @brief Returns a collection of SGFCMessage objects which together form
/// the parse result from the most recent invocation of either
/// loadSgfContentFromFile:() or loadSgfContentFromString:().
///
/// The collection is empty if none of the methods have been invoked yet, or
/// if the most recent load operation did not generate any messages.
///
/// If the collection is not empty, the messages appear in the order in
/// which they were generated by SGFC.
///
/// @exception SGFCInvalidOperationException Is raised if isCommandLineValid()
/// returns NO.
@property(nonatomic, strong, readonly) NSArray* parseResult;

/// @brief Saves the SGF content generated by SGFC after the most recent
/// invocation of either loadSgfContentFromFile:() or
/// loadSgfContentFromString:() to the .sgf file at the specified path. This
/// method may only be invoked if isSgfContentValid() returns YES.
///
/// If a file already exists at the specified path it is overwritten.
///
/// @return An SGFCExitCode value whose numeric value matches one of the
/// exit codes of SGFC.
///
/// @exception SGFCInvalidOperationException Is raised if isSgfContentValid()
/// returns NO.
/// @exception NSInvalidArgumentException Is raised if @a sgfFilePath is @e nil.
- (SGFCExitCode) saveSgfContentToFile:(NSString*)sgfFilePath;

/// @brief Saves the SGF content generated by SGFC after the most recent
/// invocation of either loadSgfContentFromFile:() or
/// loadSgfContentFromString:() into a new string object and returns a reference
/// to that string object in the out parameter. This method
/// may only be invoked if isSgfContentValid() returns YES.
///
/// @return An SGFCExitCode value whose numeric value matches one of the
/// exit codes of SGFC.
///
/// @exception SGFCInvalidOperationException Is raised if isSgfContentValid()
/// returns NO.
/// @exception NSInvalidArgumentException Is raised if dereferencing
/// @a sgfContent is @e nil.
- (SGFCExitCode) saveSgfContentToString:(out NSString**)sgfContent;

/// @brief Returns a collection of SGFCMessage objects which together form
/// the result from the most recent invocation of either saveSgfContentToFile:()
/// or saveSgfContentToString:().
///
/// The collection is empty if none of the methods have been invoked yet, or
/// if the most recent save operation did not generate any messages.
///
/// If the collection is not empty, the messages appear in the order in
/// which they were generated by SGFC.
///
/// @exception SGFCInvalidOperationException Is raised if isCommandLineValid()
/// returns NO.
@property(nonatomic, strong, readonly) NSArray* saveResult;

@end
