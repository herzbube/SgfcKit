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
#import "../include/SGFCArgumentType.h"
#import "../include/SGFCColor.h"
#import "../include/SGFCCoordinateSystem.h"
#import "../include/SGFCDouble.h"
#import "../include/SGFCExitCode.h"
#import "../include/SGFCGameResultType.h"
#import "../include/SGFCGameType.h"
#import "../include/SGFCGoPlayerRankType.h"
#import "../include/SGFCGoPlayerRatingType.h"
#import "../include/SGFCGoPointNotation.h"
#import "../include/SGFCGoRulesetType.h"
#import "../include/SGFCMessageID.h"
#import "../include/SGFCMessageType.h"
#import "../include/SGFCNodeTraits.h"
#import "../include/SGFCPropertyCategory.h"
#import "../include/SGFCPropertyTraits.h"
#import "../include/SGFCPropertyType.h"
#import "../include/SGFCPropertyValueType.h"
#import "../include/SGFCWinType.h"
#import "SGFCPrivateConstants.h"

// libsgfc++ includes
#import <libsgfcplusplus/SgfcArgumentType.h>
#import <libsgfcplusplus/SgfcColor.h>
#import <libsgfcplusplus/SgfcCoordinateSystem.h>
#import <libsgfcplusplus/SgfcDouble.h>
#import <libsgfcplusplus/SgfcExitCode.h>
#import <libsgfcplusplus/SgfcGameResultType.h>
#import <libsgfcplusplus/SgfcGameType.h>
#import <libsgfcplusplus/SgfcGoPlayerRankType.h>
#import <libsgfcplusplus/SgfcGoPlayerRatingType.h>
#import <libsgfcplusplus/SgfcGoPointNotation.h>
#import <libsgfcplusplus/SgfcGoRulesetType.h>
#import <libsgfcplusplus/SgfcMessageID.h>
#import <libsgfcplusplus/SgfcMessageType.h>
#import <libsgfcplusplus/SgfcNodeTraits.h>
#import <libsgfcplusplus/SgfcPropertyCategory.h>
#import <libsgfcplusplus/SgfcPropertyTraits.h>
#import <libsgfcplusplus/SgfcPropertyType.h>
#import <libsgfcplusplus/SgfcPropertyValueType.h>
#import <libsgfcplusplus/SgfcWinType.h>

// System includes
#import <Foundation/NSValue.h>

NSDictionary* argumentTypeToSgfcKitMap =
@{
  @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::BeginningOfSgfData)) : @(SGFCArgumentTypeBeginningOfSgfData),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::DisableMessageID)) : @(SGFCArgumentTypeDisableMessageID),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::DisableWarningMessages)) : @(SGFCArgumentTypeDisableWarningMessages),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::HardLineBreakMode)) : @(SGFCArgumentTypeHardLineBreakMode),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::LineBreakAtEndOfNode)) : @(SGFCArgumentTypeLineBreakAtEndOfNode),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::NoSoftLineBreaksInTextValues)) : @(SGFCArgumentTypeNoSoftLineBreaksInTextValues),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::DeleteMarkupOnCurrentMove)) : @(SGFCArgumentTypeDeleteMarkupOnCurrentMove),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::DeleteEmptyNodes)) : @(SGFCArgumentTypeDeleteEmptyNodes),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::DeleteObsoleteProperties)) : @(SGFCArgumentTypeDeleteObsoleteProperties),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::DeleteUnknownProperties)) : @(SGFCArgumentTypeDeleteUnknownProperties),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::DeletePropertyType)) : @(SGFCArgumentTypeDeletePropertyType),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::UseOldPassMoveNotation)) : @(SGFCArgumentTypeUseOldPassMoveNotation),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::EnableRestrictiveChecking)) : @(SGFCArgumentTypeEnableRestrictiveChecking),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::CorrectVariationLevelAndRootMoves)) : @(SGFCArgumentTypeCorrectVariationLevelAndRootMoves),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::ReverseVariationOrdering)) : @(SGFCArgumentTypeReverseVariationOrdering),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::ExpandCompressedPointLists)) : @(SGFCArgumentTypeExpandCompressedPointLists),
};

NSDictionary* argumentTypeFromSgfcKitMap =
@{
  @(SGFCArgumentTypeBeginningOfSgfData) : @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::BeginningOfSgfData)),
  @(SGFCArgumentTypeDisableMessageID) : @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::DisableMessageID)),
  @(SGFCArgumentTypeDisableWarningMessages) : @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::DisableWarningMessages)),
  @(SGFCArgumentTypeHardLineBreakMode) : @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::HardLineBreakMode)),
  @(SGFCArgumentTypeLineBreakAtEndOfNode) : @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::LineBreakAtEndOfNode)),
  @(SGFCArgumentTypeNoSoftLineBreaksInTextValues) : @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::NoSoftLineBreaksInTextValues)),
  @(SGFCArgumentTypeDeleteMarkupOnCurrentMove) : @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::DeleteMarkupOnCurrentMove)),
  @(SGFCArgumentTypeDeleteEmptyNodes) : @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::DeleteEmptyNodes)),
  @(SGFCArgumentTypeDeleteObsoleteProperties) : @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::DeleteObsoleteProperties)),
  @(SGFCArgumentTypeDeleteUnknownProperties) : @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::DeleteUnknownProperties)),
  @(SGFCArgumentTypeDeletePropertyType) : @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::DeletePropertyType)),
  @(SGFCArgumentTypeUseOldPassMoveNotation) : @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::UseOldPassMoveNotation)),
  @(SGFCArgumentTypeEnableRestrictiveChecking) : @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::EnableRestrictiveChecking)),
  @(SGFCArgumentTypeCorrectVariationLevelAndRootMoves) : @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::CorrectVariationLevelAndRootMoves)),
  @(SGFCArgumentTypeReverseVariationOrdering) : @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::ReverseVariationOrdering)),
  @(SGFCArgumentTypeExpandCompressedPointLists) : @(static_cast<int>(LibSgfcPlusPlus::SgfcArgumentType::ExpandCompressedPointLists)),
};

NSDictionary* colorToSgfcKitMap =
@{
  @(static_cast<int>(LibSgfcPlusPlus::SgfcColor::Black)) : @(SGFCColorBlack),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcColor::White)) : @(SGFCColorWhite),
};

NSDictionary* colorFromSgfcKitMap =
@{
  @(SGFCColorBlack) : @(static_cast<int>(LibSgfcPlusPlus::SgfcColor::Black)),
  @(SGFCColorWhite) : @(static_cast<int>(LibSgfcPlusPlus::SgfcColor::White)),
};

