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

// Forward declarations
@class SGFCNumberPropertyValue;
@class SGFCRealPropertyValue;
@class SGFCDoublePropertyValue;
@class SGFCColorPropertyValue;
@class SGFCSimpleTextPropertyValue;
@class SGFCTextPropertyValue;
@class SGFCPointPropertyValue;
@class SGFCMovePropertyValue;
@class SGFCStonePropertyValue;

/// @brief The SGFCSinglePropertyValue class provides access to one of
/// the values of a property of an SGF node. The value is a single value of a
/// basic value type. Some properties allow composed values - see
/// SGFCComposedPropertyValue for details.
///
/// @ingroup public-api
/// @ingroup property-value
///
/// SGFCSinglePropertyValue contains a number of convenience methods that
/// help casting an SGFCSinglePropertyValue object to a concrete type (e.g.
/// toNumberValue()). The property @e valueType() provides the
/// information which casting method to use.
///
/// SGFCSinglePropertyValue is immutable, i.e. once the
/// SGFCSinglePropertyValue object is constructed it cannot be changed.
@interface SGFCSinglePropertyValue : NSObject <SGFCPropertyValue>
{
}

/// @brief Returns a newly constructed SGFCSinglePropertyValue object
/// that has the value type #SGFCPropertyValueTypeUnknown and the raw property
/// string value @a rawValue. hasTypedValue() returns false and
/// typeConversionErrorMessage() returns an empty string.
///
/// @exception NSInvalidArgumentException Is raised if @a rawValue is @e nil.
+ (instancetype) singlePropertyValueWithRawValue:(NSString*)rawValue;

/// @brief Initializes an SGFCSinglePropertyValue object with value type
/// #SGFCPropertyValueTypeUnknown and the raw property string value @a rawValue.
/// The object's hasTypedValue() property returns false and the
/// typeConversionErrorMessage() property returns an empty string.
///
/// @exception NSInvalidArgumentException Is raised if @a rawValue is @e nil.
///
/// This is the designated initializer of SGFCSinglePropertyValue.
- (instancetype) initWithRawValue:(NSString*)rawValue NS_DESIGNATED_INITIALIZER;

/// @brief Returns the concrete type of the property value object. Depending
/// on the value returned, a caller then knows which one of the convenience
/// casting methods to use.
///
/// valueType() returns the value type that is defined in the SGF
/// standard. If the actual SGF content does not conform to the SGF
/// standard, then SgfcKit will be unable to parse the raw property string
/// value. hasTypedValue() returns NO to indicate such cases. See the
/// documentation of hasTypedValue() for more details.
///
/// valueType() returns #SGFCPropertyValueTypeUnknown for values of
/// properties that are not defined in the SGF standard. In that case the
/// SGFCSinglePropertyValue object cannot be cast to any concrete type,
/// i.e. all of the convenience casting methods will return @e nil.
/// The interpretation of the raw property string value returned by
/// rawValue() is left to the caller.
///
/// @note valueType() never returns #SGFCPropertyValueTypeNone.
@property(nonatomic, readonly) SGFCPropertyValueType valueType;

/// @brief Returns YES if the raw string value returned by rawValue()
/// is available as a typed value. Otherwise returns NO.
///
/// "Available as a typed value" means that SGFCSinglePropertyValue can be
/// cast to a concrete type and that type can then be used to retrieve the
/// typed value. Example: valueType() returns
/// #SGFCPropertyValueTypeNumber. toNumberValue() can therefore be invoked
/// to obtain an SGFCNumberPropertyValue object, and
/// SGFCNumberPropertyValue::numberValue() can then be invoked to
/// retrieve the signed integer number that corresponds to the raw string
/// value that rawValue() returns.
///
/// When SgfcKit parses SGF content it attempts to interpret the raw
/// property string value according to the value type defined for the
/// property in the SGF standard. If that interpretation fails
/// valueType() will return the value type according to the SGF standard
/// definition, but hasTypedValue() will return NO.
@property(nonatomic, readonly) BOOL hasTypedValue;

