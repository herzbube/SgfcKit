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
#import "SGFCPropertyValue.h"
#import "SGFCPropertyValueType.h"

// System includes
#import <Foundation/NSObject.h>

/// @brief The SGFCComposedPropertyValue class provides access to one of
/// the values of a property of an SGF node. The value is a composite of two
/// SGFCSinglePropertyValue objects.
///
/// @ingroup public-api
/// @ingroup property-value
///
/// The class name uses the term "composed" because that is how it appears in
/// the SGF standard.
///
/// SGFCComposedPropertyValue is immutable, i.e. once the
/// SGFCComposedPropertyValue object is constructed it cannot be changed.
@interface SGFCComposedPropertyValue : NSObject <SGFCPropertyValue>
{
}

/// @brief Returns a newly constructed SGFCComposedPropertyValue object
/// that consists of the two values @a value1 and @a value2.
///
/// @exception NSInvalidArgumentException Is raised if @a value1 is @e nil or
/// if @a value2 is @e nil.
+ (SGFCComposedPropertyValue*) composedPropertyValueWithValue1:(SGFCSinglePropertyValue*)value1
                                                        value2:(SGFCSinglePropertyValue*)value2;


/// @brief Initializes an SGFCComposedPropertyValue object that consists of the
/// two values @a value1 and @a value2.
///
/// @exception NSInvalidArgumentException Is raised if @a value1 is @e nil or
/// if @a value2 is @e nil.
///
/// This is the designated initializer of SGFCComposedPropertyValue.
- (id) initWithValue1:(SGFCSinglePropertyValue*)value1
               value2:(SGFCSinglePropertyValue*)value2;

/// @brief Returns the first property value.
@property(nonatomic, strong, readonly) SGFCSinglePropertyValue* value1;

/// @brief Returns the second property value.
@property(nonatomic, strong, readonly) SGFCSinglePropertyValue* value2;

@end
