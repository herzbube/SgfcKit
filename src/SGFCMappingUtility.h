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
#import "../include/SGFCArgumentType.h"
#import "../include/SGFCBoardSize.h"
#import "../include/SGFCColor.h"
#import "../include/SGFCCoordinateSystem.h"
#import "../include/SGFCDouble.h"
#import "../include/SGFCGameType.h"
#import "../include/SGFCGoPointNotation.h"
#import "../include/SGFCPropertyType.h"
#import "../include/SGFCPropertyValueType.h"
#import "../include/SGFCTypedefs.h"

// libsgfc++ includes
#import <libsgfcplusplus/SgfcArgumentType.h>
#import <libsgfcplusplus/SgfcBoardSize.h>
#import <libsgfcplusplus/SgfcColor.h>
#import <libsgfcplusplus/SgfcCoordinateSystem.h>
#import <libsgfcplusplus/SgfcDouble.h>
#import <libsgfcplusplus/SgfcGameType.h>
#import <libsgfcplusplus/SgfcGoPointNotation.h>
#import <libsgfcplusplus/SgfcPropertyType.h>
#import <libsgfcplusplus/SgfcPropertyValueType.h>
#import <libsgfcplusplus/SgfcTypedefs.h>

// C++ Standard Library includes
#import <string>

// System includes
#import <Foundation/NSObject.h>

/// @brief The SGFCMappingUtility class is a container for various utility
/// functions related to mapping SgfcKit values to the corresponding libsgfc++
/// values, and vice versa.
///
/// @ingroup internals
/// @ingroup library-support
///
/// All functions in SGFCMappingUtility are class methods, so there is no
/// need to create an instance of SGFCMappingUtility.
@interface SGFCMappingUtility : NSObject
{
}

/// @brief Maps a value from the SgfcKit enumeration SGFCArgumentType to the
/// corresponding value from the libsgfc++ enumeration SgfcArgumentType.
///
/// This is a convenience function that looks up @a argumentType in
/// #argumentTypeToSgfcKitMap.
///
/// @exception NSInternalInconsistencyException Is raised if there is no
/// mapping, i.e. if @a argumentType does not appear in
/// #argumentTypeToSgfcKitMap. In practice this should never occur. If it
/// occurs it indicates a programming error in the library, i.e. an
/// LibSgfcPlusPlus::SgfcArgumentType value was not added to
/// #argumentTypeToSgfcKitMap.
+ (SGFCArgumentType) toSgfcKitArgumentType:(LibSgfcPlusPlus::SgfcArgumentType)argumentType;

/// @brief Maps a value from the libsgfc++ enumeration SgfcArgumentType to the
/// corresponding value from the the SgfcKit enumeration SGFCArgumentType.
///
/// This is a convenience function that looks up @a argumentType in
/// #argumentTypeFromSgfcKitMap.
///
/// @exception NSInternalInconsistencyException Is raised if there is no
/// mapping, i.e. if @a argumentType does not appear in
/// #argumentTypeFromSgfcKitMap. In practice this should never occur. If it
/// occurs it indicates a programming error in the library, i.e. an
/// SGFCArgumentType value was not added to
/// #argumentTypeFromSgfcKitMap.
+ (LibSgfcPlusPlus::SgfcArgumentType) fromSgfcKitArgumentType:(SGFCArgumentType)argumentType;

/// @brief Maps a value from the SgfcKit enumeration SGFCColor to
/// the corresponding value from the libsgfc++ enumeration
/// SgfcColor.
///
/// This is a convenience function that looks up @a color in
/// #colorToSgfcKitMap.
///
/// @exception NSInternalInconsistencyException Is raised if there is no
/// mapping, i.e. if @a color does not appear in
/// #colorToSgfcKitMap. In practice this should never occur. If it
/// occurs it indicates a programming error in the library, i.e. an
/// LibSgfcPlusPlus::SgfcColor value was not added to
/// #colorToSgfcKitMap.
+ (SGFCColor) toSgfcKitColor:(LibSgfcPlusPlus::SgfcColor)color;

/// @brief Maps a value from the libsgfc++ enumeration SgfcColor to
/// the corresponding value from the the SgfcKit enumeration
/// SGFCColor.
///
/// This is a convenience function that looks up @a color in
/// #colorFromSgfcKitMap.
///
/// @exception NSInternalInconsistencyException Is raised if there is no
/// mapping, i.e. if @a color does not appear in
/// #colorFromSgfcKitMap. In practice this should never occur. If it
/// occurs it indicates a programming error in the library, i.e. an
/// SGFCColor value was not added to
/// #colorFromSgfcKitMap.
+ (LibSgfcPlusPlus::SgfcColor) fromSgfcKitColor:(SGFCColor)color;

