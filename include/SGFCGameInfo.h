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
#import "SGFCBoardSize.h"
#import "SGFCDate.h"
#import "SGFCGameResult.h"
#import "SGFCGameType.h"
#import "SGFCRoundInformation.h"
#import "SGFCTypedefs.h"

// System includes
#import <Foundation/NSObject.h>

// Forward declarations
@class SGFCGoGameInfo;
@class SGFCNode;

/// @brief The SGFCGameInfo interface ia a collection of meta data that
/// describes one SGF game. For instance, the meta data includes information
/// such as the name of the game, when and where it was played, by whom, etc.
///
/// @ingroup public-api
/// @ingroup property-value
/// @ingroup game
///
/// SGFCGame or SGFCNode can be queried to provide an SGFCGameInfo object.
/// The object is newly created and contains a snapshot of the property values
/// of a few root properties (#SGFCPropertyCategoryRoot) and all game info
/// properties (#SGFCPropertyCategoryGameInfo) found in the root node and the
/// game info node, respectively, at the time the query is made.
///
/// @note It is not possible to distinguish between a property that was not
/// present in the root or game info node, and a property that was present
/// in the root or game info but had the default property value.
///
/// Alternatively a new but empty SGFCGameInfo object can be created via
/// SGFCKitFactory and then populated with data as the library client
/// sees fit. The empty SGFCGameInfo object is initialized with default
/// values.
///
/// The values that an SGFCGameInfo object holds can be written to an
/// SGFCGame or SGFCNode. The values are converted to properties and
/// property values that are then stored in the root node and the game info
/// node, respectively. Properties and property values that already exist at
/// that time are overwritten.
///
/// @note It is not possible to write a property with its default value.
///
/// Root property values are read-only - they must be provided at the time the
/// SGFCGameInfo object is constructed and cannot be changed later on. The
/// reason is that changing these values in an SGFCGameInfo object that was
/// captured from a game tree and then later writing the SGFCGameInfo object
/// data back to the game tree would likely invalidate most if not all of the
/// game tree's data.
///
/// @attention SGFCGameInfo or SGFCGoGameInfo form a class cluster. Do @b not
/// attempt to subclass SGFCGameInfo or SGFCGoGameInfo! Always use the
/// convenience constructors and initializers from the SGFCGameInfo class
/// to create objects - they will automatically provide you with an
/// SGFCGoGameInfo object when the root node parameter indicates that it is
/// appropriate, i.e. when the game type is #SGFCGameTypeGo.
@interface SGFCGameInfo : NSObject
{
}

/// @brief Returns a newly constructed SGFCGameInfo object with
/// default values.
+ (instancetype) gameInfo;

/// @brief Returns a newly constructed SGFCGameInfo object with values
/// taken from the properties in root node @a rootNode. All values that
/// would normally be taken from the properties in the game info node have
/// default values.
///
/// If the content of @a rootNode indicates that the game type is
/// #SGFCGameTypeGo then the returned object is an SGFCGoGameInfo object.
/// The game type is #SGFCGameTypeGo in the following cases:
/// - If @a rootNode contains a property of type #SGFCPropertyTypeGM
///   that either has no value, or that has a single Number value, and that
///   value is 0.
/// - Or if @a rootNode does not contain a property of type
///   #SGFCPropertyTypeGM.
///
/// @exception NSInvalidArgumentException Is raised if @a rootNode is @e nil.
+ (instancetype) gameInfoWithRootNode:(SGFCNode*)rootNode;

/// @brief Returns a newly constructed SGFCGameInfo object with values
/// taken from the properties in root node @a rootNode and from game info
/// node @a gameInfoNode.
///
/// If the content of @a rootNode indicates that the game type is
/// #SGFCGameTypeGo then the returned object is an SGFCGoGameInfo object.
/// The game type is #SGFCGameTypeGo in the following cases:
/// - If @a rootNode contains a property of type #SGFCPropertyTypeGM
///   that either has no value, or that has a single Number value, and that
///   value is 0.
/// - Or if @a rootNode does not contain a property of type
///   #SGFCPropertyTypeGM.
///
/// @exception NSInvalidArgumentException Is raised if @a rootNode is @e nil
/// or if @a gameInfoNode is @e nil.
+ (instancetype) gameInfoWithRootNode:(SGFCNode*)rootNode
                         gameInfoNode:(SGFCNode*)gameInfoNode;

