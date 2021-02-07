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

// Project includes
#import "../include/NSValue+SGFCDate.h"
#import "SGFCExceptionUtility.h"
#import "SGFCMappingUtility.h"
#import "SGFCPrivateConstants.h"

// C++ Standard Library includes
#import <limits>

// System includes
#import <Foundation/NSString.h>
#import <Foundation/NSValue.h>

@implementation SGFCMappingUtility

#pragma mark - Public API

+ (SGFCArgumentType) toSgfcKitArgumentType:(LibSgfcPlusPlus::SgfcArgumentType)argumentType
{
  NSUInteger mappedValue = [SGFCMappingUtility toSgfcKitValue:static_cast<int>(argumentType)
                                                     usingMap:argumentTypeToSgfcKitMap
                                                 withEnumName:@"SgfcArgumentType"];
  return static_cast<SGFCArgumentType>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcArgumentType) fromSgfcKitArgumentType:(SGFCArgumentType)argumentType
{
  int mappedValue = [SGFCMappingUtility fromSgfcKitValue:argumentType
                                                usingMap:argumentTypeFromSgfcKitMap
                                            withEnumName:@"SGFCArgumentType"];
  return static_cast<LibSgfcPlusPlus::SgfcArgumentType>(mappedValue);
}

+ (SGFCColor) toSgfcKitColor:(LibSgfcPlusPlus::SgfcColor)color
{
  NSUInteger mappedValue = [SGFCMappingUtility toSgfcKitValue:static_cast<int>(color)
                                                     usingMap:colorToSgfcKitMap
                                                 withEnumName:@"SgfcColor"];
  return static_cast<SGFCColor>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcColor) fromSgfcKitColor:(SGFCColor)color
{
  int mappedValue = [SGFCMappingUtility fromSgfcKitValue:color
                                                usingMap:colorFromSgfcKitMap
                                            withEnumName:@"SGFCColor"];
  return static_cast<LibSgfcPlusPlus::SgfcColor>(mappedValue);
}

+ (SGFCCoordinateSystem) toSgfcKitCoordinateSystem:(LibSgfcPlusPlus::SgfcCoordinateSystem)coordinateSystem
{
  NSUInteger mappedValue = [SGFCMappingUtility toSgfcKitValue:static_cast<int>(coordinateSystem)
                                                     usingMap:coordinateSystemToSgfcKitMap
                                                 withEnumName:@"SgfcCoordinateSystem"];
  return static_cast<SGFCCoordinateSystem>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcCoordinateSystem) fromSgfcKitCoordinateSystem:(SGFCCoordinateSystem)coordinateSystem
{
  int mappedValue = [SGFCMappingUtility fromSgfcKitValue:coordinateSystem
                                                usingMap:coordinateSystemFromSgfcKitMap
                                            withEnumName:@"SGFCCoordinateSystem"];
  return static_cast<LibSgfcPlusPlus::SgfcCoordinateSystem>(mappedValue);
}

+ (SGFCDouble) toSgfcKitDouble:(LibSgfcPlusPlus::SgfcDouble)doubleValue
{
  NSUInteger mappedValue = [SGFCMappingUtility toSgfcKitValue:static_cast<int>(doubleValue)
                                                     usingMap:doubleToSgfcKitMap
                                                 withEnumName:@"SgfcDouble"];
  return static_cast<SGFCDouble>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcDouble) fromSgfcKitDouble:(SGFCDouble)doubleValue
{
  int mappedValue = [SGFCMappingUtility fromSgfcKitValue:doubleValue
                                                usingMap:doubleFromSgfcKitMap
                                            withEnumName:@"SGFCDouble"];
  return static_cast<LibSgfcPlusPlus::SgfcDouble>(mappedValue);
}

+ (SGFCExitCode) toSgfcKitExitCode:(LibSgfcPlusPlus::SgfcExitCode)exitCode
{
  NSUInteger mappedValue = [SGFCMappingUtility toSgfcKitValue:static_cast<int>(exitCode)
                                                     usingMap:exitCodeToSgfcKitMap
                                                 withEnumName:@"SgfcExitCode"];
  return static_cast<SGFCExitCode>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcExitCode) fromSgfcKitExitCode:(SGFCExitCode)exitCode
{
  int mappedValue = [SGFCMappingUtility fromSgfcKitValue:exitCode
                                                usingMap:exitCodeFromSgfcKitMap
                                            withEnumName:@"SGFCExitCode"];
  return static_cast<LibSgfcPlusPlus::SgfcExitCode>(mappedValue);
}

