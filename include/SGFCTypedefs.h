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

#import <Foundation/NSObjCRuntime.h>

/// @brief The SGFCNumber type represents the Number value type defined by
/// the SGF standard. Values are signed integer numbers.
///
/// @ingroup public-api
///
/// The value range of SGFCNumber must be fully mappable to the value range
/// of LibSgfcPlusPlus::SgfcNumber, in both directions. SGFCNumber must
/// therefore use the same primitive underlying type as
/// LibSgfcPlusPlus::SgfcNumber. NSInteger is not an option because on 64-bit
/// platforms it has a wider value range than LibSgfcPlusPlus::SgfcNumber.
typedef long SGFCNumber;

/// @brief The SGFCReal type represents the Real value type defined by
/// the SGF standard. Values are signed floating point numbers.
///
/// @ingroup public-api
///
/// The value range of SGFCReal must be fully mappable to the value range
/// of LibSgfcPlusPlus::SgfcReal, in both directions. SGFCReal must
/// therefore use the same primitive underlying type as
/// LibSgfcPlusPlus::SgfcReal.
typedef double SGFCReal;