NSDictionary* coordinateSystemToSgfcKitMap =
@{
  @(static_cast<int>(LibSgfcPlusPlus::SgfcCoordinateSystem::UpperLeftOrigin)) : @(SGFCCoordinateSystemUpperLeftOrigin),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcCoordinateSystem::LowerLeftOrigin)) : @(SGFCCoordinateSystemLowerLeftOrigin),
};

NSDictionary* coordinateSystemFromSgfcKitMap =
@{
  @(SGFCCoordinateSystemUpperLeftOrigin) : @(static_cast<int>(LibSgfcPlusPlus::SgfcCoordinateSystem::UpperLeftOrigin)),
  @(SGFCCoordinateSystemLowerLeftOrigin) : @(static_cast<int>(LibSgfcPlusPlus::SgfcCoordinateSystem::LowerLeftOrigin)),
};

NSDictionary* doubleToSgfcKitMap =
@{
  @(static_cast<int>(LibSgfcPlusPlus::SgfcDouble::Normal)) : @(SGFCDoubleNormal),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcDouble::Emphasized)) : @(SGFCDoubleEmphasized),
};

NSDictionary* doubleFromSgfcKitMap =
@{
  @(SGFCDoubleNormal) : @(static_cast<int>(LibSgfcPlusPlus::SgfcDouble::Normal)),
  @(SGFCDoubleEmphasized) : @(static_cast<int>(LibSgfcPlusPlus::SgfcDouble::Emphasized)),
};

NSDictionary* exitCodeToSgfcKitMap =
@{
  @(static_cast<int>(LibSgfcPlusPlus::SgfcExitCode::Ok)) : @(SGFCExitCodeOk),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcExitCode::Warning)) : @(SGFCExitCodeWarning),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcExitCode::Error)) : @(SGFCExitCodeError),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcExitCode::FatalError)) : @(SGFCExitCodeFatalError),
};

NSDictionary* exitCodeFromSgfcKitMap =
@{
  @(SGFCExitCodeOk) : @(static_cast<int>(LibSgfcPlusPlus::SgfcExitCode::Ok)),
  @(SGFCExitCodeWarning) : @(static_cast<int>(LibSgfcPlusPlus::SgfcExitCode::Warning)),
  @(SGFCExitCodeError) : @(static_cast<int>(LibSgfcPlusPlus::SgfcExitCode::Error)),
  @(SGFCExitCodeFatalError) : @(static_cast<int>(LibSgfcPlusPlus::SgfcExitCode::FatalError)),
};

NSDictionary* gameResultTypeToSgfcKitMap =
@{
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameResultType::BlackWin)) : @(SGFCGameResultTypeBlackWin),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameResultType::WhiteWin)) : @(SGFCGameResultTypeWhiteWin),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameResultType::Draw)) : @(SGFCGameResultTypeDraw),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameResultType::NoResult)) : @(SGFCGameResultTypeNoResult),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameResultType::UnknownResult)) : @(SGFCGameResultTypeUnknownResult),
};

NSDictionary* gameResultTypeFromSgfcKitMap =
@{
  @(SGFCGameResultTypeBlackWin) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameResultType::BlackWin)),
  @(SGFCGameResultTypeWhiteWin) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameResultType::WhiteWin)),
  @(SGFCGameResultTypeDraw) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameResultType::Draw)),
  @(SGFCGameResultTypeNoResult) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameResultType::NoResult)),
  @(SGFCGameResultTypeUnknownResult) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameResultType::UnknownResult)),
};

NSDictionary* gameTypeToSgfcKitMap =
@{
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Go)) : @(SGFCGameTypeGo),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Othello)) : @(SGFCGameTypeOthello),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Chess)) : @(SGFCGameTypeChess),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::GomokuAndRenju)) : @(SGFCGameTypeGomokuAndRenju),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::NineMensMorris)) : @(SGFCGameTypeNineMensMorris),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Backgammon)) : @(SGFCGameTypeBackgammon),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::ChineseChess)) : @(SGFCGameTypeChineseChess),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Shogi)) : @(SGFCGameTypeShogi),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::LinesOfAction)) : @(SGFCGameTypeLinesOfAction),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Ataxx)) : @(SGFCGameTypeAtaxx),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Hex)) : @(SGFCGameTypeHex),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Jungle)) : @(SGFCGameTypeJungle),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Neutron)) : @(SGFCGameTypeNeutron),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::PhilosophersFootball)) : @(SGFCGameTypePhilosophersFootball),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Quadrature)) : @(SGFCGameTypeQuadrature),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Trax)) : @(SGFCGameTypeTrax),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Tantrix)) : @(SGFCGameTypeTantrix),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Amazons)) : @(SGFCGameTypeAmazons),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Octi)) : @(SGFCGameTypeOcti),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Gess)) : @(SGFCGameTypeGess),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Twixt)) : @(SGFCGameTypeTwixt),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Zertz)) : @(SGFCGameTypeZertz),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Plateau)) : @(SGFCGameTypePlateau),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Yinsh)) : @(SGFCGameTypeYinsh),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Punct)) : @(SGFCGameTypePunct),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Gobblet)) : @(SGFCGameTypeGobblet),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Hive)) : @(SGFCGameTypeHive),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Exxit)) : @(SGFCGameTypeExxit),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Hnefatal)) : @(SGFCGameTypeHnefatal),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Kuba)) : @(SGFCGameTypeKuba),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Tripples)) : @(SGFCGameTypeTripples),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Chase)) : @(SGFCGameTypeChase),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::TumblingDown)) : @(SGFCGameTypeTumblingDown),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Sahara)) : @(SGFCGameTypeSahara),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Byte)) : @(SGFCGameTypeByte),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Focus)) : @(SGFCGameTypeFocus),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Dvonn)) : @(SGFCGameTypeDvonn),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Tamsk)) : @(SGFCGameTypeTamsk),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Gipf)) : @(SGFCGameTypeGipf),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Kropki)) : @(SGFCGameTypeKropki),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Unknown)) : @(SGFCGameTypeUnknown),
};

