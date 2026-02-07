// -----------------------------------------------------------------------------
// Copyright 2024-2026 Patrick Näf (herzbube@herzbube.ch)
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
#import "../include/SGFCConstants.h"
#import "../include/SGFCPropertyCategory.h"
#import "../include/SGFCPropertyType.h"

// C++ Standard Library includes
#include <limits>

// System includes
#import <Foundation/NSString.h>

NSString* SGFCLibraryName = @"SgfcKit";
NSString* SGFCLibraryVersion = @"3.0.0";
NSString* SGFCSgfcVersion = @"2.2";

SGFCTextOffset SGFCInvalidLineNumber = 0;
SGFCTextOffset SGFCInvalidColumnNumber = 0;
const int SGFCLibraryErrorNumberNoError = 0;

NSString* SGFCNoneValueString = @"";
NSString* SGFCDoubleNormalString = @"1";
NSString* SGFCDoubleEmphasizedString = @"2";
NSString* SGFCColorBlackString = @"B";
NSString* SGFCColorWhiteString = @"W";
NSString* SGFCGoMovePassString = @"";

NSString* SGFCGoRulesetAGA = @"AGA";
NSString* SGFCGoRulesetIng = @"GOE";
NSString* SGFCGoRulesetJapanese = @"Japanese";
NSString* SGFCGoRulesetNZ = @"NZ";

NSDictionary* SGFCPropertyNameToPropertyTypeMap =
@{
  // Standard properties from FF4
  @"B" : @(SGFCPropertyTypeB),
  @"KO" : @(SGFCPropertyTypeKO),
  @"MN" : @(SGFCPropertyTypeMN),
  @"W" : @(SGFCPropertyTypeW),
  @"AB" : @(SGFCPropertyTypeAB),
  @"AE" : @(SGFCPropertyTypeAE),
  @"AW" : @(SGFCPropertyTypeAW),
  @"PL" : @(SGFCPropertyTypePL),
  @"C" : @(SGFCPropertyTypeC),
  @"DM" : @(SGFCPropertyTypeDM),
  @"GB" : @(SGFCPropertyTypeGB),
  @"GW" : @(SGFCPropertyTypeGW),
  @"HO" : @(SGFCPropertyTypeHO),
  @"N" : @(SGFCPropertyTypeN),
  @"UC" : @(SGFCPropertyTypeUC),
  @"V" : @(SGFCPropertyTypeV),
  @"BM" : @(SGFCPropertyTypeBM),
  @"DO" : @(SGFCPropertyTypeDO),
  @"IT" : @(SGFCPropertyTypeIT),
  @"TE" : @(SGFCPropertyTypeTE),
  @"AR" : @(SGFCPropertyTypeAR),
  @"CR" : @(SGFCPropertyTypeCR),
  @"DD" : @(SGFCPropertyTypeDD),
  @"LB" : @(SGFCPropertyTypeLB),
  @"LN" : @(SGFCPropertyTypeLN),
  @"MA" : @(SGFCPropertyTypeMA),
  @"SL" : @(SGFCPropertyTypeSL),
  @"SQ" : @(SGFCPropertyTypeSQ),
  @"TR" : @(SGFCPropertyTypeTR),
  @"AP" : @(SGFCPropertyTypeAP),
  @"CA" : @(SGFCPropertyTypeCA),
  @"FF" : @(SGFCPropertyTypeFF),
  @"GM" : @(SGFCPropertyTypeGM),
  @"ST" : @(SGFCPropertyTypeST),
  @"SZ" : @(SGFCPropertyTypeSZ),
  @"AN" : @(SGFCPropertyTypeAN),
  @"BR" : @(SGFCPropertyTypeBR),
  @"BT" : @(SGFCPropertyTypeBT),
  @"CP" : @(SGFCPropertyTypeCP),
  @"DT" : @(SGFCPropertyTypeDT),
  @"EV" : @(SGFCPropertyTypeEV),
  @"GN" : @(SGFCPropertyTypeGN),
  @"GC" : @(SGFCPropertyTypeGC),
  @"ON" : @(SGFCPropertyTypeON),
  @"OT" : @(SGFCPropertyTypeOT),
  @"PB" : @(SGFCPropertyTypePB),
  @"PC" : @(SGFCPropertyTypePC),
  @"PW" : @(SGFCPropertyTypePW),
  @"RE" : @(SGFCPropertyTypeRE),
  @"RO" : @(SGFCPropertyTypeRO),
  @"RU" : @(SGFCPropertyTypeRU),
  @"SO" : @(SGFCPropertyTypeSO),
  @"TM" : @(SGFCPropertyTypeTM),
  @"US" : @(SGFCPropertyTypeUS),
  @"WR" : @(SGFCPropertyTypeWR),
  @"WT" : @(SGFCPropertyTypeWT),
  @"BL" : @(SGFCPropertyTypeBL),
  @"OB" : @(SGFCPropertyTypeOB),
  @"OW" : @(SGFCPropertyTypeOW),
  @"WL" : @(SGFCPropertyTypeWL),
  @"FG" : @(SGFCPropertyTypeFG),
  @"PM" : @(SGFCPropertyTypePM),

  // Standard properties from FF1-3
  @"VW" : @(SGFCPropertyTypeVW),
  @"BS" : @(SGFCPropertyTypeBS),
  @"CH" : @(SGFCPropertyTypeCH),
  @"EL" : @(SGFCPropertyTypeEL),
  @"EX" : @(SGFCPropertyTypeEX),
  @"ID" : @(SGFCPropertyTypeID),
  @"L" : @(SGFCPropertyTypeL),
  @"LT" : @(SGFCPropertyTypeLT),
  @"M" : @(SGFCPropertyTypeM),
  @"OM" : @(SGFCPropertyTypeOM),
  @"OP" : @(SGFCPropertyTypeOP),
  @"OV" : @(SGFCPropertyTypeOV),
  @"RG" : @(SGFCPropertyTypeRG),
  @"SC" : @(SGFCPropertyTypeSC),
  @"SE" : @(SGFCPropertyTypeSE),
  @"SI" : @(SGFCPropertyTypeSI),
  @"TC" : @(SGFCPropertyTypeTC),
  @"WS" : @(SGFCPropertyTypeWS),

  // Game of Go properties
  @"HA" : @(SGFCPropertyTypeHA),
  @"KM" : @(SGFCPropertyTypeKM),
  @"TB" : @(SGFCPropertyTypeTB),
  @"TW" : @(SGFCPropertyTypeTW),
};

