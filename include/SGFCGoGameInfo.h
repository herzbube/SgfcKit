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
#import "SGFCGameInfo.h"
#import "SGFCGoPlayerRank.h"
#import "SGFCGoRuleset.h"
#import "SGFCTypedefs.h"

// System includes
#import <Foundation/NSObject.h>

/// @brief The SGFCGoGameInfo interface is a specialization of SGFCGameInfo
/// that contains additional game information that is specific for the game
/// of Go (e.g. komi).
///
/// @ingroup public-api
/// @ingroup property-value
/// @ingroup go
///
/// @attention SGFCGameInfo or SGFCGoGameInfo form a class cluster. Do @b not
/// attempt to subclass SGFCGameInfo or SGFCGoGameInfo! Always use the
/// convenience constructors and initializers from the SGFCGameInfo class
/// to create objects - they will automatically provide you with an
/// SGFCGoGameInfo object when the root node parameter indicates that it is
/// appropriate, i.e. when the game type is #SGFCGameTypeGo.
@interface SGFCGoGameInfo : SGFCGameInfo
{
}

/// @brief Returns a newly constructed SGFCGoGameInfo object with
/// default values.
+ (instancetype) goGameInfo;

/// @brief Initializes an SGFCGoGameInfo object with default values.
///
/// This is the designated initializer of SGFCGoGameInfo.
- (instancetype) init NS_DESIGNATED_INITIALIZER;

/// @brief The number of handicap stones. The default value is
/// #SGFCHandicapStonesNone.
///
/// @see SGFCPropertyTypeHA
@property(nonatomic) SGFCNumber numberOfHandicapStones;

/// @brief Returns the komi. The default value is #SGFCKomiNone.
///
/// @see SGFCPropertyTypeKM
@property(nonatomic) SGFCReal komi;

/// @brief Returns the Go ruleset used for the game. The default value is
/// an SGFCGoRuleset object which has the @e IsValid property set to NO.
///
/// The returned SGFCGoRuleset also has the @e IsValid property set to
/// NO if there is a problem with decomposing the raw property value.
/// See SGFCGoRulesetFromPropertyValue() for details. An indicator that
/// this happened is if rulesName() returns a value that is not equal to
/// #SGFCNoneValueString.
///
/// Invoking the setter of this property also changes the information returned
/// by rulesName().
///
/// Invoking the setter of the base class property rulesName()
/// also changes the information returned by this property.
///
/// @see SGFCPropertyTypeRU
@property(nonatomic) SGFCGoRuleset goRuleset;

/// @brief Returns the rank of the black player. The default value is
/// an SGFCGoPlayerRank object which has the @e IsValid property set to
/// NO.
///
/// The returned SGFCGoPlayerRank also has the @e IsValid property set to
/// NO if there is a problem with decomposing the raw property value.
/// See SGFCGoPlayerRankFromPropertyValue() for details. An indicator that
/// this happened is if GetBlackPlayerRank() returns a value that is not equal
/// to #SGFCNoneValueString.
///
/// Invoking the setter of this property also changes the information returned
/// by blackPlayerRank().
///
/// Invoking the setter of the base class property blackPlayerRank() also
/// changes the information returned by this property.
///
/// @see SGFCPropertyTypeBR
@property(nonatomic) SGFCGoPlayerRank goBlackPlayerRank;

/// @brief Returns the rank of the white player. The default value is
/// an SGFCGoPlayerRank object which has the @e IsValid property set to
/// NO.
///
/// The returned SGFCGoPlayerRank also has the @e IsValid property set to
/// NO if there is a problem with decomposing the raw property value.
/// See SGFCGoPlayerRankFromPropertyValue() for details. An indicator that
/// this happened is if GetWhitePlayerRank() returns a value that is not equal
/// to #SGFCNoneValueString.
///
/// Invoking the setter of this property also changes the information returned
/// by whitePlayerRank().
///
/// Invoking the setter of the base class property whitePlayerRank() also
/// changes the information returned by this property.
///
/// @see SGFCPropertyTypeWR
@property(nonatomic) SGFCGoPlayerRank goWhitePlayerRank;

@end
