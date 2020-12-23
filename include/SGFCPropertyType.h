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

/// @brief SGFCPropertyType enumerates all property types defined by the SGF
/// standard, plus a small number of non-standard property types that are
/// specially handled by SGFC. The enum value #SGFCPropertyTypeUnknown is
/// used for all other non-standard properties.
///
/// @ingroup public-api
typedef NS_ENUM(NSUInteger, SGFCPropertyType)
{
  // ----------------------------------------------------------------------
  // Standard properties from FF4
  // ----------------------------------------------------------------------

  /// @brief Execute black move. Property value type: Move.
  ///
  /// This is a move property.
  SGFCPropertyTypeB,
  /// @brief Execute a black or white move within the same node even if it is
  /// illegal. The property is illegal if there isn't a black or white move
  /// within the same node. Property value type: None.
  ///
  /// This is a move property.
  SGFCPropertyTypeKO,
  /// @brief Set the move number of a move specified in the same node as this
  /// property to the given value. Property value type: Number.
  ///
  /// This is a move property.
  SGFCPropertyTypeMN,
  /// @brief Execute white move. Property value type: Move.
  ///
  /// This is a move property.
  SGFCPropertyTypeW,

  /// @brief Add black stones to the board. Property value type: List
  /// of Stone.
  ///
  /// This is a board setup property.
  SGFCPropertyTypeAB,
  /// @brief Clear the given points on the board. Property value type: List
  /// of Point.
  ///
  /// This is a board setup property.
  SGFCPropertyTypeAE,
  /// @brief Add white stones to the board. Property value type: List
  /// of Stone.
  ///
  /// This is a board setup property.
  SGFCPropertyTypeAW,
  /// @brief Set the player whose turn it is. Property value type: Color.
  ///
  /// This is a board setup property.
  SGFCPropertyTypePL,

  /// @brief Provide a comment text for the node. Property value type: Text.
  ///
  /// This is a node annotation property.
  SGFCPropertyTypeC,
  /// @brief Specify that the position is even. Property value type: Double.
  ///
  /// The property must not be mixed with UC, GB or GW within a node.
  ///
  /// This is a node annotation property.
  SGFCPropertyTypeDM,
  /// @brief The node contains something that is good for black. Property
  /// value type: Double.
  ///
  /// The property must not be mixed with GW, DM or UC within a node.
  ///
  /// This is a node annotation property.
  SGFCPropertyTypeGB,
  /// @brief The node contains something that is good for white. Property
  /// value type: Double.
  ///
  /// The property must not be mixed with GB, DM or UC within a node.
  ///
  /// This is a node annotation property.
  SGFCPropertyTypeGW,
  /// @brief The node contains a "hotspot", i.e. something interesting such
  /// as a game-deciding move. Property value type: Double.
  ///
  /// This is a node annotation property.
  SGFCPropertyTypeHO,
  /// @brief Provide a name text for the node. Property value
  /// type: SimpleText.
  ///
  /// This is a node annotation property.
  SGFCPropertyTypeN,
  /// @brief The node contains a position that is unclear. Property
  /// value type: Double.
  ///
  /// The property must not be mixed with DM, GB or GW within a node.
  ///
  /// This is a node annotation property.
  SGFCPropertyTypeUC,
  /// @brief Define a value for the node. Positive values are good for black,
  /// negative values are good for white. Property value type: Real.
  ///
  /// The interpretation of particular values is game-specific. In Go, this
  /// is the estimated score.
  ///
  /// This is a node annotation property.
  SGFCPropertyTypeV,

  /// @brief The move played in this node is a bad move. Property value
  /// type: Double.
  ///
  /// The property must not be mixed with TE, DO or IT within a node.
  ///
  /// This is a move annotation property.
  SGFCPropertyTypeBM,
  /// @brief The move played in this node is doubtful. Property value
  /// type: None.
  ///
  /// The property must not be mixed with BM, TE, or IT within a node.
  ///
  /// This is a move annotation property.
  SGFCPropertyTypeDO,
  /// @brief The move played in this node is interesting. Property value
  /// type: None.
  ///
  /// The property must not be mixed with BM, TE, or DO within a node.
  ///
  /// This is a move annotation property.
  SGFCPropertyTypeIT,
  /// @brief The move played in this node is tesuji (good move). Property
  /// value type: Double.
  ///
  /// The property must not be mixed with BM, TE, or IT within a node.
  ///
  /// This is a move annotation property.
  SGFCPropertyTypeTE,

  /// @brief For each property value, draw an arrow from the first point to
  /// the second point. Property value type: List of composed Point/Point
  /// (i.e. "Point:Point").
  ///
  /// No two property values must specify the same arrow twice. A property
  /// value must specify two different points.
  ///
  /// This is a markup property.
  SGFCPropertyTypeAR,
  /// @brief Mark the given points with a circle. Property value type: List of
  /// Point.
  ///
  /// Property values must be unique.
  ///
  /// Within the same node the points specified must not also be specified by
  /// one of the other properties MA, SL, SQ or TR.
  ///
  /// This is a markup property.
  SGFCPropertyTypeCR,
  /// @brief Dim (grey out) the given points. Property value type: Elist of
  /// Point.
  ///
  /// Elist means that the property value can be either a list of Point, or
  /// None.
  ///
  /// Property values must be unique (not specified in the SGF standard).
  ///
  /// An "inherits" property. Specifying a None value clears any inherited
  /// values, i.e. "undims" everyting.
  ///
  /// This is a markup property.
  SGFCPropertyTypeDD,
  /// @brief Write the given labels on the board, centered around the given
  /// points. Property value type: List of composed Point/SimpleText (i.e.
  /// "Point:SimpleText").
  ///
  /// Property values must be unique.
  ///
  /// This is a markup property.
  SGFCPropertyTypeLB,
  /// @brief For each property value, draw a line from the first point to
  /// the second point. Property value type: List of composed Point/Point
  /// (i.e. "Point:Point").
  ///
  /// No two property values must specify the same arrow twice. A property
  /// value must specify two different points.
  ///
  /// Within the same node the point pairs specified must not also be
  /// specified by the AR properties (restriction is not in the SGF standard).
  ///
  /// This is a markup property.
  SGFCPropertyTypeLN,
  /// @brief Mark the given points with an "X". Property value type: List of
  /// Point.
  ///
  /// Property values must be unique.
  ///
  /// Within the same node the points specified must not also be specified by
  /// one of the other properties CR, SL, SQ or TR.
  ///
  /// This is a markup property.
  SGFCPropertyTypeMA,
  /// @brief Draw the given points as "selected". Property value type: List of
  /// Point.
  ///
  /// Property values must be unique.
  ///
  /// Within the same node the points specified must not also be specified by
  /// one of the other properties CR, MA, SQ or TR.
  ///
  /// This is a markup property.
  SGFCPropertyTypeSL,
  /// @brief Mark the given points with a square. Property value type: List of
  /// Point.
  ///
  /// Property values must be unique.
  ///
  /// Within the same node the points specified must not also be specified by
  /// one of the other properties CR, MA, SL or TR.
  ///
  /// This is a markup property.
  SGFCPropertyTypeSQ,
  /// @brief Mark the given points with a triangle. Property value type: List
  /// of Point.
  ///
  /// Property values must be unique.
  ///
  /// Within the same node the points specified must not also be specified by
  /// one of the other properties CR, MA, SL or SQ.
  ///
  /// This is a markup property.
  SGFCPropertyTypeTR,

  /// @brief Name and version number of the application used to create the
  /// game tree. Property value type: Composed SimpleText/SimpleText (i.e.
  /// "SimpleText:SimpleText").
  ///
  /// This is a root property.
  SGFCPropertyTypeAP,
  /// @brief The encoding (aka "character set) used for SimpleText and Text
  /// type property values in the game tree. Property value type: SimpleText.
  ///
  /// The default value is "ISO-8859-1" aka "Latin1". Only character set
  /// names (or their aliases) as specified in RFC 1345 (or updates thereof)
  /// are allowed.
  ///
  /// This is a root property.
  SGFCPropertyTypeCA,
  /// @brief The file format used in the game tree. Property value
  /// type: Number.
  ///
  /// Allowed values are 1, 3 and 4. The default value is 1.
  ///
  /// This is a root property.
  SGFCPropertyTypeFF,
  /// @brief The type of game that is stored in the game tree. Property
  /// value type: Number.
  ///
  /// Allowed values are 1-16. The default value is 1 (Go).
  ///
  /// This is a root property.
  ///
  /// @see SgfcGameType.
  SGFCPropertyTypeGM,
  /// @brief Define how variations should be shown. Property value
  /// type: Number.
  ///
  /// This is a root property.
  SGFCPropertyTypeST,
  /// @brief Define the board size. Property value type: Either a single
  /// Number, or a composed Number/Number (i.e. "Number:Number").
  ///
  /// A single number means the board is square. Two numbers means the board
  /// is rectangular. If two numbers are specified they must be different.
  /// The first number specifies the number of columns, the second number
  /// specifies the number of rows.
  ///
  /// Allowed values are numbers >= 1. For games of type Go the maximum
  /// value is 52. The default value for games of type Go is 19, for games
  /// of type Chess it is 8.
  ///
  /// This is a root property.
  SGFCPropertyTypeSZ,

  SGFCPropertyTypeAN,
  SGFCPropertyTypeBR,
  SGFCPropertyTypeBT,
  SGFCPropertyTypeCP,
  SGFCPropertyTypeDT,
  SGFCPropertyTypeEV,
  SGFCPropertyTypeGN,
  SGFCPropertyTypeGC,
  SGFCPropertyTypeON,
  SGFCPropertyTypeOT,
  SGFCPropertyTypePB,
  SGFCPropertyTypePC,
  SGFCPropertyTypePW,
  SGFCPropertyTypeRE,
  SGFCPropertyTypeRO,
  SGFCPropertyTypeRU,
  SGFCPropertyTypeSO,
  SGFCPropertyTypeTM,
  SGFCPropertyTypeUS,
  SGFCPropertyTypeWR,
  SGFCPropertyTypeWT,

  SGFCPropertyTypeBL,
  SGFCPropertyTypeOB,
  SGFCPropertyTypeOW,
  SGFCPropertyTypeWL,

  SGFCPropertyTypeFG,
  SGFCPropertyTypePM,
  SGFCPropertyTypeVW,

  // ----------------------------------------------------------------------
  // Standard properties from FF1-3
  // ----------------------------------------------------------------------
  SGFCPropertyTypeBS,
  SGFCPropertyTypeCH,
  SGFCPropertyTypeEL,
  SGFCPropertyTypeEX,
  SGFCPropertyTypeID,
  SGFCPropertyTypeL,
  SGFCPropertyTypeLT,
  SGFCPropertyTypeM,
  SGFCPropertyTypeOM,
  SGFCPropertyTypeOP,
  SGFCPropertyTypeOV,
  SGFCPropertyTypeRG,
  SGFCPropertyTypeSC,
  SGFCPropertyTypeSE,
  SGFCPropertyTypeSI,
  SGFCPropertyTypeTC,
  SGFCPropertyTypeWS,

  // ----------------------------------------------------------------------
  // Standard properties from FF4 for the game of Go (GM[1])
  // ----------------------------------------------------------------------

  /// @brief Defines the number of handicap stones. This is a game-specific
  /// property for the game of Go. Property value type: Number.
  ///
  /// Property value must be >= 2.
  ///
  /// When this property appears, the handicap stones should be set up with
  /// an AB property within the same node.
  ///
  /// This is a game info property.
  SGFCPropertyTypeHA,
  /// @brief Defines the komi value. This is a game-specific property for the
  /// game of Go. Property value type: Real.
  ///
  /// This is a game info property.
  SGFCPropertyTypeKM,
  SGFCPropertyTypeTB,
  SGFCPropertyTypeTW,

  // ----------------------------------------------------------------------
  // Non-standard properties
  // ----------------------------------------------------------------------

  /// @brief The property type is unknown, i.e. the property is a custom
  /// property not defined by the SGF standard.
  SGFCPropertyTypeUnknown,
};
