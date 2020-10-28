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
  int argumentTypeAsInt = static_cast<int>(argumentType);
  NSNumber* key = @(argumentTypeAsInt);
  NSNumber* value = argumentTypeToSgfcKitMap[key];
  if (value)
  {
    return static_cast<SGFCArgumentType>([value unsignedIntValue]);
  }
  else
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithFormat:@"LibSgfcPlusPlus::SgfcArgumentType value not mapped: %@"
                                              objectArgumentValue:key];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return SGFCArgumentTypeBeginningOfSgfData;
  }
}

+ (LibSgfcPlusPlus::SgfcArgumentType) fromSgfcKitArgumentType:(SGFCArgumentType)argumentType
{
  int argumentTypeAsInt = static_cast<int>(argumentType);
  NSNumber* key = @(argumentTypeAsInt);
  NSNumber* value = argumentTypeFromSgfcKitMap[key];
  if (value)
  {
    return static_cast<LibSgfcPlusPlus::SgfcArgumentType>([value intValue]);
  }
  else
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithFormat:@"SGFCArgumentType value not mapped: %@"
                                              objectArgumentValue:key];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return LibSgfcPlusPlus::SgfcArgumentType::BeginningOfSgfData;
  }
}

+ (SGFCGameType) toSgfcKitGameType:(LibSgfcPlusPlus::SgfcGameType)gameType
{
  int gameTypeAsInt = static_cast<int>(gameType);
  NSNumber* key = @(gameTypeAsInt);
  NSNumber* value = gameTypeToSgfcKitMap[key];
  if (value)
  {
    return static_cast<SGFCGameType>([value unsignedIntValue]);
  }
  else
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithFormat:@"LibSgfcPlusPlus::SgfcGameType value not mapped: %@"
                                              objectArgumentValue:key];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return SGFCGameTypeUnknown;
  }
}

+ (LibSgfcPlusPlus::SgfcGameType) fromSgfcKitGameType:(SGFCGameType)gameType
{
  int gameTypeAsInt = static_cast<int>(gameType);
  NSNumber* key = @(gameTypeAsInt);
  NSNumber* value = gameTypeFromSgfcKitMap[key];
  if (value)
  {
    return static_cast<LibSgfcPlusPlus::SgfcGameType>([value intValue]);
  }
  else
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithFormat:@"SGFCGameType value not mapped: %@"
                                              objectArgumentValue:key];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return LibSgfcPlusPlus::SgfcGameType::Unknown;
  }
}

+ (SGFCPropertyType) toSgfcKitPropertyType:(LibSgfcPlusPlus::SgfcPropertyType)propertyType
{
  int propertyTypeAsInt = static_cast<int>(propertyType);
  NSNumber* key = @(propertyTypeAsInt);
  NSNumber* value = propertyTypeToSgfcKitMap[key];
  if (value)
  {
    return static_cast<SGFCPropertyType>([value unsignedIntValue]);
  }
  else
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithFormat:@"LibSgfcPlusPlus::SgfcPropertyType value not mapped: %@"
                                              objectArgumentValue:key];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return SGFCPropertyTypeUnknown;
  }
}

+ (LibSgfcPlusPlus::SgfcPropertyType) fromSgfcKitPropertyType:(SGFCPropertyType)propertyType
{
  int propertyTypeAsInt = static_cast<int>(propertyType);
  NSNumber* key = @(propertyTypeAsInt);
  NSNumber* value = propertyTypeFromSgfcKitMap[key];
  if (value)
  {
    return static_cast<LibSgfcPlusPlus::SgfcPropertyType>([value intValue]);
  }
  else
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithFormat:@"SGFCPropertyType value not mapped: %@"
                                              objectArgumentValue:key];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return LibSgfcPlusPlus::SgfcPropertyType::Unknown;
  }
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

@end