NSDictionary* gameTypeFromSgfcKitMap =
@{
  @(SGFCGameTypeGo) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Go)),
  @(SGFCGameTypeOthello) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Othello)),
  @(SGFCGameTypeChess) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Chess)),
  @(SGFCGameTypeGomokuAndRenju) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::GomokuAndRenju)),
  @(SGFCGameTypeNineMensMorris) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::NineMensMorris)),
  @(SGFCGameTypeBackgammon) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Backgammon)),
  @(SGFCGameTypeChineseChess) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::ChineseChess)),
  @(SGFCGameTypeShogi) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Shogi)),
  @(SGFCGameTypeLinesOfAction) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::LinesOfAction)),
  @(SGFCGameTypeAtaxx) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Ataxx)),
  @(SGFCGameTypeHex) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Hex)),
  @(SGFCGameTypeJungle) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Jungle)),
  @(SGFCGameTypeNeutron) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Neutron)),
  @(SGFCGameTypePhilosophersFootball) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::PhilosophersFootball)),
  @(SGFCGameTypeQuadrature) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Quadrature)),
  @(SGFCGameTypeTrax) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Trax)),
  @(SGFCGameTypeTantrix) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Tantrix)),
  @(SGFCGameTypeAmazons) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Amazons)),
  @(SGFCGameTypeOcti) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Octi)),
  @(SGFCGameTypeGess) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Gess)),
  @(SGFCGameTypeTwixt) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Twixt)),
  @(SGFCGameTypeZertz) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Zertz)),
  @(SGFCGameTypePlateau) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Plateau)),
  @(SGFCGameTypeYinsh) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Yinsh)),
  @(SGFCGameTypePunct) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Punct)),
  @(SGFCGameTypeGobblet) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Gobblet)),
  @(SGFCGameTypeHive) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Hive)),
  @(SGFCGameTypeExxit) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Exxit)),
  @(SGFCGameTypeHnefatal) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Hnefatal)),
  @(SGFCGameTypeKuba) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Kuba)),
  @(SGFCGameTypeTripples) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Tripples)),
  @(SGFCGameTypeChase) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Chase)),
  @(SGFCGameTypeTumblingDown) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::TumblingDown)),
  @(SGFCGameTypeSahara) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Sahara)),
  @(SGFCGameTypeByte) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Byte)),
  @(SGFCGameTypeFocus) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Focus)),
  @(SGFCGameTypeDvonn) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Dvonn)),
  @(SGFCGameTypeTamsk) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Tamsk)),
  @(SGFCGameTypeGipf) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Gipf)),
  @(SGFCGameTypeKropki) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Kropki)),
  @(SGFCGameTypeUnknown) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGameType::Unknown)),
};

NSDictionary* goPlayerRankTypeToSgfcKitMap =
@{
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPlayerRankType::Kyu)) : @(SGFCGoPlayerRankTypeKyu),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPlayerRankType::AmateurDan)) : @(SGFCGoPlayerRankTypeAmateurDan),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPlayerRankType::ProfessionalDan)) : @(SGFCGoPlayerRankTypeProfessionalDan),
};

NSDictionary* goPlayerRankTypeFromSgfcKitMap =
@{
  @(SGFCGoPlayerRankTypeKyu) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPlayerRankType::Kyu)),
  @(SGFCGoPlayerRankTypeAmateurDan) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPlayerRankType::AmateurDan)),
  @(SGFCGoPlayerRankTypeProfessionalDan) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPlayerRankType::ProfessionalDan)),
};

NSDictionary* goPlayerRatingTypeToSgfcKitMap =
@{
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPlayerRatingType::Uncertain)) : @(SGFCGoPlayerRatingTypeUncertain),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPlayerRatingType::Established)) : @(SGFCGoPlayerRatingTypeEstablished),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPlayerRatingType::Unspecified)) : @(SGFCGoPlayerRatingTypeUnspecified),
};

NSDictionary* goPlayerRatingTypeFromSgfcKitMap =
@{
  @(SGFCGoPlayerRatingTypeUncertain) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPlayerRatingType::Uncertain)),
  @(SGFCGoPlayerRatingTypeEstablished) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPlayerRatingType::Established)),
  @(SGFCGoPlayerRatingTypeUnspecified) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPlayerRatingType::Unspecified)),
};

NSDictionary* goPointNotationToSgfcKitMap =
@{
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPointNotation::Sgf)) : @(SGFCGoPointNotationSgf),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPointNotation::Figure)) : @(SGFCGoPointNotationFigure),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPointNotation::Hybrid)) : @(SGFCGoPointNotationHybrid),
};

NSDictionary* goPointNotationFromSgfcKitMap =
@{
  @(SGFCGoPointNotationSgf) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPointNotation::Sgf)),
  @(SGFCGoPointNotationFigure) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPointNotation::Figure)),
  @(SGFCGoPointNotationHybrid) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGoPointNotation::Hybrid)),
};

NSDictionary* goRulesetTypeToSgfcKitMap =
@{
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGoRulesetType::AGA)) : @(SGFCGoRulesetTypeAGA),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGoRulesetType::Ing)) : @(SGFCGoRulesetTypeIng),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGoRulesetType::Japanese)) : @(SGFCGoRulesetTypeJapanese),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcGoRulesetType::NZ)) : @(SGFCGoRulesetTypeNZ),
};

NSDictionary* goRulesetTypeFromSgfcKitMap =
@{
  @(SGFCGoRulesetTypeAGA) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGoRulesetType::AGA)),
  @(SGFCGoRulesetTypeIng) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGoRulesetType::Ing)),
  @(SGFCGoRulesetTypeJapanese) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGoRulesetType::Japanese)),
  @(SGFCGoRulesetTypeNZ) : @(static_cast<int>(LibSgfcPlusPlus::SgfcGoRulesetType::NZ)),
};

