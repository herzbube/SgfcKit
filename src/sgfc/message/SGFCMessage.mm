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
#import "../../../include/SGFCMessage.h"
#import "../../interface/internal/SGFCMessageInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcMessage.h>

#pragma mark - Class extension

@interface SGFCMessage()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcMessage> _wrappedMessage;
}

- (instancetype) initWithWrappedMessage:(std::shared_ptr<LibSgfcPlusPlus::ISgfcMessage>)wrappedMessage NS_DESIGNATED_INITIALIZER;

@end

@implementation SGFCMessage

#pragma mark - Initialization and deallocation

- (instancetype) init
{
  // Always raising an exception is intended. This guards against the library
  // client attempting to manually allocate/initialize an SGFCMessage.
  [SGFCExceptionUtility raiseInvalidOperationExceptionWithReason:@"SGFCMessage cannot be instantiated from outside of the library"];

  // Dummy return to make compiler happy (compiler does not see that an
  // exception is raised)
  return [self initWithWrappedMessage:nullptr];
}

- (instancetype) initWithWrappedMessage:(std::shared_ptr<LibSgfcPlusPlus::ISgfcMessage>)wrappedMessage
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  if (wrappedMessage == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Message \"wrappedMessage\" is nullptr"];

  _wrappedMessage = wrappedMessage;

  return self;
}

- (void) dealloc
{
  _wrappedMessage = nullptr;
}

#pragma mark - Public API

- (NSInteger) messageID
{
  return [SGFCMappingUtility toSgfcKitInteger:_wrappedMessage->GetMessageID()];
}

- (SGFCMessageType) messageType
{
  return [SGFCMappingUtility toSgfcKitMessageType:_wrappedMessage->GetMessageType()];
}

- (NSInteger) lineNumber
{
  return [SGFCMappingUtility toSgfcKitInteger:_wrappedMessage->GetLineNumber()];
}

- (NSInteger) columnNumber
{
  return [SGFCMappingUtility toSgfcKitInteger:_wrappedMessage->GetColumnNumber()];
}

- (BOOL) isCriticalMessage
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedMessage->IsCriticalMessage()];
}

- (NSString*) messageText
{
  return [SGFCMappingUtility toSgfcKitString:_wrappedMessage->GetMessageText()];
}

- (NSString*) rawMessageText
{
  return [SGFCMappingUtility toSgfcKitString:_wrappedMessage->GetRawMessageText()];
}

#pragma mark - Internal API - SGFCMessageInternalAdditions overrides

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcMessage>) wrappedMessage
{
  return _wrappedMessage;
}

@end