/// @brief Initializes an SGFCGameInfo object with default values.
///
/// This is the designated initializer of SGFCGameInfo.
- (instancetype) init NS_DESIGNATED_INITIALIZER;

/// @brief Initializes an SGFCGameInfo object with values
/// taken from the properties in root node @a rootNode. All values that
/// would normally be taken from the properties in the game info node have
/// default values.
///
/// If the content of @a rootNode indicates that the game type is
/// #SGFCGameTypeGo then the returned object is an SGFCGoGameInfo object.
/// The game type is #SGFCGameTypeGo in the following cases:
/// - If @a rootNode contains a property of type #SGFCPropertyTypeGM
///   that either has no value, or that has a single Number value, and that
///   value is 0.
/// - Or if @a rootNode does not contain a property of type
///   #SGFCPropertyTypeGM.
///
/// @exception NSInvalidArgumentException Is raised if @a rootNode is @e nil.
- (instancetype) initWithRootNode:(SGFCNode*)rootNode;

/// @brief Initializes an SGFCGameInfo object with values
/// taken from the properties in root node @a rootNode and from game info
/// node @a gameInfoNode.
///
/// If the content of @a rootNode indicates that the game type is
/// #SGFCGameTypeGo then the returned object is an SGFCGoGameInfo object.
/// The game type is #SGFCGameTypeGo in the following cases:
/// - If @a rootNode contains a property of type #SGFCPropertyTypeGM
///   that either has no value, or that has a single Number value, and that
///   value is 0.
/// - Or if @a rootNode does not contain a property of type
///   #SGFCPropertyTypeGM.
///
/// @exception NSInvalidArgumentException Is raised if @a rootNode is @e nil
/// or if @a gameInfoNode is @e nil.
- (instancetype) initWithRootNode:(SGFCNode*)rootNode
                     gameInfoNode:(SGFCNode*)gameInfoNode;

/// @name Root properties (read only)
//@{
/// @brief Returns the game type. The default value is
/// #SGFCDefaultGameType.
///
/// Returns #SGFCGameTypeUnknown if the Number value of the GM property is
/// not in the list of valid games defined in the SGF standard.
///
/// @see SGFCPropertyTypeGM
@property(nonatomic, readonly) SGFCGameType gameType;

/// @brief Returns the game type as an SGFCNumber value. The default value
/// is the SGFCNumber value that corresponds to
/// #SGFCDefaultGameType.
///
/// This is useful if gameType() returns #SGFCGameTypeUnknown because
/// the Number value of the GM property is not in the list of valid games
/// defined in the SGF standard.
///
/// @see SGFCPropertyTypeGM
@property(nonatomic, readonly) SGFCNumber gameTypeAsNumber;

/// @brief Returns the size of the board on which the game was played. The
/// default value is the default board size for
/// #SGFCDefaultGameType.
///
/// Returns #SGFCBoardSizeNone or #SGFCBoardSizeInvalid
/// if there is a problem with determining a valid board size from the SZ
/// property. See SGFCGame::boardSize() for details.
///
/// @see SGFCPropertyTypeSZ
@property(nonatomic, readonly) SGFCBoardSize boardSize;
//@}

/// @name Game data information
//@{
/// @brief The name of the user (or program) who recorded or
/// entered the game data. The default value is
/// #SGFCNoneValueString.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value.
///
/// @see SGFCPropertyTypeUS
@property(nonatomic, strong) NSString* recorderName;

/// @brief The name of the source of the game data (e.g. book,
/// journal, etc.). The default value is #SGFCNoneValueString.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value.
///
/// @see SGFCPropertyTypeSO
@property(nonatomic, strong) NSString* sourceName;