/// @brief Returns an error message that describes why the raw string value
/// returned by rawValue() could not be converted to the typed value
/// returned by valueType().
///
/// Invoking this method makes sense only if valueType() returns a value
/// other than #SGFCPropertyValueTypeUnknown, because only in this case
/// does SgfcKit attempt a conversion. In addition, hasTypedValue()
/// obviously must return NO to indicate that a type conversion error
/// occurred.
///
/// Returns an empty string if valueType() returns
/// #SGFCPropertyValueTypeUnknown or if hasTypedValue() returns NO.
@property(nonatomic, strong, readonly) NSString* typeConversionErrorMessage;

/// @brief Returns the property value as a raw string, i.e. as close as
/// possible as it appears in the original SGF content.
///
/// The following processing is applied to the original SGF content before
/// it is made available from this property as raw string:
/// - The escape character ("\") is stripped from SimpleText and Text
///   values (unless it was escaped itself).
/// - Values that are not SimpleText or Text are trimmed of leading and
///   trailing whitespace.
/// - In SimpleText values, whitespace characters other than space are
///   converted to space. Exception: Escaped line breaks are removed
///   entirely.
/// - In Text values, whitespace characters other than line breaks are
///   converted to space. In addition, escaped line breaks are removed
///   entirely.
/// - In SimpleText and Text values, all unnecessary escape characters
///   are removed. E.g. escaping the "a" character is not necessary, so
///   "\a" appears as simply "a" in the raw string. Necessary escape
///   characters are preserved, though, and appear in the raw string
///   (e.g. "\\" or "\]").
/// - In Move values, if the game type is Go and the board size is <= 19x19,
///   the value "tt" is converted to an empty string. This is in accord with
///   the SGF standard that defines an empty string and value "tt" both
///   to express a pass move, but in FF4 the "tt" representation is kept
///   only for compatibility with FF3.
@property(nonatomic, strong, readonly) NSString* rawValue;

/// @brief Returns an SGFCNumberPropertyValue object if valueType()
/// returns #SGFCPropertyValueTypeNumber. Returns @e nil otherwise.
/// The caller is not the owner of the returned object.
- (SGFCNumberPropertyValue*) toNumberValue;

/// @brief Returns an SGFCRealPropertyValue object if valueType()
/// returns #SGFCPropertyValueTypeReal. Returns @e nil otherwise.
/// The caller is not the owner of the returned object.
- (SGFCRealPropertyValue*) toRealValue;

/// @brief Returns an SGFCDoublePropertyValue object if valueType()
/// returns #SGFCPropertyValueTypeDouble. Returns @e nil otherwise.
/// The caller is not the owner of the returned object.
- (SGFCDoublePropertyValue*) toDoubleValue;

/// @brief Returns an SGFCColorPropertyValue object if valueType()
/// returns #SGFCPropertyValueTypeColor. Returns @e nil otherwise.
/// The caller is not the owner of the returned object.
- (SGFCColorPropertyValue*) toColorValue;

/// @brief Returns an SGFCSimpleTextPropertyValue object if valueType()
/// returns #SGFCPropertyValueTypeSimpleText. Returns @e nil otherwise.
/// The caller is not the owner of the returned object.
- (SGFCSimpleTextPropertyValue*) toSimpleTextValue;

/// @brief Returns an SGFCTextPropertyValue object if valueType()
/// returns #SGFCPropertyValueTypeText. Returns @e nil otherwise.
/// The caller is not the owner of the returned object.
- (SGFCTextPropertyValue*) toTextValue;

/// @brief Returns an SGFCPointPropertyValue object if valueType()
/// returns #SGFCPropertyValueTypePoint. Returns @e nil otherwise.
/// The caller is not the owner of the returned object.
- (SGFCPointPropertyValue*) toPointValue;

/// @brief Returns an SGFCMovePropertyValue object if valueType()
/// returns #SGFCPropertyValueTypeMove. Returns @e nil otherwise.
/// The caller is not the owner of the returned object.
- (SGFCMovePropertyValue*) toMoveValue;

/// @brief Returns an SGFCStonePropertyValue object if valueType()
/// returns #SGFCPropertyValueTypeStone. Returns @e nil otherwise.
/// The caller is not the owner of the returned object.
- (SGFCStonePropertyValue*) toStoneValue;

@end