+ (SGFCGameResultType) toSgfcKitGameResultType:(LibSgfcPlusPlus::SgfcGameResultType)gameResultType
{
  NSUInteger mappedValue = [SGFCMappingUtility toSgfcKitValue:static_cast<int>(gameResultType)
                                                     usingMap:gameResultTypeToSgfcKitMap
                                                 withEnumName:@"SgfcGameResultType"];
  return static_cast<SGFCGameResultType>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcGameResultType) fromSgfcKitGameResultType:(SGFCGameResultType)gameResultType
{
  int mappedValue = [SGFCMappingUtility fromSgfcKitValue:gameResultType
                                                usingMap:gameResultTypeFromSgfcKitMap
                                            withEnumName:@"SGFCGameResultType"];
  return static_cast<LibSgfcPlusPlus::SgfcGameResultType>(mappedValue);
}

+ (SGFCGameType) toSgfcKitGameType:(LibSgfcPlusPlus::SgfcGameType)gameType
{
  NSUInteger mappedValue = [SGFCMappingUtility toSgfcKitValue:static_cast<int>(gameType)
                                                     usingMap:gameTypeToSgfcKitMap
                                                 withEnumName:@"SgfcGameType"];
  return static_cast<SGFCGameType>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcGameType) fromSgfcKitGameType:(SGFCGameType)gameType
{
  int mappedValue = [SGFCMappingUtility fromSgfcKitValue:gameType
                                                usingMap:gameTypeFromSgfcKitMap
                                            withEnumName:@"SGFCGameType"];
  return static_cast<LibSgfcPlusPlus::SgfcGameType>(mappedValue);
}

+ (SGFCGoPlayerRankType) toSgfcKitGoPlayerRankType:(LibSgfcPlusPlus::SgfcGoPlayerRankType)goPlayerRankType
{
  NSUInteger mappedValue = [SGFCMappingUtility toSgfcKitValue:static_cast<int>(goPlayerRankType)
                                                     usingMap:goPlayerRankTypeToSgfcKitMap
                                                 withEnumName:@"SgfcGoPlayerRankType"];
  return static_cast<SGFCGoPlayerRankType>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcGoPlayerRankType) fromSgfcKitGoPlayerRankType:(SGFCGoPlayerRankType)goPlayerRankType
{
  int mappedValue = [SGFCMappingUtility fromSgfcKitValue:goPlayerRankType
                                                usingMap:goPlayerRankTypeFromSgfcKitMap
                                            withEnumName:@"SGFCGoPlayerRankType"];
  return static_cast<LibSgfcPlusPlus::SgfcGoPlayerRankType>(mappedValue);
}

+ (SGFCGoPlayerRatingType) toSgfcKitGoPlayerRatingType:(LibSgfcPlusPlus::SgfcGoPlayerRatingType)goPlayerRatingType
{
  NSUInteger mappedValue = [SGFCMappingUtility toSgfcKitValue:static_cast<int>(goPlayerRatingType)
                                                     usingMap:goPlayerRatingTypeToSgfcKitMap
                                                 withEnumName:@"SgfcGoPlayerRatingType"];
  return static_cast<SGFCGoPlayerRatingType>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcGoPlayerRatingType) fromSgfcKitGoPlayerRatingType:(SGFCGoPlayerRatingType)goPlayerRatingType
{
  int mappedValue = [SGFCMappingUtility fromSgfcKitValue:goPlayerRatingType
                                                usingMap:goPlayerRatingTypeFromSgfcKitMap
                                            withEnumName:@"SGFCGoPlayerRatingType"];
  return static_cast<LibSgfcPlusPlus::SgfcGoPlayerRatingType>(mappedValue);
}

+ (SGFCGoPointNotation) toSgfcKitGoPointNotation:(LibSgfcPlusPlus::SgfcGoPointNotation)goPointNotation
{
  NSUInteger mappedValue = [SGFCMappingUtility toSgfcKitValue:static_cast<int>(goPointNotation)
                                                     usingMap:goPointNotationToSgfcKitMap
                                                 withEnumName:@"SgfcGoPointNotation"];
  return static_cast<SGFCGoPointNotation>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcGoPointNotation) fromSgfcKitGoPointNotation:(SGFCGoPointNotation)goPointNotation
{
  int mappedValue = [SGFCMappingUtility fromSgfcKitValue:goPointNotation
                                                usingMap:goPointNotationFromSgfcKitMap
                                            withEnumName:@"SGFCGoPointNotation"];
  return static_cast<LibSgfcPlusPlus::SgfcGoPointNotation>(mappedValue);
}