/// @brief Maps a value from the SgfcKit enumeration SGFCCoordinateSystem to
/// the corresponding value from the libsgfc++ enumeration
/// SgfcCoordinateSystem.
///
/// This is a convenience function that looks up @a coordinateSystem in
/// #coordinateSystemToSgfcKitMap.
///
/// @exception NSInternalInconsistencyException Is raised if there is no
/// mapping, i.e. if @a coordinateSystem does not appear in
/// #coordinateSystemToSgfcKitMap. In practice this should never occur. If it
/// occurs it indicates a programming error in the library, i.e. an
/// LibSgfcPlusPlus::SgfcCoordinateSystem value was not added to
/// #coordinateSystemToSgfcKitMap.
+ (SGFCCoordinateSystem) toSgfcKitCoordinateSystem:(LibSgfcPlusPlus::SgfcCoordinateSystem)coordinateSystem;

/// @brief Maps a value from the libsgfc++ enumeration SgfcCoordinateSystem to
/// the corresponding value from the the SgfcKit enumeration
/// SGFCCoordinateSystem.
///
/// This is a convenience function that looks up @a coordinateSystem in
/// #coordinateSystemFromSgfcKitMap.
///
/// @exception NSInternalInconsistencyException Is raised if there is no
/// mapping, i.e. if @a coordinateSystem does not appear in
/// #coordinateSystemFromSgfcKitMap. In practice this should never occur. If it
/// occurs it indicates a programming error in the library, i.e. an
/// SGFCCoordinateSystem value was not added to
/// #coordinateSystemFromSgfcKitMap.
+ (LibSgfcPlusPlus::SgfcCoordinateSystem) fromSgfcKitCoordinateSystem:(SGFCCoordinateSystem)coordinateSystem;

/// @brief Maps a value from the SgfcKit enumeration SGFCDouble to
/// the corresponding value from the libsgfc++ enumeration
/// SgfcDouble.
///
/// This is a convenience function that looks up @a doubleValue in
/// #doubleToSgfcKitMap.
///
/// @exception NSInternalInconsistencyException Is raised if there is no
/// mapping, i.e. if @a doubleValue does not appear in
/// #doubleToSgfcKitMap. In practice this should never occur. If it
/// occurs it indicates a programming error in the library, i.e. an
/// LibSgfcPlusPlus::SgfcDouble value was  not added to
/// #doubleToSgfcKitMap.
+ (SGFCDouble) toSgfcKitDouble:(LibSgfcPlusPlus::SgfcDouble)doubleValue;

/// @brief Maps a value from the libsgfc++ enumeration SgfcDouble to
/// the corresponding value from the the SgfcKit enumeration
/// SGFCDouble.
///
/// This is a convenience function that looks up @a doubleValue in
/// #doubleFromSgfcKitMap.
///
/// @exception NSInternalInconsistencyException Is raised if there is no
/// mapping, i.e. if @a doubleValue does not appear in
/// #doubleFromSgfcKitMap. In practice this should never occur. If it
/// occurs it indicates a programming error in the library, i.e. an
/// SGFCDouble value was not added to
/// #doubleFromSgfcKitMap.
+ (LibSgfcPlusPlus::SgfcDouble) fromSgfcKitDouble:(SGFCDouble)doubleValue;

/// @brief Maps a value from the SgfcKit enumeration SGFCGameType to the
/// corresponding value from the libsgfc++ enumeration SgfcGameType.
///
/// This is a convenience function that looks up @a gameType in
/// #gameTypeToSgfcKitMap.
///
/// @exception NSInternalInconsistencyException Is raised if there is no
/// mapping, i.e. if @a gameType does not appear in
/// #gameTypeToSgfcKitMap. In practice this should never occur. If it
/// occurs it indicates a programming error in the library, i.e. an
/// LibSgfcPlusPlus::SgfcGameType value was not added to
/// #gameTypeToSgfcKitMap.
+ (SGFCGameType) toSgfcKitGameType:(LibSgfcPlusPlus::SgfcGameType)gameType;

