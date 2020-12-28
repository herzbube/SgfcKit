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

/// @brief Maps values from the libsgfc++ enumeration SgfcExitCode to
/// values from the SgfcKit enumeration SGFCExitCode.
extern NSDictionary* exitCodeToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCExitCode to
/// values from the libsgfc++ enumeration SgfcExitCode.
extern NSDictionary* exitCodeFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcGameResultType to
/// values from the SgfcKit enumeration SGFCGameResultType.
extern NSDictionary* gameResultTypeToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCGameResultType to
/// values from the libsgfc++ enumeration SgfcGameResultType.
extern NSDictionary* gameResultTypeFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcGameType to values
/// from the SgfcKit enumeration SGFCGameType.
extern NSDictionary* gameTypeToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCGameType to values
/// from the libsgfc++ enumeration SgfcGameType.
extern NSDictionary* gameTypeFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcGoPlayerRankType to
/// values from the SgfcKit enumeration SGFCGoPlayerRankType.
extern NSDictionary* goPlayerRankTypeToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCGoPlayerRankType to
/// values from the libsgfc++ enumeration SgfcGoPlayerRankType.
extern NSDictionary* goPlayerRankTypeFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcGoPlayerRatingType to
/// values from the SgfcKit enumeration SGFCGoPlayerRatingType.
extern NSDictionary* goPlayerRatingTypeToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCGoPlayerRatingType to
/// values from the libsgfc++ enumeration SgfcGoPlayerRatingType.
extern NSDictionary* goPlayerRatingTypeFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcGoPointNotation to
/// values from the SgfcKit enumeration SGFCGoPointNotation.
extern NSDictionary* goPointNotationToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCGoPointNotation to
/// values from the libsgfc++ enumeration SgfcGoPointNotation.
extern NSDictionary* goPointNotationFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcGoRulesetType to
/// values from the SgfcKit enumeration SGFCGoRulesetType.
extern NSDictionary* goRulesetTypeToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCGoRulesetType to
/// values from the libsgfc++ enumeration SgfcGoRulesetType.
extern NSDictionary* goRulesetTypeFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcMessageID to
/// values from the SgfcKit enumeration SGFCMessageID.
extern NSDictionary* messageIDToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCMessageID to
/// values from the libsgfc++ enumeration SgfcMessageID.
extern NSDictionary* messageIDFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcMessageType to
/// values from the SgfcKit enumeration SGFCMessageType.
extern NSDictionary* messageTypeToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCMessageType to
/// values from the libsgfc++ enumeration SgfcMessageType.
extern NSDictionary* messageTypeFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcNodeTrait to values
/// from the SgfcKit enumeration SGFCNodeTrait.
extern NSDictionary* nodeTraitToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCNodeTrait to values
/// from the libsgfc++ enumeration SgfcNodeTrait.
extern NSDictionary* nodeTraitFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcPropertyCategory to
/// values from the SgfcKit enumeration SGFCPropertyCategory.
extern NSDictionary* propertyCategoryToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCPropertyCategory to
/// values from the libsgfc++ enumeration SgfcPropertyCategory.
extern NSDictionary* propertyCategoryFromSgfcKitMap;

/// @brief Maps values from the libsgfc++ enumeration SgfcPropertyTrait to
/// values from the SgfcKit enumeration SGFCPropertyTrait.
extern NSDictionary* propertyTraitToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCPropertyTrait to
/// values from the libsgfc++ enumeration SgfcPropertyTrait.
extern NSDictionary* propertyTraitFromSgfcKitMap;

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

/// @brief Maps values from the libsgfc++ enumeration SgfcWinType to
/// values from the SgfcKit enumeration SGFCWinType.
extern NSDictionary* winTypeToSgfcKitMap;

/// @brief Maps values from the SgfcKit enumeration SGFCWinType to
/// values from the libsgfc++ enumeration SgfcWinType.
extern NSDictionary* winTypeFromSgfcKitMap;
//@}
