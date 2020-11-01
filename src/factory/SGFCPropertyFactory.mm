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
#import "../../include/SGFCProperty.h"
#import "../../include/SGFCPropertyFactory.h"
#import "../SGFCExceptionUtility.h"

@implementation SGFCPropertyFactory

#pragma mark - Public API

+ (SGFCProperty*) propertyWithType:(SGFCPropertyType)propertyType
{
  return [SGFCProperty propertyWithType:propertyType];
}

+ (SGFCProperty*) propertyWithType:(SGFCPropertyType)propertyType
                             value:(id<SGFCPropertyValue>)propertyValue
{
  return [SGFCProperty propertyWithType:propertyType
                                  value:propertyValue];
}

+ (SGFCProperty*) propertyWithType:(SGFCPropertyType)propertyType
                            values:(NSArray*)propertyValues
{
  return [SGFCProperty propertyWithType:propertyType
                                 values:propertyValues];
}

+ (SGFCProperty*) propertyWithName:(NSString*)propertyName
{
  return [SGFCProperty propertyWithName:propertyName];
}

+ (SGFCProperty*) propertyWithName:(NSString*)propertyName
                             value:(id<SGFCPropertyValue>)propertyValue
{
  return [SGFCProperty propertyWithName:propertyName
                                  value:propertyValue];
}

+ (SGFCProperty*) propertyWithName:(NSString*)propertyName
                            values:(NSArray*)propertyValues
{
  return [SGFCProperty propertyWithName:propertyName
                                 values:propertyValues];
}

+ (SGFCBoardSizeProperty*) boardSizeProperty
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"boardSizeProperty:"];
  return nil;
}

+ (SGFCBoardSizeProperty*) boardSizePropertyWithNumberValue:(SGFCNumberPropertyValue*)propertyValue
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"boardSizePropertyWithNumberValue:"];
  return nil;
}

+ (SGFCBoardSizeProperty*) boardSizePropertyWithComposedValue:(SGFCComposedPropertyValue*)propertyValue
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"boardSizePropertyWithComposedValue:"];
  return nil;
}

+ (SGFCGameTypeProperty*) gameTypeProperty
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"gameTypeProperty"];
  return nil;
}

+ (SGFCGameTypeProperty*) gameTypePropertyWithNumberValue:(SGFCNumberPropertyValue*)propertyValue
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"gameTypePropertyWithValue"];
  return nil;
}

@end
