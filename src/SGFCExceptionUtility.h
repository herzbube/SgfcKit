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

/// @brief The SGFCExceptionUtility class is a container for various utility
/// functions related to raising/handling exceptions.
///
/// All functions in SGFCExceptionUtility are class methods, so there is no
/// need to create an instance of SGFCExceptionUtility.
@interface SGFCExceptionUtility : NSObject
{
}

/// @brief Does nothing if @a argument is not nil. Raises an
/// NSInvalidArgumentException if @a argument is nil. The exception reason is a
/// standard message that is parameterized with @a argumentName.
+ (void) raiseInvalidArgumentExceptionIfArgumentIsNil:(id)argument
                                  invalidArgumentName:(NSString*)argumentName;

/// @brief Raises an NSInvalidArgumentException that uses as its reason a
/// string generated by invoking the NSString class method stringWithFormat:()
/// and passing @a format and @a argumentValue as its parameters.
+ (void) raiseInvalidArgumentExceptionWithFormat:(NSString*)format
                                   argumentValue:(int)argumentValue;

/// @brief Raises an NSInvalidArgumentException using @a reason as the reason.
+ (void) raiseInvalidArgumentExceptionWithReason:(NSString*)reason;

/// @brief Raises an NSInvalidArgumentException using @a reason as the reason.
/// @a reason is assumed to have UTF-8 encoding.
+ (void) raiseInvalidArgumentExceptionWithCStringReason:(const char*)reason;

/// @brief Raises an #SGFCNotImplementedException using @a what as the reason.
/// @a what should be the name of a method, with the intent to explain what
/// has not been implemented.
+ (void) raiseNotImplementedExceptionWithReason:(NSString*)what;

@end