NSDictionary* SGFCPropertyTypeToPropertyNameMap =
@{
  // Standard properties from FF4
  @(SGFCPropertyTypeB) : @"B",
  @(SGFCPropertyTypeKO) : @"KO",
  @(SGFCPropertyTypeMN) : @"MN",
  @(SGFCPropertyTypeW) : @"W",
  @(SGFCPropertyTypeAB) : @"AB",
  @(SGFCPropertyTypeAE) : @"AE",
  @(SGFCPropertyTypeAW) : @"AW",
  @(SGFCPropertyTypePL) : @"PL",
  @(SGFCPropertyTypeC) : @"C",
  @(SGFCPropertyTypeDM) : @"DM",
  @(SGFCPropertyTypeGB) : @"GB",
  @(SGFCPropertyTypeGW) : @"GW",
  @(SGFCPropertyTypeHO) : @"HO",
  @(SGFCPropertyTypeN) : @"N",
  @(SGFCPropertyTypeUC) : @"UC",
  @(SGFCPropertyTypeV) : @"V",
  @(SGFCPropertyTypeBM) : @"BM",
  @(SGFCPropertyTypeDO) : @"DO",
  @(SGFCPropertyTypeIT) : @"IT",
  @(SGFCPropertyTypeTE) : @"TE",
  @(SGFCPropertyTypeAR) : @"AR",
  @(SGFCPropertyTypeCR) : @"CR",
  @(SGFCPropertyTypeDD) : @"DD",
  @(SGFCPropertyTypeLB) : @"LB",
  @(SGFCPropertyTypeLN) : @"LN",
  @(SGFCPropertyTypeMA) : @"MA",
  @(SGFCPropertyTypeSL) : @"SL",
  @(SGFCPropertyTypeSQ) : @"SQ",
  @(SGFCPropertyTypeTR) : @"TR",
  @(SGFCPropertyTypeAP) : @"AP",
  @(SGFCPropertyTypeCA) : @"CA",
  @(SGFCPropertyTypeFF) : @"FF",
  @(SGFCPropertyTypeGM) : @"GM",
  @(SGFCPropertyTypeST) : @"ST",
  @(SGFCPropertyTypeSZ) : @"SZ",
  @(SGFCPropertyTypeAN) : @"AN",
  @(SGFCPropertyTypeBR) : @"BR",
  @(SGFCPropertyTypeBT) : @"BT",
  @(SGFCPropertyTypeCP) : @"CP",
  @(SGFCPropertyTypeDT) : @"DT",
  @(SGFCPropertyTypeEV) : @"EV",
  @(SGFCPropertyTypeGN) : @"GN",
  @(SGFCPropertyTypeGC) : @"GC",
  @(SGFCPropertyTypeON) : @"ON",
  @(SGFCPropertyTypeOT) : @"OT",
  @(SGFCPropertyTypePB) : @"PB",
  @(SGFCPropertyTypePC) : @"PC",
  @(SGFCPropertyTypePW) : @"PW",
  @(SGFCPropertyTypeRE) : @"RE",
  @(SGFCPropertyTypeRO) : @"RO",
  @(SGFCPropertyTypeRU) : @"RU",
  @(SGFCPropertyTypeSO) : @"SO",
  @(SGFCPropertyTypeTM) : @"TM",
  @(SGFCPropertyTypeUS) : @"US",
  @(SGFCPropertyTypeWR) : @"WR",
  @(SGFCPropertyTypeWT) : @"WT",
  @(SGFCPropertyTypeBL) : @"BL",
  @(SGFCPropertyTypeOB) : @"OB",
  @(SGFCPropertyTypeOW) : @"OW",
  @(SGFCPropertyTypeWL) : @"WL",
  @(SGFCPropertyTypeFG) : @"FG",
  @(SGFCPropertyTypePM) : @"PM",
  @(SGFCPropertyTypeVW) : @"VW",

  // Standard properties from FF1-3
  @(SGFCPropertyTypeBS) : @"BS",
  @(SGFCPropertyTypeCH) : @"CH",
  @(SGFCPropertyTypeEL) : @"EL",
  @(SGFCPropertyTypeEX) : @"EX",
  @(SGFCPropertyTypeID) : @"ID",
  @(SGFCPropertyTypeL) : @"L",
  @(SGFCPropertyTypeLT) : @"LT",
  @(SGFCPropertyTypeM) : @"M",
  @(SGFCPropertyTypeOM) : @"OM",
  @(SGFCPropertyTypeOP) : @"OP",
  @(SGFCPropertyTypeOV) : @"OV",
  @(SGFCPropertyTypeRG) : @"RG",
  @(SGFCPropertyTypeSC) : @"SC",
  @(SGFCPropertyTypeSE) : @"SE",
  @(SGFCPropertyTypeSI) : @"SI",
  @(SGFCPropertyTypeTC) : @"TC",
  @(SGFCPropertyTypeWS) : @"WS",

  // Game of Go properties
  @(SGFCPropertyTypeHA) : @"HA",
  @(SGFCPropertyTypeKM) : @"KM",
  @(SGFCPropertyTypeTB) : @"TB",
  @(SGFCPropertyTypeTW) : @"TW",
};

