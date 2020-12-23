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
/// information which casting method to use (but check hasTypedValue() first).
///
/// Property value objects are created either programmatically by the library
/// client by invoking a factory method, or they are created internally by
/// SgfcKit as part of parsing SGF content. In the latter case parsing of
/// raw string values might fail, which is why the methods hasTypedValue(),
/// typeConversionErrorMessage() and rawValue() exist. Carefully read
/// each method documentation to understand how they differ for the two
/// creation scenarios.
///
/// SGFCSinglePropertyValue is immutable, i.e. once the
/// SGFCSinglePropertyValue object is constructed it cannot be changed.
@interface SGFCSinglePropertyValue : NSObject <SGFCPropertyValue>
{
}

/// @brief Returns a newly constructed SGFCSinglePropertyValue object
/// that has the value type #SGFCPropertyValueTypeUnknown and the raw property
/// string value @a rawValue. hasTypedValue() returns NO and
/// typeConversionErrorMessage() returns an empty string.
///
/// @exception NSInvalidArgumentException Is raised if @a rawValue is @e nil.
+ (instancetype) singlePropertyValueWithRawValue:(NSString*)rawValue;

/// @brief Initializes an SGFCSinglePropertyValue object with value type
/// #SGFCPropertyValueTypeUnknown and the raw property string value @a rawValue.
/// The object's hasTypedValue() property returns NO and the
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
/// If the property value object was created internally by SgfcKit as
/// part of parsing SGF content, then the outcome is as follows:
/// - valueType() returns a well-defined value type (i.e. one that is not
///   #SGFCPropertyValueTypeUnknown) for values of properties that are
///   defined in the SGF standard. hasTypedValue() might still return NO
///   if SgfcKit was unable to interpret the SGF content. See the
///   documentation of hasTypedValue() for more details.
/// - valueType() returns #SGFCPropertyValueTypeUnknown for values of
///   properties that are not defined in the SGF standard (aka
///   "custom properties"). hasTypedValue() always returns NO in that
///   case.
///
/// If the property value object was created programmatically by the
/// library client by invoking a factory method, then valueType() returns
/// whichever SGFCPropertyValueType was requested by the library client.
/// hasTypeValue() always returns YES, unless the library client explicitly
/// requested an untyped property value for a custom property.
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
/// "Not available as a typed value" (i.e. hasTypedValue() returns NO)
/// means that the SGFCSinglePropertyValue object cannot be cast to any
/// concrete type, i.e. all of the convenience casting methods return
/// @e nil. The interpretation of the raw property string value
/// returned by rawValue() is left to the library client.
///
/// If the property value object was created internally by SgfcKit as
/// part of parsing SGF content, then the outcome is as follows:
/// - For values of properties that are defined in the SGF standard
///   SgfcKit attempts to interpret the raw property string value
///   according to the value type defined property in the SGF standard.
///   hasTypedValue() returns YES if that interpretation succeeds,
///   otherwwise it returns NO and typeConversionErrorMessage()
///   returns a description of why the interpretation failed.
/// - hasTypedValue() always returns NO for values of properties that
///   are not defined in the SGF standard (aka "custom properties").
///   typeConversionErrorMessage() returns an empty string in that case
///   because SgfcKit did not attempt an interpretation.
///
/// If the property value object was created programmatically by the
/// library client by invoking a factory method, then hasTypedValue()
/// returns YES unless the library client explicitly requested an untyped
/// property value for a custom property.
@property(nonatomic, readonly) BOOL hasTypedValue;

/// @brief Returns an error message that describes why the raw string value
/// returned by rawValue() could not be converted to the typed value
/// returned by valueType().
///
/// Returns an empty string if hasTypedValue() returns YES, or if it
/// returns NO but valueType() returns #SGFCPropertyValueTypeUnknown.
///
/// This method is intended for when the property value object was created
/// internally by SgfcKit as part of parsing SGF content, but there was
/// an error converting the raw string value to the expected value type.
///
/// If the property value object was created programmatically by the
/// library client by invoking a factory method, then
/// typeConversionErrorMessage() always returns an empty string because
/// the library client is not allowed to specify untyped property values.
@property(nonatomic, strong, readonly) NSString* typeConversionErrorMessage;

/// @brief Returns the property value as a raw string, i.e. as close as
/// possible as it appears in the original SGF content.
///
/// If the property value object was created programmatically by the
/// library client by invoking a factory method, then rawValue()
/// returns a properly stringified version of the typed property value.
/// Color and Double values are converted to the string value as defined
/// by the SGF standard.
///
/// If the property value object was created internally by SgfcKit as
/// part of parsing SGF content, then the following processing is applied
/// to the original SGF content before it is made available from this property
/// as raw string:
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
