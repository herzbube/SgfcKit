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
#import "SGFCExceptionUtility.h"
#import "SGFCMappingUtility.h"
#import "SGFCPrivateConstants.h"

// C++ Standard Library includes
#include <limits>

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
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithFormat:@"NSInteger value cannot be mapped to int: %@"
                                              objectArgumentValue:@(intValue)];

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

+ (NSString*) toSgfcKitString:(std::string)stringValue
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

+ (SGFCNumber) toSgfcKitNumber:(LibSgfcPlusPlus::SgfcNumber)numberValue
{
  // The typedefs in libsgfc++ and SgfcKit have the same underlying type
  return static_cast<SGFCNumber>(numberValue);
}

+ (LibSgfcPlusPlus::SgfcNumber) fromSgfcKitNumber:(SGFCNumber)numberValue
{
  // The typedefs in libsgfc++ and SgfcKit have the same underlying type
  return static_cast<LibSgfcPlusPlus::SgfcNumber>(numberValue);
}

+ (SGFCReal) toSgfcKitReal:(LibSgfcPlusPlus::SgfcReal)realValue
{
  // The typedefs in libsgfc++ and SgfcKit have the same underlying type
  return static_cast<SGFCReal>(realValue);
}

+ (LibSgfcPlusPlus::SgfcReal) fromSgfcKitReal:(SGFCReal)realValue
{
  // The typedefs in libsgfc++ and SgfcKit have the same underlying type
  return static_cast<LibSgfcPlusPlus::SgfcReal>(realValue);
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
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:reason];

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
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:reason];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return 0;
  }
}

@end
