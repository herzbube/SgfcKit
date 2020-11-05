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
#import "../../../include/SGFCDocumentReadResult.h"
#import "../../interface/internal/SGFCDocumentReadResultInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"
#import "../../SGFCWrappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcDocumentReadResult.h>

#pragma mark - Class extension

@interface SGFCDocumentReadResult()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcDocumentReadResult> _wrappedDocumentReadResult;
  NSArray* _parseResult;
  SGFCDocument* _document;
}

- (instancetype) initWithWrappedDocumentReadResult:(std::shared_ptr<LibSgfcPlusPlus::ISgfcDocumentReadResult>)wrappedDocumentReadResult NS_DESIGNATED_INITIALIZER;

@end

@implementation SGFCDocumentReadResult

#pragma mark - Initialization and deallocation

- (instancetype) init
{
  // Always raising an exception is intended. This guards against the library
  // client attempting to manually allocate/initialize an SGFCDocumentReadResult.
  [SGFCExceptionUtility raiseInvalidOperationExceptionWithReason:@"SGFCDocumentReadResult cannot be instantiated from outside of the library"];

  // Dummy return to make compiler happy (compiler does not see that an
  // exception is raised)
  return [self initWithWrappedDocumentReadResult:nullptr];
}

- (instancetype) initWithWrappedDocumentReadResult:(std::shared_ptr<LibSgfcPlusPlus::ISgfcDocumentReadResult>)wrappedDocumentReadResult
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  if (wrappedDocumentReadResult == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedDocumentReadResult\" is nullptr"];

  _wrappedDocumentReadResult = wrappedDocumentReadResult;
  _parseResult = nil;
  _document = nil;

  return self;
}

- (void) dealloc
{
  _wrappedDocumentReadResult = nullptr;
  _parseResult = nil;
  _document = nil;
}

#pragma mark - Public API

- (SGFCExitCode) exitCode
{
  return [SGFCMappingUtility toSgfcKitExitCode:_wrappedDocumentReadResult->GetExitCode()];
}

- (BOOL) isSgfDataValid
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedDocumentReadResult->IsSgfDataValid()];
}

- (NSArray*) parseResult
{
  if (_parseResult)
  {
    // Reuse a previously created array to provide stable wrapper objects.
  }
  else
  {
    _parseResult = [SGFCWrappingUtility wrapMessages:_wrappedDocumentReadResult->GetParseResult()];
  }

  return _parseResult;
}

- (SGFCDocument*) document
{
  if (_document)
  {
    // Reuse a previously created wrapper to provide stable wrapper objects.
  }
  else
  {
    _document = [SGFCWrappingUtility wrapDocument:_wrappedDocumentReadResult->GetDocument()];
  }

  return _document;
}

- (void) debugPrintToConsole
{
  _wrappedDocumentReadResult->DebugPrintToConsole();
}

#pragma mark - Internal API - SGFCDocumentReadResultInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcDocumentReadResult>) wrappedDocumentReadResult
{
  return _wrappedDocumentReadResult;
}

@end