NSDictionary* SGFCPropertyTypeToPropertyCategoryMap =
@{
  // Standard properties from FF4
  @(SGFCPropertyTypeB) : @(SGFCPropertyCategoryMove),
  @(SGFCPropertyTypeKO) : @(SGFCPropertyCategoryMove),
  @(SGFCPropertyTypeMN) : @(SGFCPropertyCategoryMove),
  @(SGFCPropertyTypeW) : @(SGFCPropertyCategoryMove),
  @(SGFCPropertyTypeAB) : @(SGFCPropertyCategorySetup),
  @(SGFCPropertyTypeAE) : @(SGFCPropertyCategorySetup),
  @(SGFCPropertyTypeAW) : @(SGFCPropertyCategorySetup),
  @(SGFCPropertyTypePL) : @(SGFCPropertyCategorySetup),
  @(SGFCPropertyTypeC) : @(SGFCPropertyCategoryNodeAnnotation),
  @(SGFCPropertyTypeDM) : @(SGFCPropertyCategoryNodeAnnotation),
  @(SGFCPropertyTypeGB) : @(SGFCPropertyCategoryNodeAnnotation),
  @(SGFCPropertyTypeGW) : @(SGFCPropertyCategoryNodeAnnotation),
  @(SGFCPropertyTypeHO) : @(SGFCPropertyCategoryNodeAnnotation),
  @(SGFCPropertyTypeN) : @(SGFCPropertyCategoryNodeAnnotation),
  @(SGFCPropertyTypeUC) : @(SGFCPropertyCategoryNodeAnnotation),
  @(SGFCPropertyTypeV) : @(SGFCPropertyCategoryNodeAnnotation),
  @(SGFCPropertyTypeBM) : @(SGFCPropertyCategoryMoveAnnotation),
  @(SGFCPropertyTypeDO) : @(SGFCPropertyCategoryMoveAnnotation),
  @(SGFCPropertyTypeIT) : @(SGFCPropertyCategoryMoveAnnotation),
  @(SGFCPropertyTypeTE) : @(SGFCPropertyCategoryMoveAnnotation),
  @(SGFCPropertyTypeAR) : @(SGFCPropertyCategoryMarkup),
  @(SGFCPropertyTypeCR) : @(SGFCPropertyCategoryMarkup),
  @(SGFCPropertyTypeDD) : @(SGFCPropertyCategoryMarkup),
  @(SGFCPropertyTypeLB) : @(SGFCPropertyCategoryMarkup),
  @(SGFCPropertyTypeLN) : @(SGFCPropertyCategoryMarkup),
  @(SGFCPropertyTypeMA) : @(SGFCPropertyCategoryMarkup),
  @(SGFCPropertyTypeSL) : @(SGFCPropertyCategoryMarkup),
  @(SGFCPropertyTypeSQ) : @(SGFCPropertyCategoryMarkup),
  @(SGFCPropertyTypeTR) : @(SGFCPropertyCategoryMarkup),
  @(SGFCPropertyTypeAP) : @(SGFCPropertyCategoryRoot),
  @(SGFCPropertyTypeCA) : @(SGFCPropertyCategoryRoot),
  @(SGFCPropertyTypeFF) : @(SGFCPropertyCategoryRoot),
  @(SGFCPropertyTypeGM) : @(SGFCPropertyCategoryRoot),
  @(SGFCPropertyTypeST) : @(SGFCPropertyCategoryRoot),
  @(SGFCPropertyTypeSZ) : @(SGFCPropertyCategoryRoot),
  @(SGFCPropertyTypeAN) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeBR) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeBT) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeCP) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeDT) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeEV) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeGN) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeGC) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeON) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeOT) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypePB) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypePC) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypePW) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeRE) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeRO) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeRU) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeSO) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeTM) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeUS) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeWR) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeWT) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeBL) : @(SGFCPropertyCategoryTiming),
  @(SGFCPropertyTypeOB) : @(SGFCPropertyCategoryTiming),
  @(SGFCPropertyTypeOW) : @(SGFCPropertyCategoryTiming),
  @(SGFCPropertyTypeWL) : @(SGFCPropertyCategoryTiming),
  @(SGFCPropertyTypeFG) : @(SGFCPropertyCategoryMiscellaneous),
  @(SGFCPropertyTypePM) : @(SGFCPropertyCategoryMiscellaneous),
  @(SGFCPropertyTypeVW) : @(SGFCPropertyCategoryMiscellaneous),

  // Standard properties from FF1-3                              // Index page       FF3 specs page    FF1 specs page
  @(SGFCPropertyTypeBS) : @(SGFCPropertyCategoryGameInfo),       // GameInfo         Root              Root
  @(SGFCPropertyTypeCH) : @(SGFCPropertyCategoryMoveAnnotation), // -                MoveAnnotation    -
  @(SGFCPropertyTypeEL) : @(SGFCPropertyCategoryMiscellaneous),  // -                n/a               -
  @(SGFCPropertyTypeEX) : @(SGFCPropertyCategoryMiscellaneous),  // -                n/a               -
  @(SGFCPropertyTypeID) : @(SGFCPropertyCategoryGameInfo),       // GameInfo         GameInfo          n/a
  @(SGFCPropertyTypeL) : @(SGFCPropertyCategoryMarkup),          // -                n/a               Superseded by LB
  @(SGFCPropertyTypeLT) : @(SGFCPropertyCategoryRoot),           // -                Root              n/a
  @(SGFCPropertyTypeM) : @(SGFCPropertyCategoryMarkup),          // -                n/a               "Marked points"
  @(SGFCPropertyTypeOM) : @(SGFCPropertyCategoryTiming),         // -                Timing            n/a
  @(SGFCPropertyTypeOP) : @(SGFCPropertyCategoryTiming),         // -                Timing            n/a
  @(SGFCPropertyTypeOV) : @(SGFCPropertyCategoryTiming),         // -                Timing            n/a
  @(SGFCPropertyTypeRG) : @(SGFCPropertyCategoryMarkup),         // -                "Sets of points can be marked [...]"
  @(SGFCPropertyTypeSC) : @(SGFCPropertyCategoryMarkup),         // -                "Sets of points can be marked [...]"
  @(SGFCPropertyTypeSE) : @(SGFCPropertyCategoryMiscellaneous),  // -                 -                n/a
                                                                 // SE in Lines of Action is a Markup property
  @(SGFCPropertyTypeSI) : @(SGFCPropertyCategoryMoveAnnotation), // -                 MoveAnnotation   n/a
  @(SGFCPropertyTypeTC) : @(SGFCPropertyCategoryMiscellaneous),  // -                 -                n/a
  @(SGFCPropertyTypeWS) : @(SGFCPropertyCategoryGameInfo),       // GameInfo          Root             Root

  // Game of Go properties
  @(SGFCPropertyTypeHA) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeKM) : @(SGFCPropertyCategoryGameInfo),
  @(SGFCPropertyTypeTB) : @(SGFCPropertyCategoryMarkup),
  @(SGFCPropertyTypeTW) : @(SGFCPropertyCategoryMarkup),

  // Non-standard properties
  @(SGFCPropertyTypeUnknown) : @(SGFCPropertyCategoryMiscellaneous),
};

