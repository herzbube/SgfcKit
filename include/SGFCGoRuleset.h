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
#import "SGFCGoRulesetType.h"
#import "SGFCTypedefs.h"

// System includes
#import <Foundation/NSObjCRuntime.h>

/// @brief The SGFCGoRuleset struct is a simple type that can hold the
/// decomposed values of an #SGFCPropertyTypeRU property value.
///
/// @ingroup public-api
/// @ingroup property-value
/// @ingroup game
/// @ingroup go
///
/// @see SGFCGoRulesetMake
/// @see SGFCGoRulesetFromPropertyValue
/// @see SGFCGoRulesetToPropertyValue
/// @see SGFCGoRulesetEqualToGoRuleset
/// @see SGFCGoRulesetNotEqualToGoRuleset
typedef struct
{
  /// @brief The ruleset type. The default is #SGFCGoRulesetTypeAGA.
  SGFCGoRulesetType GoRulesetType = SGFCGoRulesetTypeAGA;

  /// @brief YES if the SGFCGoRuleset object holds a valid Go ruleset.
  /// NO if the SGFCGoRuleset object holds an invalid Go ruleset.
  /// The default is NO.
  ///
  /// This is mainly used to indicate whether
  /// SGFCGoRulesetFromPropertyValue() was successful in decomposing
  /// the #SGFCPropertyTypeRU property value. A library client that manually
  /// creates an SGFCGoRuleset object can simply set this to YES to assert
  /// a valid Go ruleset.
  bool IsValid = NO;
} SGFCGoRuleset;

/// @brief Returns an SGFCGoRuleset value initialized with @a goRulesetType
/// and @a isValid.
extern SGFCGoRuleset SGFCGoRulesetMake(SGFCGoRulesetType goRulesetType, BOOL isValid);

/// @brief Decomposes the content of @a propertyValue into a distinct
/// ruleset type value.
///
/// See the SGF standard specification for the recommended structure of an
/// #SGFCPropertyTypeRU property value.
///
/// @return SGFCGoRuleset An object with the decomposed ruleset type value.
/// The object's SGFCGoRuleset::IsValid member is YES if decomposition was
/// successful, otherwise it is NO.
extern SGFCGoRuleset SGFCGoRulesetFromPropertyValue(NSString* propertyValue);

/// @brief Composes a property value for #SGFCPropertyTypeRU from the
/// ruleset type value in @a goRuleset.
///
/// See the SGF standard specification for the recommended structure of an
/// #SGFCPropertyTypeRU property value.
///
/// @return NSString A property value for #SGFCPropertyTypeRU that
/// conforms to the SGF standard's mandatory formatting, or
/// #SGFCNoneValueString if the SGFCGoRuleset::IsValid member of
/// @a goRuleset is NO.
extern NSString* SGFCGoRulesetToPropertyValue(SGFCGoRuleset goRuleset);

/// @brief Returns YES if the properties @e GoRulesetType and @a IsValid are
/// the same for the current SGFCGoRuleset object and for @a other. Returns NO
/// if any of these properties are different.
extern BOOL SGFCGoRulesetEqualToGoRuleset(SGFCGoRuleset goRuleset1, SGFCGoRuleset goRuleset2);

/// @brief Returns YES if the properties @e GoRulesetType and @e IsValid are
/// different for the current SGFCGoRuleset object and for @a other. Returns NO
/// if all properties are the same.
extern BOOL SGFCGoRulesetNotEqualToGoRuleset(SGFCGoRuleset goRuleset1, SGFCGoRuleset goRuleset2);