NSDictionary* messageIDToSgfcKitMap =
@{
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownCommand)) : @(SGFCMessageIDUnknownCommand),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownCommandLineOption)) : @(SGFCMessageIDUnknownCommandLineOption),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::CouldNotOpenSourceFile)) : @(SGFCMessageIDCouldNotOpenSourceFile),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::CouldNotReadSourceFile)) : @(SGFCMessageIDCouldNotReadSourceFile),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::MemoryAllocationFailed)) : @(SGFCMessageIDMemoryAllocationFailed),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SgfDataBeforeGameTree)) : @(SGFCMessageIDSgfDataBeforeGameTree),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::NoSgfData)) : @(SGFCMessageIDNoSgfData),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::IllegalCharacters)) : @(SGFCMessageIDIllegalCharacters),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::VariationNestingIncomplete)) : @(SGFCMessageIDVariationNestingIncomplete),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnexpectedEndOfFile)) : @(SGFCMessageIDUnexpectedEndOfFile),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::PropertyIdentifierTooLong)) : @(SGFCMessageIDPropertyIdentifierTooLong),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::EmptyVariationIgnored)) : @(SGFCMessageIDEmptyVariationIgnored),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SurplusValuesDeleted)) : @(SGFCMessageIDSurplusValuesDeleted),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::IllegalValueDeleted)) : @(SGFCMessageIDIllegalValueDeleted),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::IllegalSingleValueCorrected)) : @(SGFCMessageIDIllegalSingleValueCorrected),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::PropertyIdentifierWithLowercaseCharacter)) : @(SGFCMessageIDPropertyIdentifierWithLowercaseCharacter),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::EmptyValueDeleted)) : @(SGFCMessageIDEmptyValueDeleted),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::IllegalRootPropertyValue)) : @(SGFCMessageIDIllegalRootPropertyValue),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::GameIsNotGo)) : @(SGFCMessageIDGameIsNotGo),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::PropertyWithoutValuesIgnored)) : @(SGFCMessageIDPropertyWithoutValuesIgnored),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::IllegalVariationStartIgnored)) : @(SGFCMessageIDIllegalVariationStartIgnored),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::ZeroByteDeleted)) : @(SGFCMessageIDZeroByteDeleted),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::NonComposedValueDeleted)) : @(SGFCMessageIDNonComposedValueDeleted),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::MoveInRootNodeSplit)) : @(SGFCMessageIDMoveInRootNodeSplit),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::IllegalComposedValueCorrected)) : @(SGFCMessageIDIllegalComposedValueCorrected),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::CouldNotOpenDestinationFile)) : @(SGFCMessageIDCouldNotOpenDestinationFile),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::CouldNotWriteDestinationFile)) : @(SGFCMessageIDCouldNotWriteDestinationFile),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::DuplicatePropertyDeleted)) : @(SGFCMessageIDDuplicatePropertyDeleted),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::RequestedPropertyDeleted)) : @(SGFCMessageIDRequestedPropertyDeleted),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::MixedSetupAndMove)) : @(SGFCMessageIDMixedSetupAndMove),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::LongPropertyIdentifier)) : @(SGFCMessageIDLongPropertyIdentifier),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::RootPropertyDeleted)) : @(SGFCMessageIDRootPropertyDeleted),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::GameInfoPropertyWithIllegalFormat)) : @(SGFCMessageIDGameInfoPropertyWithIllegalFormat),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::NotSavedBecauseOfCriticalErrors)) : @(SGFCMessageIDNotSavedBecauseOfCriticalErrors),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownPropertyDeleted)) : @(SGFCMessageIDUnknownPropertyDeleted),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::MissingSemicolonAtGameTreeStart)) : @(SGFCMessageIDMissingSemicolonAtGameTreeStart),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::BlackAndWhiteMoveSplit)) : @(SGFCMessageIDBlackAndWhiteMoveSplit),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::PositionNotUnique)) : @(SGFCMessageIDPositionNotUnique),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::AddStoneDeleted)) : @(SGFCMessageIDAddStoneDeleted),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::PropertyNotDefinedInFF)) : @(SGFCMessageIDPropertyNotDefinedInFF),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::ContradictingAnnotationDeleted)) : @(SGFCMessageIDContradictingAnnotationDeleted),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::CombinationOfPropertiesConverted)) : @(SGFCMessageIDCombinationOfPropertiesConverted),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::MoveAnnotationDeleted)) : @(SGFCMessageIDMoveAnnotationDeleted),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::GameInfoDeleted)) : @(SGFCMessageIDGameInfoDeleted),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::DifferentFileFormats)) : @(SGFCMessageIDDifferentFileFormats),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownFileFormat)) : @(SGFCMessageIDUnknownFileFormat),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SquareBoardSizeCorrected)) : @(SGFCMessageIDSquareBoardSizeCorrected),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SourceFileNotSpecified)) : @(SGFCMessageIDSourceFileNotSpecified),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::BadCommandLineOptionParameter)) : @(SGFCMessageIDBadCommandLineOptionParameter),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::TooLargeBoardSizeCorrected)) : @(SGFCMessageIDTooLargeBoardSizeCorrected),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UsedFeatureNotDefinedInFileFormat)) : @(SGFCMessageIDUsedFeatureNotDefinedInFileFormat),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::ViewError)) : @(SGFCMessageIDViewError),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::DifferentGameTypes)) : @(SGFCMessageIDDifferentGameTypes),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::ValuesWithoutPropertyDeleted)) : @(SGFCMessageIDValuesWithoutPropertyDeleted),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::EmptyNodeDeleted)) : @(SGFCMessageIDEmptyNodeDeleted),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::VariationLevelNotCorrected)) : @(SGFCMessageIDVariationLevelNotCorrected),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::VariationLevelCorrected)) : @(SGFCMessageIDVariationLevelCorrected),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::ForbiddenMove)) : @(SGFCMessageIDForbiddenMove),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::IntegerKomiDeleted)) : @(SGFCMessageIDIntegerKomiDeleted),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::MoreThanOneGameTree)) : @(SGFCMessageIDMoreThanOneGameTree),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::HandicapDiffersFromSetup)) : @(SGFCMessageIDHandicapDiffersFromSetup),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SetupStonesOutsideRootNode)) : @(SGFCMessageIDSetupStonesOutsideRootNode),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::TwoMovesWithSameColor)) : @(SGFCMessageIDTwoMovesWithSameColor),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::VariationReorderFailed)) : @(SGFCMessageIDVariationReorderFailed),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::NewStylePassMove)) : @(SGFCMessageIDNewStylePassMove),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::NodeNotInVariation)) : @(SGFCMessageIDNodeNotInVariation),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::IllegalVariationStartCorrected)) : @(SGFCMessageIDIllegalVariationStartCorrected),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownLongCommandLineOption)) : @(SGFCMessageIDUnknownLongCommandLineOption),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownEncodingInArgument)) : @(SGFCMessageIDUnknownEncodingInArgument),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownIconvError)) : @(SGFCMessageIDUnknownIconvError),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::EncodingErrorsDetected)) : @(SGFCMessageIDEncodingErrorsDetected),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownEncodingInSgfContent)) : @(SGFCMessageIDUnknownEncodingInSgfContent),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::EncodingDetectionFailed)) : @(SGFCMessageIDEncodingDetectionFailed),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SgfContentHasDifferentEncodings)) : @(SGFCMessageIDSgfContentHasDifferentEncodings),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SgfContentHasDifferentEncodingsFatal)) : @(SGFCMessageIDSgfContentHasDifferentEncodingsFatal),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownSgfcMessageID)) : @(SGFCMessageIDUnknownSgfcMessageID),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::InvalidMessageID)) : @(SGFCMessageIDInvalidMessageID),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::ParseArgumentError)) : @(SGFCMessageIDParseArgumentError),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SaveSgfContentToFilesystemError)) : @(SGFCMessageIDSaveSgfContentToFilesystemError),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::ReadSgfContentFromFilesystemError)) : @(SGFCMessageIDReadSgfContentFromFilesystemError),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::DeleteFileError)) : @(SGFCMessageIDDeleteFileError),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::OutOfMemoryError)) : @(SGFCMessageIDOutOfMemoryError),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::ParseSgfContentError)) : @(SGFCMessageIDParseSgfContentError),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SGFCInterfacingError)) : @(SGFCMessageIDSGFCInterfacingError),
};