NSDictionary* SGFCPropertyTypeToPropertyTraitsMap =
@{
  // Standard properties from FF4
  @(SGFCPropertyTypeB) : @0ULL,
  @(SGFCPropertyTypeKO) : @0ULL,
  @(SGFCPropertyTypeMN) : @0ULL,
  @(SGFCPropertyTypeW) : @0ULL,
  @(SGFCPropertyTypeAB) : @0ULL,
  @(SGFCPropertyTypeAE) : @0ULL,
  @(SGFCPropertyTypeAW) : @0ULL,
  @(SGFCPropertyTypePL) : @0ULL,
  @(SGFCPropertyTypeC) : @0ULL,
  @(SGFCPropertyTypeDM) : @0ULL,
  @(SGFCPropertyTypeGB) : @0ULL,
  @(SGFCPropertyTypeGW) : @0ULL,
  @(SGFCPropertyTypeHO) : @0ULL,
  @(SGFCPropertyTypeN) : @0ULL,
  @(SGFCPropertyTypeUC) : @0ULL,
  @(SGFCPropertyTypeV) : @0ULL,
  @(SGFCPropertyTypeBM) : @0ULL,
  @(SGFCPropertyTypeDO) : @0ULL,
  @(SGFCPropertyTypeIT) : @0ULL,
  @(SGFCPropertyTypeTE) : @0ULL,
  @(SGFCPropertyTypeAR) : @0ULL,
  @(SGFCPropertyTypeCR) : @0ULL,
  @(SGFCPropertyTypeDD) : @(SGFCPropertyTraitInheritable),
  @(SGFCPropertyTypeLB) : @0ULL,
  @(SGFCPropertyTypeLN) : @0ULL,
  @(SGFCPropertyTypeMA) : @0ULL,
  @(SGFCPropertyTypeSL) : @0ULL,
  @(SGFCPropertyTypeSQ) : @0ULL,
  @(SGFCPropertyTypeTR) : @0ULL,
  @(SGFCPropertyTypeAP) : @0ULL,
  @(SGFCPropertyTypeCA) : @0ULL,
  @(SGFCPropertyTypeFF) : @0ULL,
  @(SGFCPropertyTypeGM) : @0ULL,
  @(SGFCPropertyTypeST) : @0ULL,
  @(SGFCPropertyTypeSZ) : @0ULL,
  @(SGFCPropertyTypeAN) : @0ULL,
  @(SGFCPropertyTypeBR) : @0ULL,
  @(SGFCPropertyTypeBT) : @0ULL,
  @(SGFCPropertyTypeCP) : @0ULL,
  @(SGFCPropertyTypeDT) : @0ULL,
  @(SGFCPropertyTypeEV) : @0ULL,
  @(SGFCPropertyTypeGN) : @0ULL,
  @(SGFCPropertyTypeGC) : @0ULL,
  @(SGFCPropertyTypeON) : @0ULL,
  @(SGFCPropertyTypeOT) : @0ULL,
  @(SGFCPropertyTypePB) : @0ULL,
  @(SGFCPropertyTypePC) : @0ULL,
  @(SGFCPropertyTypePW) : @0ULL,
  @(SGFCPropertyTypeRE) : @0ULL,
  @(SGFCPropertyTypeRO) : @0ULL,
  @(SGFCPropertyTypeRU) : @0ULL,
  @(SGFCPropertyTypeSO) : @0ULL,
  @(SGFCPropertyTypeTM) : @0ULL,
  @(SGFCPropertyTypeUS) : @0ULL,
  @(SGFCPropertyTypeWR) : @0ULL,
  @(SGFCPropertyTypeWT) : @0ULL,
  @(SGFCPropertyTypeBL) : @0ULL,
  @(SGFCPropertyTypeOB) : @0ULL,
  @(SGFCPropertyTypeOW) : @0ULL,
  @(SGFCPropertyTypeWL) : @0ULL,
  @(SGFCPropertyTypeFG) : @0ULL,
  @(SGFCPropertyTypePM) : @(SGFCPropertyTraitInheritable),
  @(SGFCPropertyTypeVW) : @(SGFCPropertyTraitInheritable),

  // Standard properties from FF1-3
  @(SGFCPropertyTypeBS) : @0ULL,
  @(SGFCPropertyTypeCH) : @0ULL,
  @(SGFCPropertyTypeEL) : @0ULL,
  @(SGFCPropertyTypeEX) : @0ULL,
  @(SGFCPropertyTypeID) : @0ULL,
  @(SGFCPropertyTypeL) : @0ULL,
  @(SGFCPropertyTypeLT) : @0ULL,
  @(SGFCPropertyTypeM) : @0ULL,
  @(SGFCPropertyTypeOM) : @0ULL,
  @(SGFCPropertyTypeOP) : @0ULL,
  @(SGFCPropertyTypeOV) : @0ULL,
  @(SGFCPropertyTypeRG) : @0ULL,
  @(SGFCPropertyTypeSC) : @0ULL,
  @(SGFCPropertyTypeSE) : @0ULL,
  @(SGFCPropertyTypeSI) : @0ULL,
  @(SGFCPropertyTypeTC) : @0ULL,
  @(SGFCPropertyTypeWS) : @0ULL,

  // Game of Go properties
  @(SGFCPropertyTypeHA) : @0ULL,
  @(SGFCPropertyTypeKM) : @0ULL,
  @(SGFCPropertyTypeTB) : @0ULL,
  @(SGFCPropertyTypeTW) : @0ULL,

  // Non-standard properties
  @(SGFCPropertyTypeUnknown) : @0ULL,
};

