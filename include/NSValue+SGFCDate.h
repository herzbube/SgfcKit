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
#import "SGFCDate.h"

// System includes
#import <Foundation/NSValue.h>

/// @brief The NSValueAdditionsSGFCDate category adds the capability to
/// store an SGFCDate inside an NSValue object, and to retrieve an SGFCDate
/// from an NSValue object.
@interface NSValue (NSValueAdditionsSGFCDate)

/// @brief Creates a new NSValue object containing the data from the
/// specified SGFCDate object @a sgfcDateValue.
+ (instancetype)valueWithSGFCDate:(SGFCDate)sgfcDateValue;

/// @brief Returns the SGFCDate representation of the data stored in the
/// NSValue object.
@property (readonly) SGFCDate sgfcDateValue;

@end