/// @brief The name of the person who made the annotations to the
/// game. The default value is #SGFCNoneValueString.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value.
///
/// @see SGFCPropertyTypeAN
@property(nonatomic, strong) NSString* annotationAuthor;

/// @brief The copyright information for the game data (including
/// the annotations). The default value is #SGFCNoneValueString.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value.
///
/// @see SGFCPropertyTypeCP
@property(nonatomic, strong) NSString* copyrightInformation;
//@}

/// @name Basic game information
//@{
/// @brief The name of the game (e.g. for easily finding the game
/// again within a collection). The default value is
/// #SGFCNoneValueString.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value.
///
/// @see SGFCPropertyTypeGN
@property(nonatomic, strong) NSString* gameName;

/// @brief Information about the game (e.g. background information,
/// a game summary, etc.). The default value is
/// #SGFCNoneValueString.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value.
///
/// @see SGFCPropertyTypeGC
@property(nonatomic, strong) NSString* gameInformation;

/// @brief The dates when the game was played, decomposed into
/// years, optional months and optional days. Several non-consecutive dates
/// are possible. The default value is an empty collection of dates.
///
/// The returned collection is also empty if there is a problem with
/// decomposing the raw property value. See SGFCDateFromPropertyValue()
/// for details. An indicator that this happened is if rawGameDates()
/// returns a value that is not equal to #SGFCNoneValueString.
///
/// Invoking the setter of this property also changes the information returned
/// by rawGameDates().
///
/// The array elements are NSValue objects. Use the NSValueAdditionsSGFCDate
/// category (which is declared in the NSValue+SGFCDate.h header file) to store
/// SGFCDate inside an NSValue object, or to retrieve an SGFCDate from an
/// NSValue object.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value.
///
/// @see SGFCPropertyTypeDT
@property(nonatomic, strong) NSArray* gameDates;
/// @brief The dates when the game was played. Several
/// non-consecutive dates are possible. The default value is
/// #SGFCNoneValueString.
///
/// This is useful if the raw game dates cannot be decomposed into years,
/// optional months and optional days, as is required by the SGF standard
/// for #SGFCPropertyTypeDT.
///
/// @note There is no setter for the raw game dates value because the
/// SGF standard @b requires a certain format in the raw property value,
/// and that can be guaranteed only by forcing the library client to set
/// the game dates via structured SGFCDate values.
///
/// @see SGFCPropertyTypeDT
@property(nonatomic, strong, readonly) NSString* rawGameDates;

/// @brief The name of the rules used for the game. The default
/// value is #SGFCNoneValueString.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value.
///
/// @see SGFCPropertyTypeRU
@property(nonatomic, strong) NSString* rulesName;

/// @brief The result of the game, decomposed into an outcome and
/// an optional score. The default value is an SGFCGameResult object which
/// has the @e IsValid property set to NO.
///
/// The returned SGFCGameResult also has the @e IsValid property set to
/// NO if there is a problem with decomposing the raw property value.
/// See SGFCGameResultFromPropertyValue() for details. An indicator that
/// this happened is if rawGameResult() returns a value that is not equal to
/// #SGFCNoneValueString.
///
/// Invoking the setter of this property also changes the information returned
/// by rawGameResult().
///
/// @see SGFCPropertyTypeRE
@property(nonatomic) SGFCGameResult gameResult;
/// @brief The result of the game. The default value is
/// #SGFCNoneValueString.
///
/// This is useful if the raw game result cannot be decomposed into an
/// outcome and an optional score as is required by the SGF standard for
/// #SGFCPropertyTypeRE.
///
/// @note There is no setter for the raw game result value because the
/// SGF standard @b requires a certain format in the raw property value,
/// and that can be guaranteed only by forcing the library client to set
/// the game result via a structured SGFCGameResult value.
///
/// @see SGFCPropertyTypeRE
@property(nonatomic, strong, readonly) NSString* rawGameResult;
//@}

/// @name Extra game information
//@{
/// @brief The time limit of the game in seconds. The default value
/// is 0.0.
///
/// @see SGFCPropertyTypeTM
@property(nonatomic) SGFCReal timeLimitInSeconds;