NSDictionary* SGFCGameTypeAsNumberToGameTypeMap =
@{
  @1 : @(SGFCGameTypeGo),
  @2 : @(SGFCGameTypeOthello),
  @3 : @(SGFCGameTypeChess),
  @4 : @(SGFCGameTypeGomokuAndRenju),
  @5 : @(SGFCGameTypeNineMensMorris),
  @6 : @(SGFCGameTypeBackgammon),
  @7 : @(SGFCGameTypeChineseChess),
  @8 : @(SGFCGameTypeShogi),
  @9 : @(SGFCGameTypeLinesOfAction),
  @10 : @(SGFCGameTypeAtaxx),
  @11 : @(SGFCGameTypeHex),
  @12 : @(SGFCGameTypeJungle),
  @13 : @(SGFCGameTypeNeutron),
  @14 : @(SGFCGameTypePhilosophersFootball),
  @15 : @(SGFCGameTypeQuadrature),
  @16 : @(SGFCGameTypeTrax),
  @17 : @(SGFCGameTypeTantrix),
  @18 : @(SGFCGameTypeAmazons),
  @19 : @(SGFCGameTypeOcti),
  @20 : @(SGFCGameTypeGess),
  @21 : @(SGFCGameTypeTwixt),
  @22 : @(SGFCGameTypeZertz),
  @23 : @(SGFCGameTypePlateau),
  @24 : @(SGFCGameTypeYinsh),
  @25 : @(SGFCGameTypePunct),
  @26 : @(SGFCGameTypeGobblet),
  @27 : @(SGFCGameTypeHive),
  @28 : @(SGFCGameTypeExxit),
  @29 : @(SGFCGameTypeHnefatal),
  @30 : @(SGFCGameTypeKuba),
  @31 : @(SGFCGameTypeTripples),
  @32 : @(SGFCGameTypeChase),
  @33 : @(SGFCGameTypeTumblingDown),
  @34 : @(SGFCGameTypeSahara),
  @35 : @(SGFCGameTypeByte),
  @36 : @(SGFCGameTypeFocus),
  @37 : @(SGFCGameTypeDvonn),
  @38 : @(SGFCGameTypeTamsk),
  @39 : @(SGFCGameTypeGipf),
  @40 : @(SGFCGameTypeKropki),
};