/// @brief Maps a value from the libsgfc++ enumeration SgfcGameType to the
/// corresponding value from the the SgfcKit enumeration SGFCGameType.
///
/// This is a convenience function that looks up @a gameType in
/// #gameTypeFromSgfcKitMap.
///
/// @exception NSInternalInconsistencyException Is raised if there is no
/// mapping, i.e. if @a gameType does not appear in
/// #gameTypeFromSgfcKitMap. In practice this should never occur. If it
/// occurs it indicates a programming error in the library, i.e. an
/// SGFCGameType value was not added to
/// #gameTypeFromSgfcKitMap.
+ (LibSgfcPlusPlus::SgfcGameType) fromSgfcKitGameType:(SGFCGameType)gameType;

/// @brief Maps a value from the SgfcKit enumeration SGFCGoPointNotation to
/// the corresponding value from the libsgfc++ enumeration
/// SgfcGoPointNotation.
///
/// This is a convenience function that looks up @a goPointNotation in
/// #goPointNotationToSgfcKitMap.
///
/// @exception NSInternalInconsistencyException Is raised if there is no
/// mapping, i.e. if @a goPointNotation does not appear in
/// #goPointNotationToSgfcKitMap. In practice this should never occur. If it
/// occurs it indicates a programming error in the library, i.e. an
/// LibSgfcPlusPlus::SgfcGoPointNotation value was not added to
/// #goPointNotationToSgfcKitMap.
+ (SGFCGoPointNotation) toSgfcKitGoPointNotation:(LibSgfcPlusPlus::SgfcGoPointNotation)goPointNotation;

/// @brief Maps a value from the libsgfc++ enumeration SgfcGoPointNotation to
/// the corresponding value from the the SgfcKit enumeration
/// SGFCGoPointNotation.
///
/// This is a convenience function that looks up @a goPointNotation in
/// #goPointNotationFromSgfcKitMap.
///
/// @exception NSInternalInconsistencyException Is raised if there is no
/// mapping, i.e. if @a goPointNotation does not appear in
/// #goPointNotationFromSgfcKitMap. In practice this should never occur. If it
/// occurs it indicates a programming error in the library, i.e. an
/// SGFCGoPointNotation value was not added to
/// #goPointNotationFromSgfcKitMap.
+ (LibSgfcPlusPlus::SgfcGoPointNotation) fromSgfcKitGoPointNotation:(SGFCGoPointNotation)goPointNotation;

/// @brief Maps a value from the SgfcKit enumeration SGFCPropertyType to the
/// corresponding value from the libsgfc++ enumeration SgfcPropertyType.
///
/// This is a convenience function that looks up @a propertyType in
/// #propertyTypeToSgfcKitMap.
///
/// @exception NSInternalInconsistencyException Is raised if there is no
/// mapping, i.e. if @a propertyType does not appear in
/// #propertyTypeToSgfcKitMap. In practice this should never occur. If it
/// occurs it indicates a programming error in the library, i.e. an$
/// LibSgfcPlusPlus::SgfcPropertyType value was not added to
/// #propertyTypeToSgfcKitMap.
+ (SGFCPropertyType) toSgfcKitPropertyType:(LibSgfcPlusPlus::SgfcPropertyType)propertyType;

/// @brief Maps a value from the libsgfc++ enumeration SgfcPropertyType to the
/// corresponding value from the the SgfcKit enumeration SGFCPropertyType.
///
/// This is a convenience function that looks up @a propertyType in
/// #propertyTypeFromSgfcKitMap.
///
/// @exception NSInternalInconsistencyException Is raised if there is no
/// mapping, i.e. if @a propertyType does not appear in
/// #propertyTypeFromSgfcKitMap. In practice this should never occur. If it
/// occurs it indicates a programming error in the library, i.e. an
/// SGFCPropertyType value was not added to
/// #propertyTypeFromSgfcKitMap.
+ (LibSgfcPlusPlus::SgfcPropertyType) fromSgfcKitPropertyType:(SGFCPropertyType)propertyType;

/// @brief Maps a value from the SgfcKit enumeration SGFCPropertyValueType to
/// the corresponding value from the libsgfc++ enumeration
/// SgfcPropertyValueType.
///
/// This is a convenience function that looks up @a propertyValueType in
/// #propertyValueTypeToSgfcKitMap.
///
/// @exception NSInternalInconsistencyException Is raised if there is no
/// mapping, i.e. if @a propertyValueType does not appear in
/// #propertyValueTypeToSgfcKitMap. In practice this should never occur. If it
/// occurs it indicates a programming error in the library, i.e. an
/// LibSgfcPlusPlus::SgfcPropertyValueType value was not added to
/// #propertyValueTypeToSgfcKitMap.
+ (SGFCPropertyValueType) toSgfcKitPropertyValueType:(LibSgfcPlusPlus::SgfcPropertyValueType)propertyValueType;