+ (SGFCGoRulesetType) toSgfcKitGoRulesetType:(LibSgfcPlusPlus::SgfcGoRulesetType)goRulesetType
{
  NSUInteger mappedValue = [SGFCMappingUtility toSgfcKitValue:static_cast<int>(goRulesetType)
                                                     usingMap:goRulesetTypeToSgfcKitMap
                                                 withEnumName:@"SgfcGoRulesetType"];
  return static_cast<SGFCGoRulesetType>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcGoRulesetType) fromSgfcKitGoRulesetType:(SGFCGoRulesetType)goRulesetType
{
  int mappedValue = [SGFCMappingUtility fromSgfcKitValue:goRulesetType
                                                usingMap:goRulesetTypeFromSgfcKitMap
                                            withEnumName:@"SGFCGoRulesetType"];
  return static_cast<LibSgfcPlusPlus::SgfcGoRulesetType>(mappedValue);
}

+ (SGFCMessageID) toSgfcKitMessageID:(LibSgfcPlusPlus::SgfcMessageID)messageID
{
  NSInteger mappedValue = [SGFCMappingUtility toSgfcKitSignedValue:static_cast<int>(messageID)
                                                          usingMap:messageIDToSgfcKitMap
                                                      withEnumName:@"SgfcMessageID"];
  return static_cast<SGFCMessageID>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcMessageID) fromSgfcKitMessageID:(SGFCMessageID)messageID
{
  int mappedValue = [SGFCMappingUtility fromSgfcKitSignedValue:messageID
                                                      usingMap:messageIDFromSgfcKitMap
                                                  withEnumName:@"SGFCMessageID"];
  return static_cast<LibSgfcPlusPlus::SgfcMessageID>(mappedValue);
}

+ (SGFCMessageType) toSgfcKitMessageType:(LibSgfcPlusPlus::SgfcMessageType)messageType
{
  NSUInteger mappedValue = [SGFCMappingUtility toSgfcKitValue:static_cast<int>(messageType)
                                                     usingMap:messageTypeToSgfcKitMap
                                                 withEnumName:@"SgfcMessageType"];
  return static_cast<SGFCMessageType>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcMessageType) fromSgfcKitMessageType:(SGFCMessageType)messageType
{
  int mappedValue = [SGFCMappingUtility fromSgfcKitValue:messageType
                                                usingMap:messageTypeFromSgfcKitMap
                                            withEnumName:@"SGFCMessageType"];
  return static_cast<LibSgfcPlusPlus::SgfcMessageType>(mappedValue);
}

+ (SGFCNodeTrait) toSgfcKitNodeTrait:(LibSgfcPlusPlus::SgfcNodeTrait)nodeTrait
{
  unsigned long long mappedValue = [SGFCMappingUtility toSgfcKitUnsignedLongLongValue:static_cast<unsigned long long>(nodeTrait)
                                                                             usingMap:nodeTraitToSgfcKitMap
                                                                         withEnumName:@"SgfcNodeTrait"];
  return static_cast<SGFCNodeTrait>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcNodeTrait) fromSgfcKitNodeTrait:(SGFCNodeTrait)nodeTrait
{
  unsigned long long mappedValue = [SGFCMappingUtility fromSgfcKitUnsignedLongLongValue:nodeTrait
                                                                               usingMap:nodeTraitFromSgfcKitMap
                                                                           withEnumName:@"SGFCNodeTrait"];
  return static_cast<LibSgfcPlusPlus::SgfcNodeTrait>(mappedValue);
}

+ (SGFCPropertyCategory) toSgfcKitPropertyCategory:(LibSgfcPlusPlus::SgfcPropertyCategory)propertyCategory
{
  NSUInteger mappedValue = [SGFCMappingUtility toSgfcKitValue:static_cast<int>(propertyCategory)
                                                     usingMap:propertyCategoryToSgfcKitMap
                                                 withEnumName:@"SgfcPropertyCategory"];
  return static_cast<SGFCPropertyCategory>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcPropertyCategory) fromSgfcKitPropertyCategory:(SGFCPropertyCategory)propertyCategory
{
  int mappedValue = [SGFCMappingUtility fromSgfcKitValue:propertyCategory
                                                usingMap:propertyCategoryFromSgfcKitMap
                                            withEnumName:@"SGFCPropertyCategory"];
  return static_cast<LibSgfcPlusPlus::SgfcPropertyCategory>(mappedValue);
}