NSDictionary* messageIDFromSgfcKitMap =
@{
  @(SGFCMessageIDUnknownCommand) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownCommand)),
  @(SGFCMessageIDUnknownCommandLineOption) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownCommandLineOption)),
  @(SGFCMessageIDCouldNotOpenSourceFile) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::CouldNotOpenSourceFile)),
  @(SGFCMessageIDCouldNotReadSourceFile) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::CouldNotReadSourceFile)),
  @(SGFCMessageIDMemoryAllocationFailed) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::MemoryAllocationFailed)),
  @(SGFCMessageIDSgfDataBeforeGameTree) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SgfDataBeforeGameTree)),
  @(SGFCMessageIDNoSgfData) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::NoSgfData)),
  @(SGFCMessageIDIllegalCharacters) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::IllegalCharacters)),
  @(SGFCMessageIDVariationNestingIncomplete) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::VariationNestingIncomplete)),
  @(SGFCMessageIDUnexpectedEndOfFile) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnexpectedEndOfFile)),
  @(SGFCMessageIDPropertyIdentifierTooLong) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::PropertyIdentifierTooLong)),
  @(SGFCMessageIDEmptyVariationIgnored) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::EmptyVariationIgnored)),
  @(SGFCMessageIDSurplusValuesDeleted) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SurplusValuesDeleted)),
  @(SGFCMessageIDIllegalValueDeleted) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::IllegalValueDeleted)),
  @(SGFCMessageIDIllegalSingleValueCorrected) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::IllegalSingleValueCorrected)),
  @(SGFCMessageIDPropertyIdentifierWithLowercaseCharacter) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::PropertyIdentifierWithLowercaseCharacter)),
  @(SGFCMessageIDEmptyValueDeleted) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::EmptyValueDeleted)),
  @(SGFCMessageIDIllegalRootPropertyValue) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::IllegalRootPropertyValue)),
  @(SGFCMessageIDGameIsNotGo) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::GameIsNotGo)),
  @(SGFCMessageIDPropertyWithoutValuesIgnored) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::PropertyWithoutValuesIgnored)),
  @(SGFCMessageIDIllegalVariationStartIgnored) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::IllegalVariationStartIgnored)),
  @(SGFCMessageIDZeroByteDeleted) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::ZeroByteDeleted)),
  @(SGFCMessageIDNonComposedValueDeleted) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::NonComposedValueDeleted)),
  @(SGFCMessageIDMoveInRootNodeSplit) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::MoveInRootNodeSplit)),
  @(SGFCMessageIDIllegalComposedValueCorrected) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::IllegalComposedValueCorrected)),
  @(SGFCMessageIDCouldNotOpenDestinationFile) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::CouldNotOpenDestinationFile)),
  @(SGFCMessageIDCouldNotWriteDestinationFile) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::CouldNotWriteDestinationFile)),
  @(SGFCMessageIDDuplicatePropertyDeleted) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::DuplicatePropertyDeleted)),
  @(SGFCMessageIDRequestedPropertyDeleted) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::RequestedPropertyDeleted)),
  @(SGFCMessageIDMixedSetupAndMove) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::MixedSetupAndMove)),
  @(SGFCMessageIDLongPropertyIdentifier) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::LongPropertyIdentifier)),
  @(SGFCMessageIDRootPropertyDeleted) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::RootPropertyDeleted)),
  @(SGFCMessageIDGameInfoPropertyWithIllegalFormat) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::GameInfoPropertyWithIllegalFormat)),
  @(SGFCMessageIDNotSavedBecauseOfCriticalErrors) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::NotSavedBecauseOfCriticalErrors)),
  @(SGFCMessageIDUnknownPropertyDeleted) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownPropertyDeleted)),
  @(SGFCMessageIDMissingSemicolonAtGameTreeStart) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::MissingSemicolonAtGameTreeStart)),
  @(SGFCMessageIDBlackAndWhiteMoveSplit) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::BlackAndWhiteMoveSplit)),
  @(SGFCMessageIDPositionNotUnique) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::PositionNotUnique)),
  @(SGFCMessageIDAddStoneDeleted) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::AddStoneDeleted)),
  @(SGFCMessageIDPropertyNotDefinedInFF) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::PropertyNotDefinedInFF)),
  @(SGFCMessageIDContradictingAnnotationDeleted) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::ContradictingAnnotationDeleted)),
  @(SGFCMessageIDCombinationOfPropertiesConverted) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::CombinationOfPropertiesConverted)),
  @(SGFCMessageIDMoveAnnotationDeleted) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::MoveAnnotationDeleted)),
  @(SGFCMessageIDGameInfoDeleted) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::GameInfoDeleted)),
  @(SGFCMessageIDDifferentFileFormats) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::DifferentFileFormats)),
  @(SGFCMessageIDUnknownFileFormat) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownFileFormat)),
  @(SGFCMessageIDSquareBoardSizeCorrected) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SquareBoardSizeCorrected)),
  @(SGFCMessageIDSourceFileNotSpecified) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SourceFileNotSpecified)),
  @(SGFCMessageIDBadCommandLineOptionParameter) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::BadCommandLineOptionParameter)),
  @(SGFCMessageIDTooLargeBoardSizeCorrected) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::TooLargeBoardSizeCorrected)),
  @(SGFCMessageIDUsedFeatureNotDefinedInFileFormat) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UsedFeatureNotDefinedInFileFormat)),
  @(SGFCMessageIDViewError) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::ViewError)),
  @(SGFCMessageIDDifferentGameTypes) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::DifferentGameTypes)),
  @(SGFCMessageIDValuesWithoutPropertyDeleted) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::ValuesWithoutPropertyDeleted)),
  @(SGFCMessageIDEmptyNodeDeleted) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::EmptyNodeDeleted)),
  @(SGFCMessageIDVariationLevelNotCorrected) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::VariationLevelNotCorrected)),
  @(SGFCMessageIDVariationLevelCorrected) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::VariationLevelCorrected)),
  @(SGFCMessageIDForbiddenMove) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::ForbiddenMove)),
  @(SGFCMessageIDIntegerKomiDeleted) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::IntegerKomiDeleted)),
  @(SGFCMessageIDMoreThanOneGameTree) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::MoreThanOneGameTree)),
  @(SGFCMessageIDHandicapDiffersFromSetup) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::HandicapDiffersFromSetup)),
  @(SGFCMessageIDSetupStonesOutsideRootNode) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SetupStonesOutsideRootNode)),
  @(SGFCMessageIDTwoMovesWithSameColor) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::TwoMovesWithSameColor)),
  @(SGFCMessageIDVariationReorderFailed) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::VariationReorderFailed)),
  @(SGFCMessageIDNewStylePassMove) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::NewStylePassMove)),
  @(SGFCMessageIDNodeNotInVariation) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::NodeNotInVariation)),
  @(SGFCMessageIDIllegalVariationStartCorrected) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::IllegalVariationStartCorrected)),
  @(SGFCMessageIDUnknownLongCommandLineOption) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownLongCommandLineOption)),
  @(SGFCMessageIDUnknownEncodingInArgument) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownEncodingInArgument)),
  @(SGFCMessageIDUnknownIconvError) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownIconvError)),
  @(SGFCMessageIDEncodingErrorsDetected) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::EncodingErrorsDetected)),
  @(SGFCMessageIDUnknownEncodingInSgfContent) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownEncodingInSgfContent)),
  @(SGFCMessageIDEncodingDetectionFailed) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::EncodingDetectionFailed)),
  @(SGFCMessageIDSgfContentHasDifferentEncodings) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SgfContentHasDifferentEncodings)),
  @(SGFCMessageIDSgfContentHasDifferentEncodingsFatal) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SgfContentHasDifferentEncodingsFatal)),
  @(SGFCMessageIDUnknownSgfcMessageID) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::UnknownSgfcMessageID)),
  @(SGFCMessageIDInvalidMessageID) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::InvalidMessageID)),
  @(SGFCMessageIDParseArgumentError) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::ParseArgumentError)),
  @(SGFCMessageIDSaveSgfContentToFilesystemError) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SaveSgfContentToFilesystemError)),
  @(SGFCMessageIDReadSgfContentFromFilesystemError) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::ReadSgfContentFromFilesystemError)),
  @(SGFCMessageIDDeleteFileError) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::DeleteFileError)),
  @(SGFCMessageIDOutOfMemoryError) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::OutOfMemoryError)),
  @(SGFCMessageIDParseSgfContentError) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::ParseSgfContentError)),
  @(SGFCMessageIDSGFCInterfacingError) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageID::SGFCInterfacingError)),
};

