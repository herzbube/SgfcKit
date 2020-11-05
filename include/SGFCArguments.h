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
#import "SGFCArgumentType.h"
#import "SGFCPropertyType.h"

// System includes
#import <Foundation/NSObject.h>

// Forward declarations
@class NSArray;
@class SGFCArgument;

/// @brief The SGFCArguments class represents a collection of arguments
/// to be passed on to SGFC when it reads or writes SGF content.
///
/// @ingroup public-api
/// @ingroup sgfc-arguments
@interface SGFCArguments : NSObject
{
}

/// @brief Returns a newly constructed SGFCArguments object that initially
/// contains no arguments. Use the SGFCArguments object's add methods to
/// populate it with arguments.
+ (instancetype) emptyArguments;

/// @brief Initializes an SGFCArguments object that contains no arguments.
///
/// This is the designated initializer of SGFCArguments.
- (instancetype) init NS_DESIGNATED_INITIALIZER;

/// @brief Returns YES if the SGFCArguments object contains one or more
/// arguments. Returns NO if the SGFCArguments object contains no
/// arguments.
@property(nonatomic, readonly) BOOL hasArguments;

/// @brief Returns a collection of arguments that make up the content of
/// the SGFCArguments object. The collection is ordered, beginning with the
/// first argument that was added to the SGFCArguments object. The
/// collection is empty if the SGFCArguments object contains no arguments.
@property(nonatomic, strong, readonly) NSArray* arguments;

/// @brief Adds an argument to the end of the collection of arguments that
/// make up the content of the SGFCArguments object.
///
/// @param argumentType The argument type.
///
/// @exception NSInvalidArgumentException Is raised if @a argumentType requires
/// a parameter, or if the collection already contains an argument with the
/// same type as @a argumentType.
- (void) addArgumentWithType:(SGFCArgumentType)argumentType;

/// @brief Adds an argument to the end of the collection of arguments that
/// make up the content of the SGFCArguments object.
///
/// @param argumentType The argument type.
/// @param parameter The argument's integer type parameter.
///
/// @exception NSInvalidArgumentException Is raised if @a argumentType does not
/// require an integer type parameter, or if @a argumentType does not
/// support multiple specifications but the collection already contains an
/// argument with the same type as @a argumentType, or if @a argumentType
/// supports multiple specifications but the collection already contains an
/// argument with an argument type / parameter combination that is equal to
/// @a argumentType and @a parameter.
- (void) addArgumentWithType:(SGFCArgumentType)argumentType
            withIntParameter:(NSInteger)parameter;

/// @brief Adds an argument to the end of the collection of arguments that
/// make up the content of the SGFCArguments object.
///
/// @param argumentType The argument type.
/// @param parameter The argument's SGFCPropertyType parameter.
///
/// @exception NSInvalidArgumentException Is raised if @a argumentType does not
/// require an SGFCPropertyType parameter, or if @a argumentType does not
/// support multiple specifications but the collection already contains an
/// argument with the same type as @a argumentType, or if @a argumentType
/// supports multiple specifications but the collection already contains an
/// argument with an argument type / parameter combination that is equal to
/// @a argumentType and @a parameter.
- (void) addArgumentWithType:(SGFCArgumentType)argumentType
   withPropertyTypeParameter:(SGFCPropertyType)parameter;

/// @brief Removes all arguments from the collection of arguments that make
/// up the content of the SGFCArguments object.
- (void) clearArguments;

@end