+ (SGFCPropertyTrait) toSgfcKitPropertyTrait:(LibSgfcPlusPlus::SgfcPropertyTrait)propertyTrait
{
  unsigned long long mappedValue = [SGFCMappingUtility toSgfcKitUnsignedLongLongValue:static_cast<unsigned long long>(propertyTrait)
                                                                             usingMap:propertyTraitToSgfcKitMap
                                                                         withEnumName:@"SgfcPropertyTrait"];
  return static_cast<SGFCPropertyTrait>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcPropertyTrait) fromSgfcKitPropertyTrait:(SGFCPropertyTrait)propertyTrait
{
  unsigned long long mappedValue = [SGFCMappingUtility fromSgfcKitUnsignedLongLongValue:propertyTrait
                                                                               usingMap:propertyTraitFromSgfcKitMap
                                                                           withEnumName:@"SGFCPropertyTrait"];
  return static_cast<LibSgfcPlusPlus::SgfcPropertyTrait>(mappedValue);
}

+ (SGFCPropertyType) toSgfcKitPropertyType:(LibSgfcPlusPlus::SgfcPropertyType)propertyType
{
  NSUInteger mappedValue = [SGFCMappingUtility toSgfcKitValue:static_cast<int>(propertyType)
                                                     usingMap:propertyTypeToSgfcKitMap
                                                 withEnumName:@"SgfcPropertyType"];
  return static_cast<SGFCPropertyType>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcPropertyType) fromSgfcKitPropertyType:(SGFCPropertyType)propertyType
{
  int mappedValue = [SGFCMappingUtility fromSgfcKitValue:propertyType
                                                usingMap:propertyTypeFromSgfcKitMap
                                            withEnumName:@"SGFCPropertyType"];
  return static_cast<LibSgfcPlusPlus::SgfcPropertyType>(mappedValue);
}

+ (SGFCPropertyValueType) toSgfcKitPropertyValueType:(LibSgfcPlusPlus::SgfcPropertyValueType)propertyValueType
{
  NSUInteger mappedValue = [SGFCMappingUtility toSgfcKitValue:static_cast<int>(propertyValueType)
                                                     usingMap:propertyValueTypeToSgfcKitMap
                                                 withEnumName:@"SgfcPropertyValueType"];
  return static_cast<SGFCPropertyValueType>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcPropertyValueType) fromSgfcKitPropertyValueType:(SGFCPropertyValueType)propertyValueType
{
  int mappedValue = [SGFCMappingUtility fromSgfcKitValue:propertyValueType
                                                usingMap:propertyValueTypeFromSgfcKitMap
                                            withEnumName:@"SGFCPropertyValueType"];
  return static_cast<LibSgfcPlusPlus::SgfcPropertyValueType>(mappedValue);
}

+ (SGFCWinType) toSgfcKitWinType:(LibSgfcPlusPlus::SgfcWinType)winType
{
  NSUInteger mappedValue = [SGFCMappingUtility toSgfcKitValue:static_cast<int>(winType)
                                                     usingMap:winTypeToSgfcKitMap
                                                 withEnumName:@"SgfcWinType"];
  return static_cast<SGFCWinType>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcWinType) fromSgfcKitWinType:(SGFCWinType)winType
{
  int mappedValue = [SGFCMappingUtility fromSgfcKitValue:winType
                                                usingMap:winTypeFromSgfcKitMap
                                            withEnumName:@"SGFCWinType"];
  return static_cast<LibSgfcPlusPlus::SgfcWinType>(mappedValue);
}

+ (NSInteger) toSgfcKitInteger:(int)intValue
{
  // NSInteger is either an int (32-bit systems) or a long (64-bit systems), so
  // NSInteger can always hold an int value.
  return intValue;
}

+ (int) fromSgfcKitInteger:(NSInteger)intValue
{
  if (intValue >= std::numeric_limits<int>::min() &&
      intValue <= std::numeric_limits<int>::max())
  {
    return static_cast<int>(intValue);
  }
  else
  {
    NSString* reason = [NSString stringWithFormat:@"NSInteger value cannot be mapped to int: %@", @(intValue)];
    [SGFCExceptionUtility raiseInternalInconsistencyExceptionWithReason:reason];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return 0;
  }
}

+ (NSUInteger) toSgfcKitUInteger:(unsigned int)uintValue
{
  // NSUInteger is either an int (32-bit systems) or a long (64-bit systems), so
  // NSUInteger can always hold an unsigned int value.
  return uintValue;
}

+ (unsigned int) fromSgfcKitUInteger:(NSUInteger)uintValue
{
  if (uintValue >= std::numeric_limits<unsigned int>::min() &&
      uintValue <= std::numeric_limits<unsigned int>::max())
  {
    return static_cast<unsigned int>(uintValue);
  }
  else
  {
    NSString* reason = [NSString stringWithFormat:@"NSUInteger value cannot be mapped to unsigned int: %@", @(uintValue)];
    [SGFCExceptionUtility raiseInternalInconsistencyExceptionWithReason:reason];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return 0;
  }
}

+ (BOOL) toSgfcKitBoolean:(bool)boolValue
{
  return boolValue ? YES : NO;
}

