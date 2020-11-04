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
#import "interface/internal/SGFCMessageInternalAdditions.h"
#import "SGFCExceptionUtility.h"
#import "SGFCWrappingUtility.h"

// System includes
#import <Foundation/NSArray.h>

@implementation SGFCWrappingUtility

#pragma mark - Public API

+ (NSArray*) wrapMessages:(const std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcMessage>>&)messagesToWrap
{
  NSMutableArray* messages = [NSMutableArray arrayWithCapacity:0];

  for (auto messageToWrap : messagesToWrap)
  {
    [messages addObject:[[SGFCMessage alloc] initWithWrappedMessage:messageToWrap]];
  }

  return messages;
}

@end
