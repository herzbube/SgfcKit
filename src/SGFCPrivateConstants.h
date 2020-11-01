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
#import <Foundation/NSDictionary.h>


/// @file
///
/// @brief This file defines the library's internal constants.
///
/// @ingroup internals
/// @ingroup library-support


/// @name Mappings between libsgfc++ and SgfcKit enum values
//@{
/// @brief Maps values from the libsgfc++ enumeration SgfcArgumentType to values
/// from the SgfcKit enumeration SGFCArgumentType.
extern NSDictionary* argumentTypeToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCArgumentType to values
/// from the libsgfc++ enumeration SgfcArgumentType.
extern NSDictionary* argumentTypeFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcColor to
/// values from the SgfcKit enumeration SGFCColor.
extern NSDictionary* colorToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCColor to
/// values from the libsgfc++ enumeration SgfcColor.
extern NSDictionary* colorFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcCoordinateSystem to
/// values from the SgfcKit enumeration SGFCCoordinateSystem.
extern NSDictionary* coordinateSystemToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCCoordinateSystem to
/// values from the libsgfc++ enumeration SgfcCoordinateSystem.
extern NSDictionary* coordinateSystemFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcDouble to
/// values from the SgfcKit enumeration SGFCDouble.
extern NSDictionary* doubleToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCDouble to
/// values from the libsgfc++ enumeration SgfcDouble.
extern NSDictionary* doubleFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcGameType to values
/// from the SgfcKit enumeration SGFCGameType.
extern NSDictionary* gameTypeToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCGameType to values
/// from the libsgfc++ enumeration SgfcGameType.
extern NSDictionary* gameTypeFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcGoPointNotation to
/// values from the SgfcKit enumeration SGFCGoPointNotation.
extern NSDictionary* goPointNotationToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCGoPointNotation to
/// values from the libsgfc++ enumeration SgfcGoPointNotation.
extern NSDictionary* goPointNotationFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcPropertyType to values
/// from the SgfcKit enumeration SGFCPropertyType.
extern NSDictionary* propertyTypeToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCPropertyType to values
/// from the libsgfc++ enumeration SgfcPropertyType.
extern NSDictionary* propertyTypeFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcPropertyValueType to
/// values from the SgfcKit enumeration SGFCPropertyValueType.
extern NSDictionary* propertyValueTypeToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCPropertyValueType to
/// values from the libsgfc++ enumeration SgfcPropertyValueType.
extern NSDictionary* propertyValueTypeFromSgfcKitMap;
//@}
