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

// System includes
#import <Foundation/NSObjCRuntime.h>

// Forward declarations
@class SGFCSinglePropertyValue;
@class SGFCComposedPropertyValue;

/// @brief The SGFCPropertyValue protocol provides access to one of the
/// values of a property of an SGF node.
///
/// @ingroup public-api
/// @ingroup property-value
///
/// Do @b NOT attempt to write an implementation of the SGFCPropertyValue
/// protocol yourself! SgfcKit relies on implementations also adopting a
/// library-internal protocol.
@protocol SGFCPropertyValue

@required

/// @brief Returns YES if the SGFCPropertyValue object holds a "composed"
/// value, i.e. a value that consists of a composite of two single values.
/// Returns NO if the SGFCPropertyValue holds only a single value.
@property(nonatomic, readonly, getter=isComposedValue) BOOL composedValue;

/// @brief Returns @e nil if isComposedValue() returns YES. Returns an
/// SGFCSinglePropertyValue object if isComposedValue() returns NO. The
/// caller is not the owner of the SGFCSinglePropertyValue object.
- (SGFCSinglePropertyValue*) toSingleValue;

/// @brief Returns an SGFCComposedPropertyValue object if isComposedValue()
/// returns YES. Returns @e nil if isComposedValue() returns NO. The
/// caller is not the owner of the SGFCComposedPropertyValue object.
- (SGFCComposedPropertyValue*) toComposedValue;

@end