+ (bool) fromSgfcKitBoolean:(BOOL)boolValue
{
  return (boolValue == NO) ? false : true;
}

+ (NSString*) toSgfcKitString:(const std::string&)stringValue
{
  // TODO Currently we have no guarantee from libsgfc++ about the encoding in
  // use, so we just assume UTF-8. Maybe we will have to do something here in
  // the future once libsgfc++ provides us with more information.
  return [NSString stringWithUTF8String:stringValue.c_str()];
}

+ (std::string) fromSgfcKitString:(NSString*)stringValue
{
  // TODO Currently we have no guarantee from libsgfc++ about the encoding in
  // use, so we just assume UTF-8. Maybe we will have to do something here in
  // the future once libsgfc++ provides us with more information.
  return [stringValue UTF8String];
}

+ (NSString*) toSgfcKitSimpleText:(const LibSgfcPlusPlus::SgfcSimpleText&)simpleTextValue
{
  return [NSString stringWithUTF8String:simpleTextValue.c_str()];
}

+ (LibSgfcPlusPlus::SgfcSimpleText) fromSgfcKitSimpleText:(NSString*)simpleTextValue
{
  return [simpleTextValue UTF8String];
}

+ (NSString*) toSgfcKitText:(const LibSgfcPlusPlus::SgfcText&)textValue
{
  return [NSString stringWithUTF8String:textValue.c_str()];
}

+ (LibSgfcPlusPlus::SgfcText) fromSgfcKitText:(NSString*)textValue
{
  return [textValue UTF8String];
}

+ (NSString*) toSgfcKitMove:(const LibSgfcPlusPlus::SgfcMove&)moveValue
{
  return [NSString stringWithUTF8String:moveValue.c_str()];
}

+ (LibSgfcPlusPlus::SgfcMove) fromSgfcKitMove:(NSString*)moveValue
{
  return [moveValue UTF8String];
}

+ (NSString*) toSgfcKitPoint:(const LibSgfcPlusPlus::SgfcPoint&)pointValue
{
  return [NSString stringWithUTF8String:pointValue.c_str()];
}

+ (LibSgfcPlusPlus::SgfcPoint) fromSgfcKitPoint:(NSString*)pointValue
{
  return [pointValue UTF8String];
}

+ (NSString*) toSgfcKitStone:(const LibSgfcPlusPlus::SgfcStone&)stoneValue
{
  return [NSString stringWithUTF8String:stoneValue.c_str()];
}

+ (LibSgfcPlusPlus::SgfcStone) fromSgfcKitStone:(NSString*)stoneValue
{
  return [stoneValue UTF8String];
}

+ (SGFCNumber) toSgfcKitNumber:(LibSgfcPlusPlus::SgfcNumber)numberValue
{
  static_assert(sizeof(SGFCNumber) >= sizeof(LibSgfcPlusPlus::SgfcNumber), "SGFCNumber is not big enough to hold all LibSgfcPlusPlus::SgfcNumber values");

  // No runtime checks necessary because of static_assert above
  return static_cast<SGFCNumber>(numberValue);
}

+ (LibSgfcPlusPlus::SgfcNumber) fromSgfcKitNumber:(SGFCNumber)numberValue
{
  static_assert(sizeof(LibSgfcPlusPlus::SgfcNumber) >= sizeof(SGFCNumber), "LibSgfcPlusPlus::SgfcNumber is not big enough to hold all SGFCNumber values");

  // No runtime checks necessary because of static_assert above
  return static_cast<LibSgfcPlusPlus::SgfcNumber>(numberValue);
}

+ (SGFCReal) toSgfcKitReal:(LibSgfcPlusPlus::SgfcReal)realValue
{
  static_assert(sizeof(SGFCReal) >= sizeof(LibSgfcPlusPlus::SgfcReal), "SGFCReal is not big enough to hold all LibSgfcPlusPlus::SgfcReal values");

  // No runtime checks necessary because of static_assert above
  return static_cast<SGFCReal>(realValue);
}

+ (LibSgfcPlusPlus::SgfcReal) fromSgfcKitReal:(SGFCReal)realValue
{
  static_assert(sizeof(LibSgfcPlusPlus::SgfcReal) >= sizeof(SGFCReal), "LibSgfcPlusPlus::SgfcReal is not big enough to hold all SGFCReal values");

  // No runtime checks necessary because of static_assert above
  return static_cast<LibSgfcPlusPlus::SgfcReal>(realValue);
}

