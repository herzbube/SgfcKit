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
#import "SGFCGoPlayerRankType.h"
#import "SGFCGoPlayerRatingType.h"
#import "SGFCTypedefs.h"

// System includes
#import <Foundation/NSObjCRuntime.h>

/// @brief The SGFCGoPlayerRank struct is a simple type that can hold the
/// decomposed values of an #SGFCPropertyTypeBR or #SGFCPropertyTypeWR
/// property value.
///
/// @ingroup public-api
/// @ingroup property-value
/// @ingroup game
/// @ingroup go
///
/// @see SGFCGoPlayerRankMake
/// @see SGFCGoPlayerRankFromPropertyValue
/// @see SGFCGoPlayerRankToPropertyValue
/// @see SGFCGoPlayerRankEqualToGoPlayerRank
/// @see SGFCGoPlayerRankNotEqualToGoPlayerRank
typedef struct
{
  /// @brief The rank. The default is 30.
  SGFCNumber Rank;

  /// @brief The rank type. The default is #SGFCGoPlayerRankTypeKyu.
  SGFCGoPlayerRankType RankType;

  /// @brief The optional rating type that applies to the rank (e.g. the rank
  /// is established). The default is #SGFCGoPlayerRatingTypeUnspecified.
  SGFCGoPlayerRatingType RatingType;

  /// @brief YES if the SGFCGoPlayerRank object holds a valid Go player rank.
  /// NO if the SGFCGoPlayerRank object holds an invalid Go player rank.
  /// The default is NO.
  ///
  /// This is mainly used to indicate whether
  /// SGFCGoPlayerRankFromPropertyValue() was successful in decomposing
  /// the #SGFCPropertyTypeBR or #SGFCPropertyTypeWR property value. A
  /// library client that manually creates an SGFCGoPlayerRank object can
  /// simply set this to YES to assert a valid Go player rank.
  BOOL IsValid;
} SGFCGoPlayerRank;

// Prevent C++ name mangling
#ifdef __cplusplus
extern "C"
{
#endif
  /// @brief Returns an SGFCGoPlayerRank value initialized with @a rank,
  /// @a rankType, @a ratingType and @a isValid.
  extern SGFCGoPlayerRank SGFCGoPlayerRankMake(SGFCNumber rank, SGFCGoPlayerRankType rankType, SGFCGoPlayerRatingType ratingType, BOOL isValid);

  /// @brief Decomposes the content of @a propertyValue into distinct rank,
  /// rank type and rating type values.
  ///
  /// See the SGF standard specification for the recommended structure of an
  /// #SGFCPropertyTypeBR or #SGFCPropertyTypeWR property value.
  ///
  /// In addition to what the SGF standard recommends, this also recognizes
  /// the notation "1p", "2p", etc. to express professional Dan ranks.
  ///
  /// @return SGFCGoPlayerRank An object with the decomposed rank, rank type
  /// and rating type values. The object's SGFCGoPlayerRank::IsValid member
  /// is YES if decomposition was successful, otherwise it is NO.
  extern SGFCGoPlayerRank SGFCGoPlayerRankFromPropertyValue(NSString* propertyValue);

  /// @brief Composes a property value for #SGFCPropertyTypeBR or
  /// #SGFCPropertyTypeWR from the rank, rank type and rating type values in
  /// @a goPlayerRank.
  ///
  /// See the SGF standard specification for the recommended structure of an
  /// #SGFCPropertyTypeBR or #SGFCPropertyTypeWR property value.
  ///
  /// In addition to what the SGF standard recommends, this also produces
  /// the notation "1p", "2p", etc. to express professional Dan ranks.
  ///
  /// @return SgfcSimpleText A property value for #SGFCPropertyTypeBR or
  /// #SGFCPropertyTypeWR that conforms to the SGF standard's recommended
  /// formatting, or #SGFCNoneValueString if the
  /// SGFCGoPlayerRank::IsValid member of @a goPlayerRank is NO.
  extern NSString* SGFCGoPlayerRankToPropertyValue(SGFCGoPlayerRank goPlayerRank);

  /// @brief Returns YES if the properties @e Rank, @e RankType,
  /// @e RatingType and @e IsValid are the same for @a goPlayerRank1 and
  /// @a goPlayerRank2. Returns NO if any of these properties are different.
  extern BOOL SGFCGoPlayerRankEqualToGoPlayerRank(SGFCGoPlayerRank goPlayerRank1, SGFCGoPlayerRank goPlayerRank2);

  /// @brief Returns YES if any of the properties @e Rank,
  /// @e RankType, @e RatingType or @e IsValid are different for @a goPlayerRank1
  /// and @a goPlayerRank2. Returns NO if all properties are the same.
  extern BOOL SGFCGoPlayerRankNotEqualToGoPlayerRank(SGFCGoPlayerRank goPlayerRank1, SGFCGoPlayerRank goPlayerRank2);
#ifdef __cplusplus
}
#endif