NSDictionary* messageTypeToSgfcKitMap =
@{
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageType::Warning)) : @(SGFCMessageTypeWarning),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageType::Error)) : @(SGFCMessageTypeError),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageType::FatalError)) : @(SGFCMessageTypeFatalError),
};

NSDictionary* messageTypeFromSgfcKitMap =
@{
  @(SGFCMessageTypeWarning) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageType::Warning)),
  @(SGFCMessageTypeError) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageType::Error)),
  @(SGFCMessageTypeFatalError) : @(static_cast<int>(LibSgfcPlusPlus::SgfcMessageType::FatalError)),
};

NSDictionary* nodeTraitToSgfcKitMap =
@{
  @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::Root)) : @(SGFCNodeTraitRoot),
  @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::GameInfo)) : @(SGFCNodeTraitGameInfo),
  @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::Move)) : @(SGFCNodeTraitMove),
  @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::Setup)) : @(SGFCNodeTraitSetup),
  @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::NodeAnnotation)) : @(SGFCNodeTraitNodeAnnotation),
  @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::MoveAnnotation)) : @(SGFCNodeTraitMoveAnnotation),
  @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::Markup)) : @(SGFCNodeTraitMarkup),
  @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::Timing)) : @(SGFCNodeTraitTiming),
  @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::Inheritable)) : @(SGFCNodeTraitInheritable),
};

NSDictionary* nodeTraitFromSgfcKitMap =
@{
  @(SGFCNodeTraitRoot) : @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::Root)),
  @(SGFCNodeTraitGameInfo) : @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::GameInfo)),
  @(SGFCNodeTraitMove) : @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::Move)),
  @(SGFCNodeTraitSetup) : @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::Setup)),
  @(SGFCNodeTraitNodeAnnotation) : @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::NodeAnnotation)),
  @(SGFCNodeTraitMoveAnnotation) : @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::MoveAnnotation)),
  @(SGFCNodeTraitMarkup) : @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::Markup)),
  @(SGFCNodeTraitTiming) : @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::Timing)),
  @(SGFCNodeTraitInheritable) : @(static_cast<LibSgfcPlusPlus::SgfcNodeTraits>(LibSgfcPlusPlus::SgfcNodeTrait::Inheritable)),
};

NSDictionary* propertyCategoryToSgfcKitMap =
@{
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::Root)) : @(SGFCPropertyCategoryRoot),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::GameInfo)) : @(SGFCPropertyCategoryGameInfo),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::Move)) : @(SGFCPropertyCategoryMove),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::Setup)) : @(SGFCPropertyCategorySetup),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::NodeAnnotation)) : @(SGFCPropertyCategoryNodeAnnotation),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::MoveAnnotation)) : @(SGFCPropertyCategoryMoveAnnotation),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::Markup)) : @(SGFCPropertyCategoryMarkup),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::Timing)) : @(SGFCPropertyCategoryTiming),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::Miscellaneous)) : @(SGFCPropertyCategoryMiscellaneous),
};

NSDictionary* propertyCategoryFromSgfcKitMap =
@{
  @(SGFCPropertyCategoryRoot) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::Root)),
  @(SGFCPropertyCategoryGameInfo) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::GameInfo)),
  @(SGFCPropertyCategoryMove) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::Move)),
  @(SGFCPropertyCategorySetup) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::Setup)),
  @(SGFCPropertyCategoryNodeAnnotation) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::NodeAnnotation)),
  @(SGFCPropertyCategoryMoveAnnotation) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::MoveAnnotation)),
  @(SGFCPropertyCategoryMarkup) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::Markup)),
  @(SGFCPropertyCategoryTiming) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::Timing)),
  @(SGFCPropertyCategoryMiscellaneous) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyCategory::Miscellaneous)),
};

NSDictionary* propertyTraitToSgfcKitMap =
@{
  @(static_cast<LibSgfcPlusPlus::SgfcPropertyTraits>(LibSgfcPlusPlus::SgfcPropertyTrait::Inheritable)) : @(SGFCPropertyTraitInheritable),
};

NSDictionary* propertyTraitFromSgfcKitMap =
@{
  @(SGFCPropertyTraitInheritable) : @(static_cast<LibSgfcPlusPlus::SgfcPropertyTraits>(LibSgfcPlusPlus::SgfcPropertyTrait::Inheritable)),
};

