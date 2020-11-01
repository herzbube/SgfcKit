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

/// @brief The SGFCArgument class represents a single argument to be
/// passed on to SGFC when it reads or writes SGF content. Depending on the
/// argument type, the argument also has either an integer type or an
/// SGFCPropertyType parameter.
///
/// @ingroup public-api
/// @ingroup sgfc-arguments
///
/// Do @b NOT attempt to create an SGFCArgument object yourself, instead always
/// use the add methods of the SGFCArguments object that you want to add an
/// argument to.
@interface SGFCArgument : NSObject
{
}

/// @brief Do @b NOT use this initializer, it always raises
/// NSInvalidArgumentException.
///
/// @exception NSInvalidArgumentException Is raised whenever this initializer
/// is invoked.
- (id) init;

/// @brief Returns the argument type.
@property(nonatomic, readonly) SGFCArgumentType argumentType;

/// @brief Returns YES if the argument has an integer type parameter.
@property(nonatomic, readonly) BOOL hasIntegerTypeParameter;

/// @brief Returns the argument's integer type parameter value. The return
/// value is undefined if hasIntegerTypeParameter() returns NO.
@property(nonatomic, readonly) NSInteger integerTypeParameter;

/// @brief Returns YES if the argument has an SGFCPropertyType parameter.
@property(nonatomic, readonly) BOOL hasPropertyTypeParameter;

/// @brief Returns the argument's SGFCPropertyType parameter value. The
/// return value is undefined if hasPropertyTypeParameter() returns NO.
@property(nonatomic, readonly) SGFCPropertyType propertyTypeParameter;

/// @brief Returns the argument as a string, exactly as it would be
/// specified on the SGFC command line. Examples: -n, -b1, -yMA.
- (NSString*) toString;

@end