NSDictionary* SGFCGameTypeToGameTypeAsNumberMap =
@{
  @(SGFCGameTypeGo) : @1,
  @(SGFCGameTypeOthello) : @2,
  @(SGFCGameTypeChess) : @3,
  @(SGFCGameTypeGomokuAndRenju) : @4,
  @(SGFCGameTypeNineMensMorris) : @5,
  @(SGFCGameTypeBackgammon) : @6,
  @(SGFCGameTypeChineseChess) : @7,
  @(SGFCGameTypeShogi) : @8,
  @(SGFCGameTypeLinesOfAction) : @9,
  @(SGFCGameTypeAtaxx) : @10,
  @(SGFCGameTypeHex) : @11,
  @(SGFCGameTypeJungle) : @12,
  @(SGFCGameTypeNeutron) : @13,
  @(SGFCGameTypePhilosophersFootball) : @14,
  @(SGFCGameTypeQuadrature) : @15,
  @(SGFCGameTypeTrax) : @16,
  @(SGFCGameTypeTantrix) : @17,
  @(SGFCGameTypeAmazons) : @18,
  @(SGFCGameTypeOcti) : @19,
  @(SGFCGameTypeGess) : @20,
  @(SGFCGameTypeTwixt) : @21,
  @(SGFCGameTypeZertz) : @22,
  @(SGFCGameTypePlateau) : @23,
  @(SGFCGameTypeYinsh) : @24,
  @(SGFCGameTypePunct) : @25,
  @(SGFCGameTypeGobblet) : @26,
  @(SGFCGameTypeHive) : @27,
  @(SGFCGameTypeExxit) : @28,
  @(SGFCGameTypeHnefatal) : @29,
  @(SGFCGameTypeKuba) : @30,
  @(SGFCGameTypeTripples) : @31,
  @(SGFCGameTypeChase) : @32,
  @(SGFCGameTypeTumblingDown) : @33,
  @(SGFCGameTypeSahara) : @34,
  @(SGFCGameTypeByte) : @35,
  @(SGFCGameTypeFocus) : @36,
  @(SGFCGameTypeDvonn) : @37,
  @(SGFCGameTypeTamsk) : @38,
  @(SGFCGameTypeGipf) : @39,
  @(SGFCGameTypeKropki) : @40,
};