NSDictionary* propertyTypeToSgfcKitMap =
@{
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::B)) : @(SGFCPropertyTypeB),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::KO)) : @(SGFCPropertyTypeKO),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::MN)) : @(SGFCPropertyTypeMN),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::W)) : @(SGFCPropertyTypeW),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::AB)) : @(SGFCPropertyTypeAB),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::AE)) : @(SGFCPropertyTypeAE),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::AW)) : @(SGFCPropertyTypeAW),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::PL)) : @(SGFCPropertyTypePL),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::C)) : @(SGFCPropertyTypeC),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::DM)) : @(SGFCPropertyTypeDM),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::GB)) : @(SGFCPropertyTypeGB),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::GW)) : @(SGFCPropertyTypeGW),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::HO)) : @(SGFCPropertyTypeHO),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::N)) : @(SGFCPropertyTypeN),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::UC)) : @(SGFCPropertyTypeUC),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::V)) : @(SGFCPropertyTypeV),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::BM)) : @(SGFCPropertyTypeBM),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::DO)) : @(SGFCPropertyTypeDO),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::IT)) : @(SGFCPropertyTypeIT),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::TE)) : @(SGFCPropertyTypeTE),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::AR)) : @(SGFCPropertyTypeAR),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::CR)) : @(SGFCPropertyTypeCR),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::DD)) : @(SGFCPropertyTypeDD),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::LB)) : @(SGFCPropertyTypeLB),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::LN)) : @(SGFCPropertyTypeLN),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::MA)) : @(SGFCPropertyTypeMA),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::SL)) : @(SGFCPropertyTypeSL),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::SQ)) : @(SGFCPropertyTypeSQ),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::TR)) : @(SGFCPropertyTypeTR),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::AP)) : @(SGFCPropertyTypeAP),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::CA)) : @(SGFCPropertyTypeCA),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::FF)) : @(SGFCPropertyTypeFF),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::GM)) : @(SGFCPropertyTypeGM),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::ST)) : @(SGFCPropertyTypeST),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::SZ)) : @(SGFCPropertyTypeSZ),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::AN)) : @(SGFCPropertyTypeAN),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::BR)) : @(SGFCPropertyTypeBR),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::BT)) : @(SGFCPropertyTypeBT),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::CP)) : @(SGFCPropertyTypeCP),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::DT)) : @(SGFCPropertyTypeDT),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::EV)) : @(SGFCPropertyTypeEV),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::GN)) : @(SGFCPropertyTypeGN),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::GC)) : @(SGFCPropertyTypeGC),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::ON)) : @(SGFCPropertyTypeON),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::OT)) : @(SGFCPropertyTypeOT),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::PB)) : @(SGFCPropertyTypePB),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::PC)) : @(SGFCPropertyTypePC),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::PW)) : @(SGFCPropertyTypePW),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::RE)) : @(SGFCPropertyTypeRE),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::RO)) : @(SGFCPropertyTypeRO),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::RU)) : @(SGFCPropertyTypeRU),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::SO)) : @(SGFCPropertyTypeSO),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::TM)) : @(SGFCPropertyTypeTM),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::US)) : @(SGFCPropertyTypeUS),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::WR)) : @(SGFCPropertyTypeWR),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::WT)) : @(SGFCPropertyTypeWT),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::BL)) : @(SGFCPropertyTypeBL),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::OB)) : @(SGFCPropertyTypeOB),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::OW)) : @(SGFCPropertyTypeOW),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::WL)) : @(SGFCPropertyTypeWL),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::FG)) : @(SGFCPropertyTypeFG),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::PM)) : @(SGFCPropertyTypePM),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::VW)) : @(SGFCPropertyTypeVW),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::BS)) : @(SGFCPropertyTypeBS),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::CH)) : @(SGFCPropertyTypeCH),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::EL)) : @(SGFCPropertyTypeEL),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::EX)) : @(SGFCPropertyTypeEX),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::ID)) : @(SGFCPropertyTypeID),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::L)) : @(SGFCPropertyTypeL),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::LT)) : @(SGFCPropertyTypeLT),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::M)) : @(SGFCPropertyTypeM),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::OM)) : @(SGFCPropertyTypeOM),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::OP)) : @(SGFCPropertyTypeOP),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::OV)) : @(SGFCPropertyTypeOV),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::RG)) : @(SGFCPropertyTypeRG),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::SC)) : @(SGFCPropertyTypeSC),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::SE)) : @(SGFCPropertyTypeSE),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::SI)) : @(SGFCPropertyTypeSI),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::TC)) : @(SGFCPropertyTypeTC),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::WS)) : @(SGFCPropertyTypeWS),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::HA)) : @(SGFCPropertyTypeHA),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::KM)) : @(SGFCPropertyTypeKM),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::TB)) : @(SGFCPropertyTypeTB),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::TW)) : @(SGFCPropertyTypeTW),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::Unknown)) : @(SGFCPropertyTypeUnknown),
};