/// @brief The description of the method used for overtime
/// (byo-yomi). The default value is #SGFCNoneValueString.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value.
///
/// @see SGFCPropertyTypeOT
@property(nonatomic, strong) NSString* overtimeInformation;

/// @brief Information about the opening played. The default value
/// is #SGFCNoneValueString.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value.
///
/// @see SGFCPropertyTypeON
@property(nonatomic, strong) NSString* openingInformation;
//@}

/// @name Player information
//@{
/// @brief The name of the black player. The default value is an
/// empty string.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value.
///
/// @see SGFCPropertyTypePB
@property(nonatomic, strong) NSString* blackPlayerName;

/// @brief The rank of the black player. The default value is an
/// empty string.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value.
///
/// @see SGFCPropertyTypeBR
@property(nonatomic, strong) NSString* blackPlayerRank;

/// @brief The name of the black player's team. The default value
/// is #SGFCNoneValueString.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value.
///
/// @see SGFCPropertyTypeBT
@property(nonatomic, strong) NSString* blackPlayerTeamName;

/// @brief The name of the white player. The default value is an
/// empty string.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value.
///
/// @see SGFCPropertyTypePW
@property(nonatomic, strong) NSString* whitePlayerName;

/// @brief The rank of the white player. The default value is an
/// empty string.
///
/// @see SGFCPropertyTypeWR
@property(nonatomic, strong) NSString* whitePlayerRank;

/// @brief The name of the white player's team. The default value
/// is #SGFCNoneValueString.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value.
///
/// @see SGFCPropertyTypeWT
@property(nonatomic, strong) NSString* whitePlayerTeamName;
//@}

/// @name Context in which the game was played
//@{
/// @brief The name or description of the location where the game
/// was played. The default value is #SGFCNoneValueString.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value.
///
/// @see SGFCPropertyTypePC
@property(nonatomic, strong) NSString* gameLocation;

/// @brief The name of the event (e.g. tournament) where the game
/// was played. The default value is #SGFCNoneValueString.
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// a @e nil value.
///
/// @see SGFCPropertyTypeEV
@property(nonatomic, strong) NSString* eventName;

/// @brief The information that describes the round in which the
/// game was played, decomposed into round number and type of round.
/// The default value is an SGFCRoundInformation object which has the
/// @e IsValid property set to NO.
///
/// The returned SGFCRoundInformation also has the @e IsValid property set
/// to NO if there is a problem with decomposing the raw property value.
/// See SGFCRoundInformationFromPropertyValue() for details. An indicator
/// that this happened is if rawRoundInformation() returns a value that is not
/// equal to #SGFCNoneValueString.
///
/// Invoking the setter of this property also changes the information returned
/// by rawRoundInformation().
///
/// @exception NSInvalidArgumentException Is raised if the property is set with
/// an SGFCRoundInformation object whose @e RoundNumber and/or @e RoundType
/// properties are @e nil.
///
/// @see SGFCPropertyTypeRO
@property(nonatomic) SGFCRoundInformation roundInformation;
/// @brief The information that describes the round in which the
/// game was played. The default value is #SGFCNoneValueString.
///
/// This is useful if the raw round information cannot be decomposed into
/// round number and type of round as recommended by the SGF standard for
/// #SGFCPropertyTypeRO.
///
/// @note There is no setter for the raw round information value because the
/// SGF standard @b requires a certain format in the raw property value,
/// and that can be guaranteed only by forcing the library client to set
/// the round information via a structured SGFCRoundInformation value.
///
/// @see SGFCPropertyTypeRO
@property(nonatomic, strong, readonly) NSString* rawRoundInformation;
//@}

/// @brief Returns an SGFCGoGameInfo object if the SGFCGameInfo object
/// was created specifically for #SGFCGameTypeGo. Returns @e nil
/// otherwise. The caller is not the owner of the returned object.
- (SGFCGoGameInfo*) toGoGameInfo;

@end
