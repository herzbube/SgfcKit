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
#import "../../include/SGFCColorPropertyValue.h"
#import "../../include/SGFCComposedPropertyValue.h"
#import "../../include/SGFCDoublePropertyValue.h"
#import "../../include/SGFCGoMovePropertyValue.h"
#import "../../include/SGFCGoPointPropertyValue.h"
#import "../../include/SGFCGoStonePropertyValue.h"
#import "../../include/SGFCMovePropertyValue.h"
#import "../../include/SGFCNumberPropertyValue.h"
#import "../../include/SGFCPointPropertyValue.h"
#import "../../include/SGFCPropertyValueFactory.h"
#import "../../include/SGFCRealPropertyValue.h"
#import "../../include/SGFCSimpleTextPropertyValue.h"
#import "../../include/SGFCStonePropertyValue.h"
#import "../../include/SGFCTextPropertyValue.h"
#import "../SGFCExceptionUtility.h"

@implementation SGFCPropertyValueFactory

#pragma mark - Public API

+ (SGFCNumberPropertyValue*) propertyValueWithNumber:(SGFCNumber)numberValue
{
  return [SGFCNumberPropertyValue numberPropertyValueWithNumberValue:numberValue];
}

+ (SGFCRealPropertyValue*) propertyValueWithReal:(SGFCReal)realValue
{
  return [SGFCRealPropertyValue realPropertyValueWithRealValue:realValue];
}

+ (SGFCDoublePropertyValue*) propertyValueWithDouble:(SGFCDouble)doubleValue
{
  return [SGFCDoublePropertyValue doublePropertyValueWithDoubleValue:doubleValue];
}

+ (SGFCColorPropertyValue*) propertyValueWithColor:(SGFCColor)colorValue
{
  return [SGFCColorPropertyValue colorPropertyValueWithColorValue:colorValue];
}

+ (SGFCSimpleTextPropertyValue*) propertyValueWithSimpleText:(NSString*)simpleTextValue
{
  return [SGFCSimpleTextPropertyValue simpleTextPropertyValueWithSimpleTextValue:simpleTextValue];
}

+ (SGFCTextPropertyValue*) propertyValueWithText:(NSString*)textValue
{
  return [SGFCTextPropertyValue textPropertyValueWithTextValue:textValue];
}

+ (SGFCPointPropertyValue*) propertyValueWithPoint:(NSString*)pointValue
{
  return [SGFCPointPropertyValue pointPropertyValueWithPointValue:pointValue];
}

+ (SGFCMovePropertyValue*) propertyValueWithMove:(NSString*)moveValue
{
  return [SGFCMovePropertyValue movePropertyValueWithMoveValue:moveValue];
}

+ (SGFCStonePropertyValue*) propertyValueWithStone:(NSString*)stoneValue
{
  return [SGFCStonePropertyValue stonePropertyValueWithStoneValue:stoneValue];
}

+ (SGFCSinglePropertyValue*) propertyValueWithValue:(NSString*)value
{
  return [SGFCSinglePropertyValue singlePropertyValueWithRawValue:value];
}

+ (SGFCGoPointPropertyValue*) propertyValueWithGoPoint:(NSString*)pointValue
                                             boardSize:(SGFCBoardSize)boardSize
{
  return [SGFCGoPointPropertyValue goPointPropertyValueWithGoPointValue:pointValue
                                                              boardSize:boardSize];
}

+ (SGFCGoMovePropertyValue*) propertyValueWithGoMove:(NSString*)moveValue
                                           boardSize:(SGFCBoardSize)boardSize
                                               color:(SGFCColor)color
{
  return [SGFCGoMovePropertyValue goMovePropertyValueWithGoMoveValue:moveValue
                                                           boardSize:boardSize
                                                               color:color];
}

+ (SGFCGoMovePropertyValue*) propertyValueWithGoMovePlayedByColor:(SGFCColor)color
{
  return [SGFCGoMovePropertyValue goMovePropertyValueWithColor:color];
}

