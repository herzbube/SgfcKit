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
@class SGFCComposedPropertyValue;
@class SGFCBoardSizeProperty;
@class SGFCGameTypeProperty;
@class SGFCNumberPropertyValue;
@class SGFCProperty;
@protocol SGFCPropertyValue;

/// @brief The SGFCPropertyFactory class is a class that contains only class
/// methods. The class methods are factory methods used to construct
/// SGFCProperty objects, and objects of every known sub-type of SGFCProperty.
///
/// @ingroup public-api
/// @ingroup factory
/// @ingroup property
@interface SGFCPropertyFactory : NSObject
{
}

/// @brief Returns a newly constructed SGFCProperty object that has the
/// specified property type @a propertyType. The property has no values.
/// The property is not associated with any node.
///
/// If @a propertyType is #SGFCPropertyTypeSZ or #SGFCPropertyTypeGM, the
/// returned SGFCProperty object is an instance of SGFCBoardSizeProperty
/// or SGFCGameTypeProperty.
///
/// @exception NSInvalidArgumentException Is raised if @a propertyType is
/// #SGFCPropertyTypeUnknown.
+ (SGFCProperty*) propertyWithType:(SGFCPropertyType)propertyType;

/// @brief Returns a newly constructed SGFCProperty object that has the
/// specified property type @a propertyType and the specified property
/// value @a propertyValue. The property is not associated with any node.
/// The SGFCProperty object takes ownership of the SGFCPropertyValue
/// object @a propertyValue.
///
/// If @a propertyType is #SGFCPropertyTypeSZ or #SGFCPropertyTypeGM, the
/// returned SGFCProperty object is an instance of SGFCBoardSizeProperty
/// or SGFCGameTypeProperty.
///
/// If @a propertyValue is @e nil the returned SGFCProperty object has no
/// values.
///
/// @exception NSInvalidArgumentException Is raised if @a propertyType is
/// #SGFCPropertyTypeUnknown, or, in case @a propertyType is
/// #SGFCPropertyTypeSZ or #SGFCPropertyTypeGM, if @a propertyValue does
/// not meet the requirements of these property types. See the documentation
/// of SGFCBoardSizeProperty or SGFCGameTypeProperty for details.
+ (SGFCProperty*) propertyWithType:(SGFCPropertyType)propertyType
                             value:(id<SGFCPropertyValue>)propertyValue;

/// @brief Returns a newly constructed SGFCProperty object that has the
/// specified property type @a propertyType and the specified property
/// values @a propertyValues. The property is not associated with any node.
/// The SGFCProperty object takes ownership of the SGFCPropertyValue
/// objects in @a propertyValues.
///
/// If @a propertyType is #SGFCPropertyTypeSZ or #SGFCPropertyTypeGM, the
/// returned SGFCProperty object is an instance of SGFCBoardSizeProperty
/// or SGFCGameTypeProperty.
///
/// If @a propertyValues is @e nil the returned SGFCProperty object has no
/// values.
///
/// @exception NSInvalidArgumentException Is raised if @a propertyType is
/// #SGFCPropertyTypeUnknown, or, in case @a propertyType is
/// #SGFCPropertyTypeSZ or #SGFCPropertyTypeGM, if @a propertyValues
/// contains more than one value or the value does not meet the requirements
/// of these property types. See the documentation of
/// SGFCBoardSizeProperty or SGFCGameTypeProperty for details.
+ (SGFCProperty*) propertyWithType:(SGFCPropertyType)propertyType
                            values:(NSArray*)propertyValues;

/// @brief Returns a newly constructed SGFCProperty object that has the
/// specified property name @a propertyName. The property type is inferred
/// from the property name. The property has no values. The property is not
/// associated with any node.
///
/// Attempts to map @a propertyName to a value in the enumeration
/// SGFCPropertyType. If the mapping succeeds the result of invoking this
/// method is the same as invoking the overload that takes an
/// SGFCPropertyType value. If the mapping fails then the resulting
/// SGFCProperty object has #SGFCPropertyTypeUnknown.
///
/// If the mapped SGFCPropertyType value is #SGFCPropertyTypeSZ or
/// #SGFCPropertyTypeGM, the returned SGFCProperty object is an instance
/// of SGFCBoardSizeProperty or SGFCGameTypeProperty.
///
/// @exception NSInvalidArgumentException Is raised if @a propertyName is
/// @e nil.
+ (SGFCProperty*) propertyWithName:(NSString*)propertyName;

