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
#import "SGFCTypedefs.h"

// System includes
#import <Foundation/NSObjCRuntime.h>
#import <Foundation/NSString.h>

/// @brief The SGFCRoundInformation struct is a simple type that can hold the
/// decomposed values of an #SGFCPropertyTypeRO property value.
///
/// @ingroup public-api
/// @ingroup property-value
/// @ingroup game
///
/// The SGF standard specifies that the #SGFCPropertyTypeRO property value
/// should be written as "xx (tt)", where "xx" is the number of the round and
/// "(tt)" the type of the round. SGFCRoundInformationFromPropertyValue()
/// can be used to convert from such a composite property value to an
/// SGFCRoundInformation object, which holds the decomposed values, while
/// SGFCRoundInformationToPropertyValue() stitches the decomposed values in
/// an SGFCRoundInformation object back together to a composite property
/// value.
///
/// @see SGFCRoundInformationMake
/// @see SGFCRoundInformationFromPropertyValue
/// @see SGFCRoundInformationToPropertyValue
/// @see SGFCRoundInformationEqualToRoundInformation
/// @see SGFCRoundInformationNotEqualToRoundInformation
typedef struct
{
  /// @brief The round number. The default is an empty string.
  ///
  /// Although the term "round number" implies a numeric value, the
  /// SGFCRoundInformation struct defines this to be a string, because the
  /// SGF standard also does not define a specific value type.
  NSString* RoundNumber;

  /// @brief The round type. The default is an empty string.
  NSString* RoundType;

  /// @brief YES if the SGFCRoundInformation object holds valid round
  /// number and round type values. NO if the round number and round type
  /// values are not valid. The default is NO.
  ///
  /// This is mainly used to indicate whether
  /// SGFCRoundInformationFromPropertyValue() was successful in decomposing
  /// the #SGFCPropertyTypeRO property value. A library client that manually
  /// creates an SGFCRoundInformation object can simply set this to YES to
  /// assert valid values.
  BOOL IsValid;
} SGFCRoundInformation;

// Prevent C++ name mangling
#ifdef __cplusplus
extern "C"
{
#endif

// Because the struct SGFCRoundInformation contains NSString references the
// struct is incompatible with C (a class like NSString can never be fully
// declared in a way that C will understand). Because of this, and because some
// of the following functions with C linkage return an SGFCRoundInformation
// object, the compiler issues an incompatibility warning. The warnings are
// misleading, though, because we don't intend the code to be compiled for /
// used by C - we intend it to be compiled for / used by Objective-C.
// Because of this we suppress the misleading compiler warnings with the
// following pragmas.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wreturn-type-c-linkage"
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wreturn-type-c-linkage"

  /// @brief Returns an SGFCRoundInformation value initialized with
  /// @a roundNumber, @a roundType and @a isValid.
  extern SGFCRoundInformation SGFCRoundInformationMake(NSString* roundNumber, NSString* roundType, BOOL isValid);

  /// @brief Decomposes the content of @a propertyValue into distinct round
  /// number and round type values.
  ///
  /// The SGF standard specifies that @a propertyValue for
  /// #SGFCPropertyTypeRO should be written as "xx (tt)", where "xx" is the
  /// number of the round and "(tt)" the type of the round. This method
  /// attempts to parse @a propertyValue according to the SGF standard's
  /// suggested formatting.
  ///
  /// @return SGFCRoundInformation An object with the decomposed round number
  /// and round type values. The object's SGFCRoundInformation::IsValid member
  /// is YES if decomposition was successful, otherwise it is NO.
  extern SGFCRoundInformation SGFCRoundInformationFromPropertyValue(NSString* propertyValue);

  /// @brief Composes a property value for #SGFCPropertyTypeRO from the
  /// round number and round type values in @a roundInformation.
  ///
  /// The SGF standard specifies that a property value for
  /// #SGFCPropertyTypeRO should be written as "xx (tt)", where "xx" is the
  /// number of the round and "(tt)" the type of the round. This method
  /// composes a return value that conforms to the SGF standard's suggested
  /// formatting.
  ///
  /// @return NSString A property value for #SGFCPropertyTypeRO that
  /// conforms to the SGF standard's suggested formatting, or
  /// #SGFCNoneValueString if the SGFCRoundInformation::IsValid
  /// member of @a roundInformation is NO.
  extern NSString* SGFCRoundInformationToPropertyValue(SGFCRoundInformation roundInformation);

  /// @brief Returns YES if the properties @e RoundNumber, @e RoundType and
  /// @e IsValid are the same for @a roundInformation1 and for
  /// @a roundInformation2. Returns NO if any of these properties are different.
  extern BOOL SGFCRoundInformationEqualToRoundInformation(SGFCRoundInformation roundInformation1, SGFCRoundInformation roundInformation2);

  /// @brief Returns YES if any of the properties @e RoundNumber, @e RoundType or
  /// @e IsValid are different for @a roundInformation1 and for
  /// @a roundInformation2. Returns NO if all properties are the same.
  extern BOOL SGFCRoundInformationNotEqualToRoundInformation(SGFCRoundInformation roundInformation1, SGFCRoundInformation roundInformation2);

#pragma GCC diagnostic pop
#pragma clang diagnostic pop

#ifdef __cplusplus
}
#endif