NSDictionary* propertyTypeFromSgfcKitMap =
@{
  @(SGFCPropertyTypeB) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::B)),
  @(SGFCPropertyTypeKO) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::KO)),
  @(SGFCPropertyTypeMN) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::MN)),
  @(SGFCPropertyTypeW) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::W)),
  @(SGFCPropertyTypeAB) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::AB)),
  @(SGFCPropertyTypeAE) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::AE)),
  @(SGFCPropertyTypeAW) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::AW)),
  @(SGFCPropertyTypePL) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::PL)),
  @(SGFCPropertyTypeC) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::C)),
  @(SGFCPropertyTypeDM) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::DM)),
  @(SGFCPropertyTypeGB) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::GB)),
  @(SGFCPropertyTypeGW) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::GW)),
  @(SGFCPropertyTypeHO) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::HO)),
  @(SGFCPropertyTypeN) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::N)),
  @(SGFCPropertyTypeUC) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::UC)),
  @(SGFCPropertyTypeV) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::V)),
  @(SGFCPropertyTypeBM) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::BM)),
  @(SGFCPropertyTypeDO) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::DO)),
  @(SGFCPropertyTypeIT) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::IT)),
  @(SGFCPropertyTypeTE) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::TE)),
  @(SGFCPropertyTypeAR) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::AR)),
  @(SGFCPropertyTypeCR) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::CR)),
  @(SGFCPropertyTypeDD) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::DD)),
  @(SGFCPropertyTypeLB) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::LB)),
  @(SGFCPropertyTypeLN) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::LN)),
  @(SGFCPropertyTypeMA) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::MA)),
  @(SGFCPropertyTypeSL) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::SL)),
  @(SGFCPropertyTypeSQ) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::SQ)),
  @(SGFCPropertyTypeTR) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::TR)),
  @(SGFCPropertyTypeAP) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::AP)),
  @(SGFCPropertyTypeCA) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::CA)),
  @(SGFCPropertyTypeFF) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::FF)),
  @(SGFCPropertyTypeGM) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::GM)),
  @(SGFCPropertyTypeST) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::ST)),
  @(SGFCPropertyTypeSZ) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::SZ)),
  @(SGFCPropertyTypeAN) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::AN)),
  @(SGFCPropertyTypeBR) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::BR)),
  @(SGFCPropertyTypeBT) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::BT)),
  @(SGFCPropertyTypeCP) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::CP)),
  @(SGFCPropertyTypeDT) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::DT)),
  @(SGFCPropertyTypeEV) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::EV)),
  @(SGFCPropertyTypeGN) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::GN)),
  @(SGFCPropertyTypeGC) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::GC)),
  @(SGFCPropertyTypeON) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::ON)),
  @(SGFCPropertyTypeOT) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::OT)),
  @(SGFCPropertyTypePB) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::PB)),
  @(SGFCPropertyTypePC) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::PC)),
  @(SGFCPropertyTypePW) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::PW)),
  @(SGFCPropertyTypeRE) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::RE)),
  @(SGFCPropertyTypeRO) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::RO)),
  @(SGFCPropertyTypeRU) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::RU)),
  @(SGFCPropertyTypeSO) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::SO)),
  @(SGFCPropertyTypeTM) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::TM)),
  @(SGFCPropertyTypeUS) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::US)),
  @(SGFCPropertyTypeWR) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::WR)),
  @(SGFCPropertyTypeWT) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::WT)),
  @(SGFCPropertyTypeBL) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::BL)),
  @(SGFCPropertyTypeOB) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::OB)),
  @(SGFCPropertyTypeOW) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::OW)),
  @(SGFCPropertyTypeWL) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::WL)),
  @(SGFCPropertyTypeFG) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::FG)),
  @(SGFCPropertyTypePM) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::PM)),
  @(SGFCPropertyTypeVW) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::VW)),
  @(SGFCPropertyTypeBS) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::BS)),
  @(SGFCPropertyTypeCH) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::CH)),
  @(SGFCPropertyTypeEL) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::EL)),
  @(SGFCPropertyTypeEX) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::EX)),
  @(SGFCPropertyTypeID) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::ID)),
  @(SGFCPropertyTypeL) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::L)),
  @(SGFCPropertyTypeLT) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::LT)),
  @(SGFCPropertyTypeM) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::M)),
  @(SGFCPropertyTypeOM) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::OM)),
  @(SGFCPropertyTypeOP) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::OP)),
  @(SGFCPropertyTypeOV) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::OV)),
  @(SGFCPropertyTypeRG) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::RG)),
  @(SGFCPropertyTypeSC) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::SC)),
  @(SGFCPropertyTypeSE) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::SE)),
  @(SGFCPropertyTypeSI) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::SI)),
  @(SGFCPropertyTypeTC) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::TC)),
  @(SGFCPropertyTypeWS) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::WS)),
  @(SGFCPropertyTypeHA) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::HA)),
  @(SGFCPropertyTypeKM) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::KM)),
  @(SGFCPropertyTypeTB) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::TB)),
  @(SGFCPropertyTypeTW) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::TW)),
  @(SGFCPropertyTypeUnknown) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyType::Unknown)),
};

NSDictionary* propertyValueTypeToSgfcKitMap =
@{
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::None)) : @(SGFCPropertyValueTypeNone),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Number)) : @(SGFCPropertyValueTypeNumber),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Real)) : @(SGFCPropertyValueTypeReal),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Double)) : @(SGFCPropertyValueTypeDouble),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Color)) : @(SGFCPropertyValueTypeColor),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::SimpleText)) : @(SGFCPropertyValueTypeSimpleText),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Text)) : @(SGFCPropertyValueTypeText),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Point)) : @(SGFCPropertyValueTypePoint),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Move)) : @(SGFCPropertyValueTypeMove),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Stone)) : @(SGFCPropertyValueTypeStone),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Unknown)) : @(SGFCPropertyValueTypeUnknown),
};

NSDictionary* propertyValueTypeFromSgfcKitMap =
@{
  @(SGFCPropertyValueTypeNone) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::None)),
  @(SGFCPropertyValueTypeNumber) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Number)),
  @(SGFCPropertyValueTypeReal) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Real)),
  @(SGFCPropertyValueTypeDouble) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Double)),
  @(SGFCPropertyValueTypeColor) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Color)),
  @(SGFCPropertyValueTypeSimpleText) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::SimpleText)),
  @(SGFCPropertyValueTypeText) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Text)),
  @(SGFCPropertyValueTypePoint) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Point)),
  @(SGFCPropertyValueTypeMove) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Move)),
  @(SGFCPropertyValueTypeStone) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Stone)),
  @(SGFCPropertyValueTypeUnknown) : @(static_cast<int>(LibSgfcPlusPlus::SgfcPropertyValueType::Unknown)),
};

NSDictionary* winTypeToSgfcKitMap =
@{
  @(static_cast<int>(LibSgfcPlusPlus::SgfcWinType::WinWithScore)) : @(SGFCWinTypeWinWithScore),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcWinType::WinWithoutScore)) : @(SGFCWinTypeWinWithoutScore),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcWinType::WinByResignation)) : @(SGFCWinTypeWinByResignation),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcWinType::WinOnTime)) : @(SGFCWinTypeWinOnTime),
  @(static_cast<int>(LibSgfcPlusPlus::SgfcWinType::WinByForfeit)) : @(SGFCWinTypeWinByForfeit),
};

NSDictionary* winTypeFromSgfcKitMap =
@{
  @(SGFCWinTypeWinWithScore) : @(static_cast<int>(LibSgfcPlusPlus::SgfcWinType::WinWithScore)),
  @(SGFCWinTypeWinWithoutScore) : @(static_cast<int>(LibSgfcPlusPlus::SgfcWinType::WinWithoutScore)),
  @(SGFCWinTypeWinByResignation) : @(static_cast<int>(LibSgfcPlusPlus::SgfcWinType::WinByResignation)),
  @(SGFCWinTypeWinOnTime) : @(static_cast<int>(LibSgfcPlusPlus::SgfcWinType::WinOnTime)),
  @(SGFCWinTypeWinByForfeit) : @(static_cast<int>(LibSgfcPlusPlus::SgfcWinType::WinByForfeit)),
};
