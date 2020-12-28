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
#import "SGFCTypedefs.h"

// System includes
#import <Foundation/NSArray.h>
#import <Foundation/NSObjCRuntime.h>

/// @brief The SGFCDate struct is a simple type that can hold one of the 1-n
/// decomposed date values of an #SGFCPropertyTypeDT property value.
///
/// @ingroup public-api
/// @ingroup property-value
/// @ingroup game
///
/// @see SGFCDateMake
/// @see SGFCDateIsPartialDate
/// @see SGFCDateIsValidCalendarDate
/// @see SGFCDateIsValidSgfDate
/// @see SGFCDateFromPropertyValue
/// @see SGFCDateToPropertyValue
/// @see SGFCDateEqualToDate
/// @see SGFCDateNotEqualToDate
typedef struct
{
  /// @brief The date's year part. Valid values are in the range from 0-9999.
  /// The default is 0.
  ///
  /// @see SGFCDateIsPartialDate()
  /// @see SGFCDateIsValidCalendarDate()
  /// @see SGFCDateIsValidSgfDate()
  SGFCNumber Year = 0;

  /// @brief The date's month part. Valid values are in the range from 0-12.
  /// The value 0 denotes that the date has no month part. The default is 0.
  ///
  /// @see SGFCDateIsPartialDate()
  /// @see SGFCDateIsValidCalendarDate()
  /// @see SGFCDateIsValidSgfDate()
  SGFCNumber Month = 0;

  /// @brief The date's day part. Valid values are based on the month part
  /// and, if the month is February, the year part (for leap years). The
  /// value 0 denotes that the date has no day part. The default is 0.
  ///
  /// @see SGFCDateIsPartialDate()
  /// @see SGFCDateIsValidCalendarDate()
  /// @see SGFCDateIsValidSgfDate()
  SGFCNumber Day = 0;
} SGFCDate;

/// @brief Returns an SGFCDate value initialized with @a year, @a month and
/// @a day.
extern SGFCDate SGFCDateMake(SGFCNumber year, SGFCNumber month, SGFCNumber day);

/// @brief Returns YES if @a date is a partial date, i.e. if one or more
/// of the date parts has value 0. Returns NO if @a date is not a
/// partial date, i.e. if all date parts have values that are not equal
/// than 0.
extern BOOL SGFCDateIsPartialDate(SGFCDate date);

/// @brief Returns YES if @a date is a valid calendar date. Returns NO
/// if @a date is not a valid calendar date. Partial dates are not valid
/// calendar dates.
///
/// This method calculates leap years (in which 29 February is valid)
/// according to the Gregorian calendar.
extern BOOL SGFCDateIsValidCalendarDate(SGFCDate date);

/// @brief Returns YES if @a date is a valid SGF date, i.e. one that can
/// be passed to SGFCDateToPropertyValue() for composing a property value for
/// #SGFCPropertyTypeDT). Returns NO if @a date is not a valid SGF
/// date, i.e. @a date cannot be passed to SGFCDateToPropertyValue().
///
/// A date is a valid SGF date if SGFCDateIsValidCalendarDate() returns YES.
/// A date is also a valid SGF date if SGFCDateIsPartialDate() returns YES and
/// all of the following is true:
/// - The date parts that don't have a zero value have a valid value for a
///   calendar date.
/// - The date is not missing only the month
/// - The date is not missing all date parts.
///
/// Examples:
/// - 2020-12-31: SGFCDateIsPartialDate() is NO, SGFCDateIsValidCalendarDate()
///   is YES, SGFCDateIsValidSgfDate() is YES.
/// - 2100-02-29: SGFCDateIsPartialDate() is NO, SGFCDateIsValidCalendarDate()
///   is NO (because year 2100 is not a leap year), SGFCDateIsValidSgfDate()
///   is NO (same reason).
/// - 2020-12-00: SGFCDateIsPartialDate() is YES, SGFCDateIsValidCalendarDate()
///   is NO (because partial dates are not calendar dates),
///   SGFCDateIsValidSgfDate() is YES.
/// - 2020-13-00: SGFCDateIsPartialDate() is YES, SGFCDateIsValidCalendarDate()
///   is NO, (because partial dates are not calendar dates and there is no month
///   13), SGFCDateIsValidSgfDate() is NO (because there is no month 13).
/// - 2020-00-01: SGFCDateIsPartialDate() is YES, SGFCDateIsValidCalendarDate()
///   is NO, (because partial dates are not calendar dates),
///   SGFCDateIsValidSgfDate() is NO (because the month part is missing).
/// - 0000-00-00: SGFCDateIsPartialDate() is YES, SGFCDateIsValidCalendarDate()
///   is NO, (because partial dates are not calendar dates),
///   SGFCDateIsValidSgfDate() is NO (because all date parts are missing).
///
/// Partial dates and validity of the day part:
/// - If the year part is missing then 29 February is considered to be
///   valid.
/// - If both the year part and the month part are missing then valid values
///   for the day part are in the range from 1-31.
///
/// @note If a partial date is passed to SGFCDateToPropertyValue() it may turn
/// out that the day part is invalid after all, because a preceding date
/// specifies a year and/or month that makes the day part invalid.
///
/// This method calculates leap years (in which 29 February is valid)
/// according to the Gregorian calendar.
extern BOOL SGFCDateIsValidSgfDate(SGFCDate date);

