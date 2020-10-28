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
#import "../include/SGFCConstants.h"
#import "SGFCExceptionUtility.h"

// System includes
#import <Foundation/NSException.h>
#import <Foundation/NSString.h>

@implementation SGFCExceptionUtility

#pragma mark - Public API

+ (void) raiseInvalidArgumentExceptionIfArgumentIsNil:(id)argument
                                  invalidArgumentName:(NSString*)argumentName
{
  if (argument)
    return;

  NSString* reason = [NSString stringWithFormat:@"Argument \"%@\" is nil", argumentName];
  [self raiseInvalidArgumentExceptionWithReason:reason];
}

+ (void) raiseInvalidArgumentExceptionWithFormat:(NSString*)format
                             objectArgumentValue:(id)argumentValue
{
  NSString* reason = [NSString stringWithFormat:format, argumentValue];
  [self raiseInvalidArgumentExceptionWithReason:reason];
}

+ (void) raiseInvalidArgumentExceptionWithReason:(NSString*)reason
{
  NSException* exception = [NSException exceptionWithName:NSInvalidArgumentException
                                                   reason:reason
                                                 userInfo:nil];
  @throw exception;
}

+ (void) raiseInvalidArgumentExceptionWithCStringReason:(const char*)reason
{
  [self raiseInvalidArgumentExceptionWithReason:[NSString stringWithUTF8String:reason]];
}

+ (void) raiseInternalInconsistencyExceptionWithCStringReason:(const char*)reason
{
  NSException* exception = [NSException exceptionWithName:NSInternalInconsistencyException
                                                   reason:[NSString stringWithUTF8String:reason]
                                                 userInfo:nil];
  @throw exception;
}

+ (void) raiseNotImplementedExceptionWithReason:(NSString*)what
{
  NSException* exception = [NSException exceptionWithName:SGFCNotImplementedException
                                                   reason:what
                                                 userInfo:nil];
  @throw exception;
}

@end
