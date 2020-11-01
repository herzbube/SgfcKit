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
#import "../../include/SGFCDoublePropertyValue.h"
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
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"propertyValueWithValue:"];
  return nil;
}

+ (SGFCGoPointPropertyValue*) propertyValueWithGoPoint:(NSString*)pointValue
                                             boardSize:(SGFCBoardSize)boardSize
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"propertyValueWithGoPoint:boardSize:"];
  return nil;
}

+ (SGFCGoPointPropertyValue*) propertyValueWithGoPoint:(NSString*)pointValue
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"propertyValueWithGoPoint:"];
  return nil;
}

+ (SGFCGoMovePropertyValue*) propertyValueWithGoMove:(NSString*)moveValue
                                           boardSize:(SGFCBoardSize)boardSize
                                               color:(SGFCColor)color
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"propertyValueWithGoMove:boardSize:color:"];
  return nil;
}

+ (SGFCGoMovePropertyValue*) propertyValueWithGoMove:(NSString*)moveValue
                                               color:(SGFCColor)color
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"propertyValueWithGoMove:color:"];
  return nil;
}

+ (SGFCGoMovePropertyValue*) propertyValueWithGoMove:(SGFCColor)color
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"propertyValueWithGoMove:"];
  return nil;
}

+ (SGFCGoStonePropertyValue*) propertyValueWithGoStone:(NSString*)stoneValue
                                             boardSize:(SGFCBoardSize)boardSize
                                                 color:(SGFCColor)color
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"propertyValueWithGoStone:boardSize:color:"];
  return nil;
}

+ (SGFCGoStonePropertyValue*) propertyValueWithGoStone:(NSString*)stoneValue
                                                 color:(SGFCColor)color
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"propertyValueWithGoStone:color:"];
  return nil;
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithNumber:(SGFCNumber)numberValue1
                                                        number:(SGFCNumber)numberValue2
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"composedPropertyValueWithNumber:number:"];
  return nil;
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithSimpleText:(NSString*)simpleTextValue1
                                                        simpleText:(NSString*)simpleTextValue2
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"composedPropertyValueWithSimpleText:simpleText:"];
  return nil;
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithNumber:(SGFCNumber)numberValue
                                                    simpleText:(NSString*)simpleTextValue
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"composedPropertyValueWithNumber:simpleText:"];
  return nil;
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithPoint:(NSString*)pointValue1
                                                        point:(NSString*)pointValue2
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"composedPropertyValueWithPoint:point:"];
  return nil;
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithPoint:(NSString*)pointValue
                                                   simpleText:(NSString*)simpleTextValue
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"composedPropertyValueWithPoint:simpleText:"];
  return nil;
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithStone:(NSString*)stoneValue
                                                        point:(NSString*)pointValue
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"composedPropertyValueWithStone:point:"];
  return nil;
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithValue1:(SGFCSinglePropertyValue*)valueObject1
                                                        value2:(SGFCSinglePropertyValue*)valueObject2
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"composedPropertyValueWithValue1:value2:"];
  return nil;
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithGoPoint:(NSString*)pointValue1
                                                        goPoint:(NSString*)pointValue2
                                                      boardSize:(SGFCBoardSize)boardSize
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"composedPropertyValueWithGoPoint:goPoint:boardSize:"];
  return nil;
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithGoPoint:(NSString*)pointValue
                                                      boardSize:(SGFCBoardSize)boardSize
                                                     simpleText:(NSString*)simpleTextValue
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"composedPropertyValueWithGoPoint:boardSize:simpleText:"];
  return nil;
}

+ (SGFCComposedPropertyValue*) composedPropertyValueWithGoStone:(NSString*)stoneValue
                                                          color:(SGFCColor)color
                                                        goPoint:(NSString*)pointValue
                                                      boardSize:(SGFCBoardSize)boardSize
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"composedPropertyValueWithGoStone:color:goPoint:boardSize:"];
  return nil;
}

@end