/// @brief Decomposes the content of @a propertyValue into a collection of
/// distinct SGFCDate values. The order of the collection matches the order
/// in which values appear in @a propertyValue. The collection is empty if
/// decomposition fails.
///
/// If decomposition succeeds the returned NSArray contains NSValue objects,
/// each of which stores the data of one SGFCDate. Use the property
/// NSValueAdditionsSGFCDate::sgfcDateValue() to retrieve the SGFCDate from the
/// NSValue object. The category is defined in the header file
/// NSValue+SGFCDate.h.
///
/// Decomposition fails if the SGF standard's specification of the
/// mandatory structure of an #SGFCPropertyTypeDT property value is not
/// met. Decomposition also fails if any of the dates encoded in
/// @a propertyValue is not valid, i.e. its SGFCDateIsValidSgfDate() method
/// returns NO. As a corollary if decomposition succeeds the
/// SGFCDateIsValidSgfDate() method of all date objects in the returned
/// collection returns YES.
///
/// See the SGF standard specification for the mandatory structure of an
/// #SGFCPropertyTypeDT property value.
///
/// @see SGFCDateIsValidSgfDate()
extern NSArray* SGFCDateFromPropertyValue(NSString* propertyValue);

/// @brief Composes a property value for #SGFCPropertyTypeDT from the
/// collection of SGFCDate values in @a gameDates.
///
/// The elements of @a gameDates must be NSValue objects each of which stores
/// the data of one SGFCDate. Use the factory method
/// NSValueAdditionsSGFCDate::valueWithSGFCDate:() to store the SGFCDate in an
/// NSValue object. The category is defined in the header file
/// NSValue+SGFCDate.h.
///
/// @a gameDates is evaluated from beginning to end in order to compose the
/// property value from left to right. As recommended by the SGF standard
/// shortcuts are built from the dates in @a gameDates wherever possible.
/// A date's SGFCDateIsValidSgfDate() method must return YES, otherwise the
/// compose operation fails and this method returns #SGFCNoneValueString.
///
/// @a gameDates may contain dates that already are shortcuts, to support
/// the case that the caller wants to do the shortcutting herself. The
/// compose operation does not attempt to generate shortcuts from dates that
/// already are shortcuts. Dates that already are shortcuts are validated
/// differently, but the outcome of a failed validation is the same: The
/// compose operation fails and this method returns
/// #SGFCNoneValueString.
///
/// Validation rules for dates that already are shortcut dates:
/// - Step 1: Before the date's SGFCDateIsValidSgfDate() method is invoked the
///   date is first logically completed as far as possible using the preceding
///   dates' parts. Example: 2019-02-01 is followed by the shortcut
///   0000-00-29. The shortcut is completed to 2019-02-29 which causes
///   SGFCDateIsValidSgfDate() to return NO. Only year and month are used for
///   completion - this matches the SGF standard specification which
///   mandates that shortcuts acquire the last preceding YYYY and MM.
/// - Step 2: The date is compared to the preceding date in @a gameDates to
///   check whether the shortcut is valid according to the encoding rules in
///   the SGF standard. Example: 2020-01-01 followed by the shortcut
///   0000-02-00. The shortcut is not valid because an MM shortcut
///   after an YYYY-MM-DD date cannot be encoded (upon decoding a 2-digit
///   item that appears after an YYYY-MM-DD date is interpreted as DD).
///
/// @return NSString A property value for #SGFCPropertyTypeDT that
/// conforms to the SGF standard's mandatory formatting, or
/// #SGFCNoneValueString if the dates in @a gameDates contain
/// erroneous data: A date whose SGFCDateIsValidSgfDate() method returns NO, a
/// shortcut date is invalid in relation to the preceding date in the
/// @a gameDates collection (cf. the SGF standard for details), or a
/// shortcut date whose date part is made invalid by the preceding date
/// (e.g. 0000-00-29 after 2019-02-28), or a non-shortcut date that is the
/// same as the preceding non-shortcut date.
extern NSString* SGFCDateToPropertyValue(NSArray* gameDates);

/// @brief Returns YES if the properties @e Year, @e Month and @e Day are the
/// same for @a date1 and @a date2. Returns NO if any of these properties are
/// different.
extern BOOL SGFCDateEqualToDate(SGFCDate date1, SGFCDate date2);

/// @brief Returns YES if any of the properties @e Year, @e Month or @e Day
/// are different for @a date1 and @a date2. Returns NO if all properties are
/// the same.
extern BOOL SGFCDateNotEqualToDate(SGFCDate date1, SGFCDate date2);