+ (SGFCGoStonePropertyValue*) propertyValueWithGoStone:(NSString*)stoneValue
                                             boardSize:(SGFCBoardSize)boardSize
                                                 color:(SGFCColor)color
{
  return [SGFCGoStonePropertyValue goStonePropertyValueWithGoStoneValue:stoneValue
                                                              boardSize:boardSize
                                                                  color:color];
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithNumber:(SGFCNumber)numberValue1
                                                        number:(SGFCNumber)numberValue2
{
  return [SGFCComposedPropertyValue composedPropertyValueWithValue1:[SGFCPropertyValueFactory propertyValueWithNumber:numberValue1]
                                                             value2:[SGFCPropertyValueFactory propertyValueWithNumber:numberValue2]];
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithSimpleText:(NSString*)simpleTextValue1
                                                        simpleText:(NSString*)simpleTextValue2
{
  return [SGFCComposedPropertyValue composedPropertyValueWithValue1:[SGFCPropertyValueFactory propertyValueWithSimpleText:simpleTextValue1]
                                                             value2:[SGFCPropertyValueFactory propertyValueWithSimpleText:simpleTextValue2]];
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithNumber:(SGFCNumber)numberValue
                                                    simpleText:(NSString*)simpleTextValue
{
  return [SGFCComposedPropertyValue composedPropertyValueWithValue1:[SGFCPropertyValueFactory propertyValueWithNumber:numberValue]
                                                             value2:[SGFCPropertyValueFactory propertyValueWithSimpleText:simpleTextValue]];
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithPoint:(NSString*)pointValue1
                                                        point:(NSString*)pointValue2
{
  return [SGFCComposedPropertyValue composedPropertyValueWithValue1:[SGFCPropertyValueFactory propertyValueWithPoint:pointValue1]
                                                             value2:[SGFCPropertyValueFactory propertyValueWithPoint:pointValue2]];
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithPoint:(NSString*)pointValue
                                                   simpleText:(NSString*)simpleTextValue
{
  return [SGFCComposedPropertyValue composedPropertyValueWithValue1:[SGFCPropertyValueFactory propertyValueWithPoint:pointValue]
                                                             value2:[SGFCPropertyValueFactory propertyValueWithSimpleText:simpleTextValue]];
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithStone:(NSString*)stoneValue
                                                        point:(NSString*)pointValue
{
  return [SGFCComposedPropertyValue composedPropertyValueWithValue1:[SGFCPropertyValueFactory propertyValueWithStone:stoneValue]
                                                             value2:[SGFCPropertyValueFactory propertyValueWithPoint:pointValue]];
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithValue1:(SGFCSinglePropertyValue*)valueObject1
                                                        value2:(SGFCSinglePropertyValue*)valueObject2
{
  return [SGFCComposedPropertyValue composedPropertyValueWithValue1:valueObject1
                                                             value2:valueObject2];
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithGoPoint:(NSString*)pointValue1
                                                        goPoint:(NSString*)pointValue2
                                                      boardSize:(SGFCBoardSize)boardSize
{
  SGFCGoPointPropertyValue* valueObject1 = [SGFCPropertyValueFactory propertyValueWithGoPoint:pointValue1
                                                                                    boardSize:boardSize];
  SGFCGoPointPropertyValue* valueObject2 = [SGFCPropertyValueFactory propertyValueWithGoPoint:pointValue2
                                                                                    boardSize:boardSize];
  return [SGFCComposedPropertyValue composedPropertyValueWithValue1:valueObject1
                                                             value2:valueObject2];
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithGoPoint:(NSString*)pointValue
                                                      boardSize:(SGFCBoardSize)boardSize
                                                     simpleText:(NSString*)simpleTextValue
{
  SGFCGoPointPropertyValue* valueObject1 = [SGFCPropertyValueFactory propertyValueWithGoPoint:pointValue
                                                                                    boardSize:boardSize];
  SGFCSimpleTextPropertyValue* valueObject2 = [SGFCPropertyValueFactory propertyValueWithSimpleText:simpleTextValue];
  return [SGFCComposedPropertyValue composedPropertyValueWithValue1:valueObject1
                                                             value2:valueObject2];
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithGoStone:(NSString*)stoneValue
                                                          color:(SGFCColor)color
                                                        goPoint:(NSString*)pointValue
                                                      boardSize:(SGFCBoardSize)boardSize
{
  SGFCGoStonePropertyValue* valueObject1 = [SGFCPropertyValueFactory propertyValueWithGoStone:stoneValue
                                                                                    boardSize:boardSize
                                                                                        color:color];
  SGFCGoPointPropertyValue* valueObject2 = [SGFCPropertyValueFactory propertyValueWithGoPoint:pointValue
                                                                                    boardSize:boardSize];
  return [SGFCComposedPropertyValue composedPropertyValueWithValue1:valueObject1
                                                             value2:valueObject2];
}

@end