+ (SGFCNodeTraits) toSgfcKitNodeTraits:(LibSgfcPlusPlus::SgfcNodeTraits)nodeTraits
{
  unsigned long long mappedValue = [SGFCMappingUtility mapFlagValue:static_cast<unsigned long long>(nodeTraits)
                                                           usingMap:nodeTraitToSgfcKitMap];
  return static_cast<SGFCNodeTraits>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcNodeTraits) fromSgfcKitNodeTraits:(SGFCNodeTraits)nodeTraits
{
  unsigned long long mappedValue = [SGFCMappingUtility mapFlagValue:static_cast<unsigned long long>(nodeTraits)
                                                           usingMap:nodeTraitFromSgfcKitMap];
  return static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(mappedValue);
}

+ (SGFCPropertyTraits) toSgfcKitPropertyTraits:(LibSgfcPlusPlus::SgfcPropertyTraits)propertyTraits
{
  unsigned long long mappedValue = [SGFCMappingUtility mapFlagValue:static_cast<unsigned long long>(propertyTraits)
                                                           usingMap:propertyTraitToSgfcKitMap];
  return static_cast<SGFCPropertyTraits>(mappedValue);
}

+ (LibSgfcPlusPlus::SgfcPropertyTraits) fromSgfcKitPropertyTraits:(SGFCPropertyTraits)propertyTraits
{
  unsigned long long mappedValue = [SGFCMappingUtility mapFlagValue:static_cast<unsigned long long>(propertyTraits)
                                                           usingMap:propertyTraitFromSgfcKitMap];
  return static_cast<LibSgfcPlusPlus::SgfcPropertyTraits>(mappedValue);
}

+ (NSArray*) toSgfcKitDates:(const std::vector<LibSgfcPlusPlus::SgfcDate>&)dates
{
  NSMutableArray* array = [NSMutableArray array];

  for (auto date : dates)
  {
    SGFCDate mappedDate = SGFCDateMake(
      [SGFCMappingUtility toSgfcKitNumber:date.Year],
      [SGFCMappingUtility toSgfcKitNumber:date.Month],
      [SGFCMappingUtility toSgfcKitNumber:date.Day]);
    [array addObject:[NSValue valueWithSGFCDate:mappedDate]];
  }

  return array;
}

+ (std::vector<LibSgfcPlusPlus::SgfcDate>) fromSgfcKitDates:(NSArray*)dates
{
  std::vector<LibSgfcPlusPlus::SgfcDate> mappedGameDates;

  for (NSValue* value in dates)
  {
    SGFCDate date = value.sgfcDateValue;
    mappedGameDates.push_back(
    {
      [SGFCMappingUtility fromSgfcKitNumber:date.Year],
      [SGFCMappingUtility fromSgfcKitNumber:date.Month],
      [SGFCMappingUtility fromSgfcKitNumber:date.Day],
    });
  }

  return mappedGameDates;
}

#pragma mark - Private API

+ (NSUInteger) toSgfcKitValue:(int)fromValueAsInt
                     usingMap:(NSDictionary*)map
                 withEnumName:(NSString*)enumName
{
  NSNumber* fromValueAsNumber = @(fromValueAsInt);
  NSNumber* mappedValueAsNumber = map[fromValueAsNumber];
  if (mappedValueAsNumber)
  {
    // All SgfcKit enumerations are typed as NSUInteger
    return [mappedValueAsNumber unsignedIntegerValue];
  }
  else
  {
    NSString* reason = [NSString stringWithFormat:@"LibSgfcPlusPlus::%@ value not mapped: %@", enumName, fromValueAsNumber];
    [SGFCExceptionUtility raiseInternalInconsistencyExceptionWithReason:reason];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return 0;
  }
}

+ (int) fromSgfcKitValue:(NSUInteger)fromValueAsUnsignedInteger
                usingMap:(NSDictionary*)map
            withEnumName:(NSString*)enumName
{
  NSNumber* fromValueAsNumber = @(fromValueAsUnsignedInteger);
  NSNumber* mappedValueAsNumber = map[fromValueAsNumber];
  if (mappedValueAsNumber)
  {
    // All libsgfc++ enumerations are treated as int
    return [mappedValueAsNumber intValue];
  }
  else
  {
    NSString* reason = [NSString stringWithFormat:@"%@ value not mapped: %@", enumName, fromValueAsNumber];
    [SGFCExceptionUtility raiseInternalInconsistencyExceptionWithReason:reason];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return 0;
  }
}

+ (NSInteger) toSgfcKitSignedValue:(int)fromValueAsInt
                          usingMap:(NSDictionary*)map
                      withEnumName:(NSString*)enumName
{
  NSNumber* fromValueAsNumber = @(fromValueAsInt);
  NSNumber* mappedValueAsNumber = map[fromValueAsNumber];
  if (mappedValueAsNumber)
  {
    return [mappedValueAsNumber integerValue];
  }
  else
  {
    NSString* reason = [NSString stringWithFormat:@"LibSgfcPlusPlus::%@ value not mapped: %@", enumName, fromValueAsNumber];
    [SGFCExceptionUtility raiseInternalInconsistencyExceptionWithReason:reason];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return 0;
  }
}