const SGFCGameType SGFCDefaultGameType = SGFCGameTypeGo;
const SGFCNumber SGFCGameTypeNaN = std::numeric_limits<SGFCNumber>::min();

const SGFCBoardSize SGFCBoardSizeMinimum =  SGFCBoardSizeMake(1, 1);
const SGFCBoardSize SGFCBoardSizeMaximumGo = SGFCBoardSizeMake(52, 52);
const SGFCBoardSize SGFCBoardSizeDefaultGo = SGFCBoardSizeMake(19, 19);
const SGFCBoardSize SGFCBoardSizeDefaultChess = SGFCBoardSizeMake(8, 8);

NSExceptionName const SGFCInvalidOperationException = @"SGFCInvalidOperationException";
NSExceptionName const SGFCDocumentStructureException = @"SGFCDocumentStructureException";
NSExceptionName const SGFCNotImplementedException = @"SGFCNotImplementedException";

const SGFCBoardSize SGFCBoardSizeNone = SGFCBoardSizeMake(-1, -1);
const SGFCBoardSize SGFCBoardSizeInvalid = SGFCBoardSizeMake(-2, -2);

const SGFCNumber SGFCHandicapStonesNone = 0;
const SGFCReal SGFCKomiNone = 0.0;

const SGFCNodeTraits SGFCNodeTraitsNone = 0;
const SGFCNodeTraits SGFCNodeTraitsAll = std::numeric_limits<SGFCNodeTraits>::max();
const SGFCPropertyTraits SGFCPropertyTraitsNone = 0;
const SGFCPropertyTraits SGFCPropertyTraitsAll = std::numeric_limits<SGFCPropertyTraits>::max();