/// @brief Maps a value from the libsgfc++ enumeration SgfcPropertyValueType to
/// the corresponding value from the the SgfcKit enumeration
/// SGFCPropertyValueType.
///
/// This is a convenience function that looks up @a propertyValueType in
/// #propertyValueTypeFromSgfcKitMap.
///
/// @exception NSInternalInconsistencyException Is raised if there is no
/// mapping, i.e. if @a propertyValueType does not appear in
/// #propertyValueTypeFromSgfcKitMap. In practice this should never occur. If it
/// occurs it indicates a programming error in the library, i.e. an
/// SGFCPropertyValueType value was not added to
/// #propertyValueTypeFromSgfcKitMap.
+ (LibSgfcPlusPlus::SgfcPropertyValueType) fromSgfcKitPropertyValueType:(SGFCPropertyValueType)propertyValueType;

/// @brief Maps an int value (used in libsgfc++) to an NSInteger value
/// (used in SgfcKit).
+ (NSInteger) toSgfcKitInteger:(int)intValue;

/// @brief Maps an NSInteger value (used in SgfcKit) to an int value
/// (used in libsgfc++).
///
/// @exception NSInternalInconsistencyException Is raised if @a intValue is
/// outside the range of the primitive C++ type @e int.
+ (int) fromSgfcKitInteger:(NSInteger)intValue;

/// @brief Maps an unsigned int value (used in libsgfc++) to an NSUInteger value
/// (used in SgfcKit).
+ (NSUInteger) toSgfcKitUInteger:(unsigned int)uintValue;

/// @brief Maps an NSUInteger value (used in SgfcKit) to an unsigned int value
/// (used in libsgfc++).
///
/// @exception NSInternalInconsistencyException Is raised if @a uintValue is
/// outside the range of the primitive C++ type @e unsigned int.
+ (unsigned int) fromSgfcKitUInteger:(NSUInteger)uintValue;

/// @brief Maps a bool value (used in libsgfc++) to a BOOL value
/// (used in SgfcKit).
+ (BOOL) toSgfcKitBoolean:(bool)boolValue;

/// @brief Maps a BOOL value (used in SgfcKit) to a bool value
/// (used in libsgfc++).
+ (bool) fromSgfcKitBoolean:(BOOL)boolValue;

/// @brief Maps an std::string value (used in libsgfc++) to an NSString value
/// (used in SgfcKit).
+ (NSString*) toSgfcKitString:(const std::string&)stringValue;

/// @brief Maps an NSString value (used in SgfcKit) to an std::string value
/// (used in libsgfc++).
+ (std::string) fromSgfcKitString:(NSString*)stringValue;

/// @brief Maps an SgfcNumber value (used in libsgfc++) to an SGFCNumber value
/// (used in SgfcKit).
+ (SGFCNumber) toSgfcKitNumber:(LibSgfcPlusPlus::SgfcNumber)numberValue;

/// @brief Maps an SGFCNumber value (used in SgfcKit) to an SgfcNumber value
/// (used in libsgfc++).
+ (LibSgfcPlusPlus::SgfcNumber) fromSgfcKitNumber:(SGFCNumber)numberValue;

/// @brief Maps an SgfcReal value (used in libsgfc++) to an SGFCReal value
/// (used in SgfcKit).
+ (SGFCReal) toSgfcKitReal:(LibSgfcPlusPlus::SgfcReal)realValue;

/// @brief Maps an SGFCReal value (used in SgfcKit) to an SgfcReal value
/// (used in libsgfc++).
+ (LibSgfcPlusPlus::SgfcReal) fromSgfcKitReal:(SGFCReal)realValue;

/// @brief Maps an SgfcBoardSize value (used in libsgfc++) to an SGFCBoardSize
/// value (used in SgfcKit).
+ (SGFCBoardSize) toSgfcKitBoardSize:(LibSgfcPlusPlus::SgfcBoardSize)boardSizeValue;

/// @brief Maps an SGFCBoardSize value (used in SgfcKit) to an SgfcBoardSize
/// value (used in libsgfc++).
+ (LibSgfcPlusPlus::SgfcBoardSize) fromSgfcKitBoardSize:(SGFCBoardSize)boardSizeValue;

@end