+ (int) fromSgfcKitSignedValue:(NSInteger)fromValueAsSignedInteger
                      usingMap:(NSDictionary*)map
                  withEnumName:(NSString*)enumName
{
  NSNumber* fromValueAsNumber = @(fromValueAsSignedInteger);
  NSNumber* mappedValueAsNumber = map[fromValueAsNumber];
  if (mappedValueAsNumber)
  {
    // All libsgfc++ enumerations are treated as int
    return [mappedValueAsNumber intValue];
  }
  else
  {
    NSString* reason = [NSString stringWithFormat:@"%@ value not mapped: %@", enumName, fromValueAsNumber];
    [SGFCExceptionUtility raiseInternalInconsistencyExceptionWithReason:reason];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return 0;
  }
}

+ (unsigned long long) toSgfcKitUnsignedLongLongValue:(unsigned long long)fromValueAsUnsignedLongLong
                                             usingMap:(NSDictionary*)map
                                         withEnumName:(NSString*)enumName
{
  NSNumber* fromValueAsNumber = @(fromValueAsUnsignedLongLong);
  NSNumber* mappedValueAsNumber = map[fromValueAsNumber];
  if (mappedValueAsNumber)
  {
    return [mappedValueAsNumber unsignedLongLongValue];
  }
  else
  {
    NSString* reason = [NSString stringWithFormat:@"LibSgfcPlusPlus::%@ value not mapped: %@", enumName, fromValueAsNumber];
    [SGFCExceptionUtility raiseInternalInconsistencyExceptionWithReason:reason];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return 0;
  }
}

+ (unsigned long long) fromSgfcKitUnsignedLongLongValue:(unsigned long long)fromValueAsUnsignedLongLong
                                               usingMap:(NSDictionary*)map
                                           withEnumName:(NSString*)enumName
{
  NSNumber* fromValueAsNumber = @(fromValueAsUnsignedLongLong);
  NSNumber* mappedValueAsNumber = map[fromValueAsNumber];
  if (mappedValueAsNumber)
  {
    // All flag-based libsgfc++ enumerations are treated as int
    return [mappedValueAsNumber unsignedLongLongValue];
  }
  else
  {
    NSString* reason = [NSString stringWithFormat:@"%@ value not mapped: %@", enumName, fromValueAsNumber];
    [SGFCExceptionUtility raiseInternalInconsistencyExceptionWithReason:reason];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return 0;
  }
}

// The same function can be used both
// - to map from a libsgfc++ value to an SgfcKit value, and
// - to map from an SgfcKit value to a libsgfc++ value
// Reason: In both libraries flags are typedef'ed to the underlying
// unsigned long long, so the input parameter and return value are the same
// for both mapping directions.
+ (unsigned long long) mapFlagValue:(unsigned long long)fromValueAsUnsignedLongLong
                           usingMap:(NSDictionary*)map
{
  __block unsigned long long toValueAsUnsignedLongLong = 0;
  if (fromValueAsUnsignedLongLong == 0)
    return toValueAsUnsignedLongLong;

  __block unsigned long long fromValueAsUnsignedLongLongModifieableCopy = fromValueAsUnsignedLongLong;

  [map enumerateKeysAndObjectsUsingBlock:^(NSNumber* keyAsNumber, NSNumber* mappedValueAsNumber, BOOL* stop)
  {
    unsigned long long keyValue = [keyAsNumber unsignedLongLongValue];
    if (fromValueAsUnsignedLongLongModifieableCopy & keyValue)
    {
      unsigned long long mappedValue = [mappedValueAsNumber unsignedLongLongValue];
      toValueAsUnsignedLongLong |= mappedValue;

      fromValueAsUnsignedLongLongModifieableCopy &= ~keyValue;
      if (fromValueAsUnsignedLongLongModifieableCopy == 0)
        *stop = YES;
    }
  }];

  return toValueAsUnsignedLongLong;
}

+ (SGFCBoardSize) toSgfcKitBoardSize:(LibSgfcPlusPlus::SgfcBoardSize)boardSizeValue
{
  SGFCBoardSize mappedBoardSize = SGFCBoardSizeMake(
    [SGFCMappingUtility toSgfcKitNumber:boardSizeValue.Columns],
    [SGFCMappingUtility toSgfcKitNumber:boardSizeValue.Rows]);
  return mappedBoardSize;
}

