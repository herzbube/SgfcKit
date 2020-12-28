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
#import "../../include/SGFCDate.h"
#import "../../include/NSValue+SGFCDate.h"
#import "../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/SgfcDate.h>

SGFCDate SGFCDateMake(SGFCNumber year, SGFCNumber month, SGFCNumber day)
{
  SGFCDate date;

  date.Year = year;
  date.Month = month;
  date.Day = day;

  return date;
}

BOOL SGFCDateIsPartialDate(SGFCDate date)
{
  LibSgfcPlusPlus::SgfcDate mappedDate =
  {
    [SGFCMappingUtility fromSgfcKitNumber:date.Year],
    [SGFCMappingUtility fromSgfcKitNumber:date.Month],
    [SGFCMappingUtility fromSgfcKitNumber:date.Day],
  };

  return [SGFCMappingUtility toSgfcKitBoolean:mappedDate.IsPartialDate()];
}

BOOL SGFCDateIsValidCalendarDate(SGFCDate date)
{
  LibSgfcPlusPlus::SgfcDate mappedDate =
  {
    [SGFCMappingUtility fromSgfcKitNumber:date.Year],
    [SGFCMappingUtility fromSgfcKitNumber:date.Month],
    [SGFCMappingUtility fromSgfcKitNumber:date.Day],
  };

  return [SGFCMappingUtility toSgfcKitBoolean:mappedDate.IsValidCalendarDate()];
}

BOOL SGFCDateIsValidSgfDate(SGFCDate date)
{
  LibSgfcPlusPlus::SgfcDate mappedDate =
  {
    [SGFCMappingUtility fromSgfcKitNumber:date.Year],
    [SGFCMappingUtility fromSgfcKitNumber:date.Month],
    [SGFCMappingUtility fromSgfcKitNumber:date.Day],
  };

  return [SGFCMappingUtility toSgfcKitBoolean:mappedDate.IsValidSgfDate()];
}

NSArray* SGFCDateFromPropertyValue(NSString* propertyValue)
{
  auto dates = LibSgfcPlusPlus::SgfcDate::FromPropertyValue(
    [SGFCMappingUtility fromSgfcKitSimpleText:propertyValue]);

  return [SGFCMappingUtility toSgfcKitDates:dates];
}

NSString* SGFCDateToPropertyValue(NSArray* gameDates)
{
  auto mappedGameDates = [SGFCMappingUtility fromSgfcKitDates:gameDates];

  return [SGFCMappingUtility toSgfcKitString:LibSgfcPlusPlus::SgfcDate::ToPropertyValue(mappedGameDates)];
}

BOOL SGFCDateEqualToDate(SGFCDate date1, SGFCDate date2)
{
  if (date1.Year != date2.Year)
    return NO;
  else if (date1.Month != date2.Month)
    return NO;
  else if (date1.Day != date2.Day)
    return NO;
  else
    return YES;
}

BOOL SGFCDateNotEqualToDate(SGFCDate date1, SGFCDate date2)
{
  return SGFCDateEqualToDate(date1, date2) ? NO : YES;
}
