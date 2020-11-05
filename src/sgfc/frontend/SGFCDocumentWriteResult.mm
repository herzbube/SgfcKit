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
#import "../../../include/SGFCDocumentWriteResult.h"
#import "../../interface/internal/SGFCDocumentWriteResultInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"
#import "../../SGFCWrappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcDocumentWriteResult.h>

#pragma mark - Class extension

@interface SGFCDocumentWriteResult()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcDocumentWriteResult> _wrappedDocumentWriteResult;
  NSArray* _parseResult;
}

- (instancetype) initWithWrappedDocumentWriteResult:(std::shared_ptr<LibSgfcPlusPlus::ISgfcDocumentWriteResult>)wrappedDocumentWriteResult NS_DESIGNATED_INITIALIZER;

@end

@implementation SGFCDocumentWriteResult

#pragma mark - Initialization and deallocation

- (instancetype) init
{
  // Always raising an exception is intended. This guards against the library
  // client attempting to manually allocate/initialize an SGFCDocumentWriteResult.
  [SGFCExceptionUtility raiseInvalidOperationExceptionWithReason:@"SGFCDocumentWriteResult cannot be instantiated from outside of the library"];

  // Dummy return to make compiler happy (compiler does not see that an
  // exception is raised)
  return [self initWithWrappedDocumentWriteResult:nullptr];
}

- (instancetype) initWithWrappedDocumentWriteResult:(std::shared_ptr<LibSgfcPlusPlus::ISgfcDocumentWriteResult>)wrappedDocumentWriteResult
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  if (wrappedDocumentWriteResult == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedDocumentWriteResult\" is nullptr"];

  _wrappedDocumentWriteResult = wrappedDocumentWriteResult;
  _parseResult = nil;

  return self;
}

- (void) dealloc
{
  _wrappedDocumentWriteResult = nullptr;
  _parseResult = nil;
}

#pragma mark - Public API

- (SGFCExitCode) exitCode
{
  return [SGFCMappingUtility toSgfcKitExitCode:_wrappedDocumentWriteResult->GetExitCode()];
}

- (NSArray*) parseResult
{
  if (_parseResult)
  {
    // Reuse a previously created array to provide stable wrapper objects.
  }
  else
  {
    _parseResult = [SGFCWrappingUtility wrapMessages:_wrappedDocumentWriteResult->GetParseResult()];
  }

  return _parseResult;
}

- (void) debugPrintToConsole
{
  _wrappedDocumentWriteResult->DebugPrintToConsole();
}

#pragma mark - Internal API - SGFCDocumentWriteResultInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcDocumentWriteResult>) wrappedDocumentWriteResult
{
  return _wrappedDocumentWriteResult;
}

@end