+ (LibSgfcPlusPlus::SgfcBoardSize) fromSgfcKitBoardSize:(SGFCBoardSize)boardSizeValue
{
  LibSgfcPlusPlus::SgfcBoardSize mappedBoardSize =
  {
    [SGFCMappingUtility fromSgfcKitNumber:boardSizeValue.Columns],
    [SGFCMappingUtility fromSgfcKitNumber:boardSizeValue.Rows]
  };
  return mappedBoardSize;
}

+ (SGFCGameResult) toSgfcKitGameResult:(LibSgfcPlusPlus::SgfcGameResult)gameResult
{
  return SGFCGameResultMake(
    [SGFCMappingUtility toSgfcKitGameResultType:gameResult.GameResultType],
    [SGFCMappingUtility toSgfcKitWinType:gameResult.WinType],
    [SGFCMappingUtility toSgfcKitReal:gameResult.Score],
    [SGFCMappingUtility toSgfcKitBoolean:gameResult.IsValid]);
}

+ (LibSgfcPlusPlus::SgfcGameResult) fromSgfcKitGameResult:(SGFCGameResult)gameResult
{
  return LibSgfcPlusPlus::SgfcGameResult
  {
    [SGFCMappingUtility fromSgfcKitGameResultType:gameResult.GameResultType],
    [SGFCMappingUtility fromSgfcKitWinType:gameResult.WinType],
    [SGFCMappingUtility fromSgfcKitReal:gameResult.Score],
    [SGFCMappingUtility fromSgfcKitBoolean:gameResult.IsValid],
  };
}

+ (SGFCRoundInformation) toSgfcKitRoundInformation:(LibSgfcPlusPlus::SgfcRoundInformation)roundInformation
{
  return SGFCRoundInformationMake(
    [SGFCMappingUtility toSgfcKitString:roundInformation.RoundNumber],
    [SGFCMappingUtility toSgfcKitString:roundInformation.RoundType],
    [SGFCMappingUtility toSgfcKitBoolean:roundInformation.IsValid]);
}

+ (LibSgfcPlusPlus::SgfcRoundInformation) fromSgfcKitRoundInformation:(SGFCRoundInformation)roundInformation
{
  return LibSgfcPlusPlus::SgfcRoundInformation
  {
    [SGFCMappingUtility fromSgfcKitString:roundInformation.RoundNumber],
    [SGFCMappingUtility fromSgfcKitString:roundInformation.RoundType],
    [SGFCMappingUtility fromSgfcKitBoolean:roundInformation.IsValid],
  };
}

+ (SGFCGoRuleset) toSgfcKitGoRuleset:(LibSgfcPlusPlus::SgfcGoRuleset)goRuleset
{
  return SGFCGoRulesetMake(
    [SGFCMappingUtility toSgfcKitGoRulesetType:goRuleset.GoRulesetType],
    [SGFCMappingUtility toSgfcKitBoolean:goRuleset.IsValid]);
}

+ (LibSgfcPlusPlus::SgfcGoRuleset) fromSgfcKitGoRuleset:(SGFCGoRuleset)goRuleset
{
  return LibSgfcPlusPlus::SgfcGoRuleset
  {
    [SGFCMappingUtility fromSgfcKitGoRulesetType:goRuleset.GoRulesetType],
    [SGFCMappingUtility fromSgfcKitBoolean:goRuleset.IsValid],
  };
}

+ (SGFCGoPlayerRank) toSgfcKitGoPlayerRank:(LibSgfcPlusPlus::SgfcGoPlayerRank)goPlayerRank
{
  return SGFCGoPlayerRankMake(
    [SGFCMappingUtility toSgfcKitNumber:goPlayerRank.Rank],
    [SGFCMappingUtility toSgfcKitGoPlayerRankType:goPlayerRank.RankType],
    [SGFCMappingUtility toSgfcKitGoPlayerRatingType:goPlayerRank.RatingType],
    [SGFCMappingUtility toSgfcKitBoolean:goPlayerRank.IsValid]);
}

+ (LibSgfcPlusPlus::SgfcGoPlayerRank) fromSgfcKitGoPlayerRank:(SGFCGoPlayerRank)goPlayerRank
{
  return LibSgfcPlusPlus::SgfcGoPlayerRank
  {
    [SGFCMappingUtility fromSgfcKitNumber:goPlayerRank.Rank],
    [SGFCMappingUtility fromSgfcKitGoPlayerRankType:goPlayerRank.RankType],
    [SGFCMappingUtility fromSgfcKitGoPlayerRatingType:goPlayerRank.RatingType],
    [SGFCMappingUtility fromSgfcKitBoolean:goPlayerRank.IsValid],
  };
}

@end
