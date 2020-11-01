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
#import "SGFCPropertyType.h"

// System includes
#import <Foundation/NSObject.h>

// Forward declarations
@class NSArray;
@class NSString;
@class SGFCBoardSizeProperty;
@class SGFCGameTypeProperty;
@protocol SGFCPropertyValue;

/// @brief The SGFCProperty class provides access to the data of a single
/// property of an SGF node. One property has 0-n values.
///
/// @ingroup public-api
/// @ingroup property
@interface SGFCProperty : NSObject
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
/// If @a propertyValue is @e nil the returned SGFCProperty object has no
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
/// If @a propertyValue is @e nil the returned SGFCProperty object has no
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

/// @brief Initializes an SGFCProperty object. The object has the
/// specified property type @a propertyType. The property has no values.
/// The property is not associated with any node.
///
/// If @a propertyType is #SGFCPropertyTypeSZ or #SGFCPropertyTypeGM, the
/// returned SGFCProperty object is an instance of SGFCBoardSizeProperty
/// or SGFCGameTypeProperty.
///
/// @exception NSInvalidArgumentException Is raised if @a propertyType is
/// #SGFCPropertyTypeUnknown.
- (id) initWithPropertyType:(SGFCPropertyType)propertyType;

/// @brief Initializes an SGFCProperty object. The object has the
/// specified property type @a propertyType and the specified property
/// value @a propertyValue. The property is not associated with any node.
/// The SGFCProperty object takes ownership of the SGFCPropertyValue
/// object @a propertyValue.
///
/// If @a propertyType is #SGFCPropertyTypeSZ or #SGFCPropertyTypeGM, the
/// returned SGFCProperty object is an instance of SGFCBoardSizeProperty
/// or SGFCGameTypeProperty.
///
/// If @a propertyValue is @e nil the SGFCProperty object is initialized with
/// no values.
///
/// @exception NSInvalidArgumentException Is raised if @a propertyType is
/// #SGFCPropertyTypeUnknown, or, in case @a propertyType is
/// #SGFCPropertyTypeSZ or #SGFCPropertyTypeGM, if @a propertyValue does
/// not meet the requirements of these property types. See the documentation
/// of SGFCBoardSizeProperty or SGFCGameTypeProperty for details.
- (id) initWithPropertyType:(SGFCPropertyType)propertyType
                      value:(id<SGFCPropertyValue>)propertyValue;

/// @brief Initializes an SGFCProperty object. The object has the
/// specified property type @a propertyType and the specified property
/// values @a propertyValues. The property is not associated with any node.
/// The SGFCProperty object takes ownership of the SGFCPropertyValue
/// objects in @a propertyValues.
///
/// If @a propertyType is #SGFCPropertyTypeSZ or #SGFCPropertyTypeGM, the
/// returned SGFCProperty object is an instance of SGFCBoardSizeProperty
/// or SGFCGameTypeProperty.
///
/// If @a propertyValues is @e nil the SGFCProperty object is initialized with
/// no values.
///
/// @exception NSInvalidArgumentException Is raised if @a propertyType is
/// #SGFCPropertyTypeUnknown, or, in case @a propertyType is
/// #SGFCPropertyTypeSZ or #SGFCPropertyTypeGM, if @a propertyValues
/// contains more than one value or the value does not meet the requirements
/// of these property types. See the documentation of
/// SGFCBoardSizeProperty or SGFCGameTypeProperty for details.
- (id) initWithPropertyType:(SGFCPropertyType)propertyType
                     values:(NSArray*)propertyValues;

/// @brief Initializes an SGFCProperty object. The object has the
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
- (id) initWithPropertyName:(NSString*)propertyName;

/// @brief Initializes an SGFCProperty object. The object has the
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
//////
/// If @a propertyValue is @e nil the SGFCProperty object is initialized with
/// no values.
///
/// @exception NSInvalidArgumentException Is raised if @a propertyName is
/// @e nil, or if the mapped SGFCPropertyType value is #SGFCPropertyTypeSZ or
/// #SGFCPropertyTypeGM and @a propertyValue does not meet the requirements of
/// these property types. See the documentation of SGFCBoardSizeProperty or
/// SGFCGameTypeProperty for details.
- (id) initWithPropertyName:(NSString*)propertyName
                      value:(id<SGFCPropertyValue>)propertyValue;

/// @brief Initializes an SGFCProperty object. The object has the
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
/// If @a propertyValues is @e nil the SGFCProperty object is initialized with
/// no values.
///
/// @exception NSInvalidArgumentException Is raised if @a propertyName is
/// @e nil, if the mapped SGFCPropertyType value is #SGFCPropertyTypeSZ or
/// #SGFCPropertyTypeGM and @a propertyValues contains more than one value or
/// the value does not meet the requirements of these property types. See the
/// documentation of SGFCBoardSizeProperty or SGFCGameTypeProperty
/// for details.
///
/// This is the designated initializer of SGFCProperty.
- (id) initWithPropertyName:(NSString*)propertyName
                     values:(NSArray*)propertyValues;

/// @brief Returns the type of the property. Returns
/// #SGFCPropertyTypeUnknown if the property is a custom property that is
/// not defined in the SGF standard.
///
/// The property type cannot be changed after the SGFCProperty has been
/// constructed.
@property(nonatomic, readonly) SGFCPropertyType propertyType;

/// @brief Returns the name of the property.
///
/// The property name cannot be changed after the SGFCProperty has been
/// constructed.
///
/// All properties defined in the SGF standard have a name that consists of
/// two uppercase letters. Application-specific properties not defined in
/// the standard may not adhere to this restriction (although the standard
/// advises against this).
@property(nonatomic, strong, readonly) NSString* propertyName;

/// @brief A collection with the values of the property. The
/// collection is empty if the property has no values. The order in which
/// values appear in the collection matches the order in which values were
/// specified when the SGFCProperty was constructed.
///
/// The EBNF in the SGF standard says that at least one value must be
/// present. This can be a value that has the value type "None", which is
/// defined to be an empty string. The meaning for the file content is
/// clear: Something like XY[] is possible. In the library's object model,
/// however, a "None" value is translated to an empty collection.
///
/// The setter makes no attempt to check the validity of the property
/// values. A last-ditch attempt at validation is made by SGFC later when
/// the game tree is written to an SGF file or to an SGF content string, but
/// this is unlikely to catch all mistakes. It is ultimately the
/// responsibility of the library client to take care that the values
/// are valid. The consequence of faulty values is that the library client
/// might be unable to read in the game tree again after it has been written
/// out.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value, or if the property is set with a collection that contains
/// @e nil values.
@property(nonatomic, strong) NSArray* propertyValues;

/// @brief Returns the property's first value if the property has any
/// values. Returns @e nil if the property has no values.
///
/// This is a convenience method for properties that can have only a single
/// value.
@property(nonatomic, strong, readonly) id<SGFCPropertyValue> propertyValue;

/// @brief Returns an SGFCGameTypeProperty object if propertyType()
/// returns #SGFCPropertyTypeGM. Returns @e nil otherwise.
/// The caller is not the owner of the returned object.
- (SGFCGameTypeProperty*) toGameTypeProperty;

/// @brief Returns an SGFCBoardSizeProperty object if propertyType()
/// returns #SGFCPropertyTypeSZ. Returns @e nil otherwise.
/// The caller is not the owner of the returned object.
- (SGFCBoardSizeProperty*) toBoardSizeProperty;

@end
