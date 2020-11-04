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

// Project includes
#import "../../../include/SGFCCommandLine.h"
#import "../../interface/internal/SGFCArgumentsInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"
#import "../../SGFCWrappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcCommandLine.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

// System includes
#import <Foundation/NSArray.h>

#pragma mark - Class extension

@interface SGFCCommandLine()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcCommandLine> _wrappedCommandLine;
}

@property(nonatomic, strong, readwrite) NSArray* arguments;
@property(nonatomic, strong, readwrite) SGFCMessage* invalidCommandLineReason;
@property(nonatomic, strong, readwrite) NSArray* parseResult;
@property(nonatomic, strong, readwrite) NSArray* saveResult;

@end

@implementation SGFCCommandLine

#pragma mark - Initialization and deallocation

+ (SGFCCommandLine*) commandLineWithArguments:(SGFCArguments*)arguments
{
  return [[SGFCCommandLine alloc] initWithArguments:arguments];
}

+ (SGFCCommandLine*) commandLineWithNoArguments
{
  return [[SGFCCommandLine alloc] initWithNoArguments];
}

- (id) init
{
  return [self initWithNoArguments];
}

- (id) initWithArguments:(SGFCArguments*)arguments
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:arguments
                                                 invalidArgumentName:@"arguments"];

  self = [self initWithNoArguments];

  _wrappedCommandLine = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreateSgfcCommandLine(
    [arguments wrappedArguments]);

  // libsgfc++ made a copy of the arguments, so we can't just use the wrapper
  // objects that we received in the SGFCArguments parameter. Instead we have
  // to create new wrapper objects.
  self.arguments = [SGFCWrappingUtility wrapArgumentCollection:_wrappedCommandLine->GetArguments()];

  return self;
}

- (id) initWithNoArguments
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  _wrappedCommandLine = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreateSgfcCommandLine();
  self.arguments = [NSArray array];

  self.invalidCommandLineReason = nil;
  self.parseResult = nil;
  self.saveResult = nil;

  return self;
}

- (void) dealloc
{
  _wrappedCommandLine = nullptr;
  self.arguments = nil;
  self.invalidCommandLineReason = nil;
  self.parseResult = nil;
  self.saveResult = nil;
}

#pragma mark - Public API

- (BOOL) isCommandLineValid
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedCommandLine->IsCommandLineValid()];
}

- (SGFCMessage*) invalidCommandLineReason
{
  if (self.invalidCommandLineReason == nil)
  {
    try
    {
      auto wrappedMessage = _wrappedCommandLine->GetInvalidCommandLineReason();
      self.invalidCommandLineReason = [SGFCWrappingUtility wrapMessage:wrappedMessage];
    }
    catch (std::logic_error& exception)
    {
      [SGFCExceptionUtility raiseInvalidOperationExceptionWithCStringReason:exception.what()];
    }
  }

  return self.invalidCommandLineReason;
}

- (SGFCExitCode) loadSgfContentFromFile:(NSString*)sgfFilePath
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:sgfFilePath
                                                 invalidArgumentName:@"sgfFilePath"];

  [self invalidateCacheOnLoadOperation];

  try
  {
    return [SGFCMappingUtility toSgfcKitExitCode:_wrappedCommandLine->LoadSgfFile(
      [SGFCMappingUtility fromSgfcKitString:sgfFilePath])];
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseInvalidOperationExceptionWithCStringReason:exception.what()];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return SGFCExitCodeFatalError;
  }
}

- (SGFCExitCode) loadSgfContentFromString:(NSString*)sgfContent
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:sgfContent
                                                 invalidArgumentName:@"sgfContent"];

  [self invalidateCacheOnLoadOperation];

  try
  {
    return [SGFCMappingUtility toSgfcKitExitCode:_wrappedCommandLine->LoadSgfContent(
      [SGFCMappingUtility fromSgfcKitString:sgfContent])];
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseInvalidOperationExceptionWithCStringReason:exception.what()];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return SGFCExitCodeFatalError;
  }
}

- (BOOL) isSgfContentValid
{
  try
  {
    return [SGFCMappingUtility toSgfcKitBoolean:_wrappedCommandLine->IsSgfContentValid()];
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseInvalidOperationExceptionWithCStringReason:exception.what()];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return NO;
  }
}

- (NSArray*) parseResult
{
  if (self.parseResult)
  {
    // Reuse a previously created array to provide stable wrapper objects.
    // The cached array object is cleared when new SGF content is loaded.
  }
  else
  {
    try
    {
      self.parseResult = [SGFCWrappingUtility wrapMessages:_wrappedCommandLine->GetParseResult()];
    }
    catch (std::logic_error& exception)
    {
      [SGFCExceptionUtility raiseInvalidOperationExceptionWithCStringReason:exception.what()];
    }
  }

  return self.parseResult;

}

- (SGFCExitCode) saveSgfContentToFile:(NSString*)sgfFilePath
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:sgfFilePath
                                                 invalidArgumentName:@"sgfFilePath"];

  [self invalidateCacheOnSaveOperation];

  try
  {
    return [SGFCMappingUtility toSgfcKitExitCode:_wrappedCommandLine->SaveSgfFile(
      [SGFCMappingUtility fromSgfcKitString:sgfFilePath])];
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseInvalidOperationExceptionWithCStringReason:exception.what()];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return SGFCExitCodeFatalError;
  }
}

// Two solutions for specifying an out parameter exist:
//
// 1) (NSString**)                     >>> the compiler generates this:
//    (NSString* __autoreleasing *)
// 2) (out NSString**)                 >>> the compiler generates this:
//    (out NSString* __autoreleasing *)
//
// (*) the __autoreleasing attribute can also be explicitly specified.
//
// I like the second solution better because it tells the fellow programmer
// that the methods is not going to evaluate the parameter value.
//
// See this SO answerr for details: https://stackoverflow.com/a/18970186/1054378
- (SGFCExitCode) saveSgfContentToString:(out NSString**)sgfContent
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:*sgfContent
                                                 invalidArgumentName:@"sgfContent"];

  [self invalidateCacheOnSaveOperation];

  try
  {
    std::string wrappedSgfContent;
    SGFCExitCode exitCode = [SGFCMappingUtility toSgfcKitExitCode:_wrappedCommandLine->SaveSgfContent(
      wrappedSgfContent)];

    *sgfContent = [SGFCMappingUtility toSgfcKitString:wrappedSgfContent];
    return exitCode;
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseInvalidOperationExceptionWithCStringReason:exception.what()];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return SGFCExitCodeFatalError;
  }
}

- (NSArray*) saveResult
{
  if (self.saveResult)
  {
    // Reuse a previously created array to provide stable wrapper objects.
    // The cached array object is cleared when new SGF content is loaded.
  }
  else
  {
    try
    {
      self.saveResult = [SGFCWrappingUtility wrapMessages:_wrappedCommandLine->GetSaveResult()];
    }
    catch (std::logic_error& exception)
    {
      [SGFCExceptionUtility raiseInvalidOperationExceptionWithCStringReason:exception.what()];
    }
  }

  return self.saveResult;
}

- (void) invalidateCacheOnLoadOperation
{
  self.parseResult = nil;

  // The ISgfcCommandLine documentation clearly states that GetSaveResult()
  // returns the result of the **most recent** save operation. This means that
  // a load operation does not clear the save result, so the cached wrapper
  // objects in self.saveResult can remain.
}

- (void) invalidateCacheOnSaveOperation
{
  self.saveResult = nil;
}

@end