/// @brief Returns a newly constructed SGFCProperty object that has the
/// specified property name @a propertyName and the specified property
/// value @a propertyValue. The property type is inferred from the
/// property name. The property is not associated with any node.
/// The SGFCProperty object takes ownership of the SGFCPropertyValue
/// object @a propertyValue.
///
/// Attempts to map @a propertyName to a value in the enumeration
/// SGFCPropertyType. If the mapping succeeds the result of invoking this
/// method is the same as invoking the overload that takes an
/// SGFCPropertyType value. If the mapping fails then the resulting
/// SGFCProperty object has #SGFCPropertyTypeUnknown.
///
/// If the mapped SGFCPropertyType value is #SGFCPropertyTypeSZ or
/// #SGFCPropertyTypeGM, the returned SGFCProperty object is an instance
/// of SGFCBoardSizeProperty or SGFCGameTypeProperty.
///
/// If @a propertyValue is @e nil the returned SGFCProperty object has no
/// values.
///
/// @exception NSInvalidArgumentException Is raised if @a propertyName is
/// @e nil, or if the mapped SGFCPropertyType value is #SGFCPropertyTypeSZ or
/// #SGFCPropertyTypeGM and @a propertyValue does not meet the requirements of
/// these property types. See the documentation of SGFCBoardSizeProperty or
/// SGFCGameTypeProperty for details.
+ (SGFCProperty*) propertyWithName:(NSString*)propertyName
                             value:(id<SGFCPropertyValue>)propertyValue;

/// @brief Returns a newly constructed SGFCProperty object that has the
/// specified property name @a propertyName and the specified property
/// values @a propertyValues. The property type is inferred from the
/// property name. The property is not associated with any node.
/// The SGFCProperty object takes ownership of the SGFCPropertyValue
/// objects in @a propertyValues.
///
/// Attempts to map @a propertyName to a value in the enumeration
/// SGFCPropertyType. If the mapping succeeds the result of invoking this
/// method is the same as invoking the overload that takes an
/// SGFCPropertyType value. If the mapping fails then the resulting
/// SGFCProperty object has #SGFCPropertyTypeUnknown.
///
/// If the mapped SGFCPropertyType value is #SGFCPropertyTypeSZ or
/// #SGFCPropertyTypeGM, the returned SGFCProperty object is an instance
/// of SGFCBoardSizeProperty or SGFCGameTypeProperty.
///
/// If @a propertyValues is @e nil the returned SGFCProperty object has no
/// values.
///
/// @exception NSInvalidArgumentException Is raised if @a propertyName is
/// @e nil, or if the mapped SGFCPropertyType value is #SGFCPropertyTypeSZ or
/// #SGFCPropertyTypeGM and @a propertyValues contains more than one value or
/// the value does not meet the requirements of these property types. See the
/// documentation of SGFCBoardSizeProperty or SGFCGameTypeProperty
/// for details.
+ (SGFCProperty*) propertyWithName:(NSString*)propertyName
                            values:(NSArray*)propertyValues;

/// @brief Returns a newly constructed SGFCBoardSizeProperty object that
/// has no value. The property is not associated with any node.
+ (SGFCBoardSizeProperty*) boardSizeProperty;

/// @brief Returns a newly constructed SGFCBoardSizeProperty object that
/// has the specified property value @a propertyValue. The property is not
/// associated with any node. The SGFCBoardSizeProperty object takes
/// ownership of the SGFCNumberPropertyValue object @a propertyValue.
///
/// This overload constructs an SGFCBoardSizeProperty object that
/// describes a square board.
///
/// @exception NSInvalidArgumentException Is raised if @a propertyValue is
/// @e nil or if the @a propertyValue object's method hasTypedValue()
/// returns NO.
+ (SGFCBoardSizeProperty*) boardSizePropertyWithNumberValue:(SGFCNumberPropertyValue*)propertyValue;

/// @brief Returns a newly constructed SGFCBoardSizeProperty object that
/// has the specified property value @a propertyValue. The property is not
/// associated with any node. The SGFCBoardSizeProperty object takes
/// ownership of the SGFCComposedPropertyValue object @a propertyValue.
///
/// This overload constructs an SGFCBoardSizeProperty object that
/// describes a rectangular board.
///
/// @exception NSInvalidArgumentException Is raised if @a propertyValue is
/// @e nil or if the @a propertyValue object is not composed of two
/// SGFCNumberPropertyValue objects, or if any of the
/// SGFCNumberPropertyValue object's method hasTypedValue() returns NO.
+ (SGFCBoardSizeProperty*) boardSizePropertyWithComposedValue:(SGFCComposedPropertyValue*)propertyValue;

/// @brief Returns a newly constructed SGFCGameTypeProperty object that
/// has no value. The property is not associated with any node.
+ (SGFCGameTypeProperty*) gameTypeProperty;

/// @brief Returns a newly constructed SGFCGameTypeProperty object that
/// has the specified property value @a propertyValue. The property is not
/// associated with any node. The SGFCGameTypeProperty object takes
/// ownership of the SGFCNumberPropertyValue object @a propertyValue.
///
/// @exception NSInvalidArgumentException Is raised if @a propertyValue is
/// @e nil or if the @a propertyValue object's method hasTypedValue()
/// returns NO.
+ (SGFCGameTypeProperty*) gameTypePropertyWithNumberValue:(SGFCNumberPropertyValue*)propertyValue;

@end
