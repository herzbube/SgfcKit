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

/// @brief SGFCArgumentType enumerates the arguments that can be passed on to
/// SGFC when it reads or writes SGF content.
///
/// @ingroup public-api
///
/// Some arguments have a parameter, but most arguments do not. Unless
/// documented otherwise an argument does not have a parameter.
///
/// Some of the arguments with parameters can be specified multiple times.
/// Unless documented otherwise an argument can be specified only once.
///
/// Some arguments are specific for games of type Go (GM[1]), but most
/// arguments are generic. Unless documented otherwise an argument works for
/// all game types.
///
/// The following SGFC command line options are not supported as SGFC
/// arguments by SgfcKit:
/// - Option -k. The library currently does not support preserving the
///   header in front of the SGF data. See the libsgfc++ GitHub issue #24 for
///   details on this decision.
/// - Option -g. The library currently does not support game signatures.
/// - Option -v. The library currently does not support querying the SGFC
///   version.
/// - Option -s. The library currently does not support splitting a game
///   collection into separate files when writing out SGF content. This is
///   a limitation when working with ISgfcCommandLine. When working with
///   ISgfcDocumentWriter the library client can implement the splitting
///   function itself by writing out documents with a single game tree only.
/// - Option -c. Unlike the SGFC command line program, the library gives the
///   client free rein in writing out SGF content even when it was read with
///   critical errors. It is the library client's job to examine the parse
///   results and take appropriate steps when it encounters critical errors.
/// - Options -i, -h and --help. The library does not support these options
///   because they are useful only for an interactive command line program.
typedef NS_ENUM(NSUInteger, SGFCArgumentType)
{
  /// @brief Select how to search for the beginning of SGF data. This argument
  /// requires a numeric parameter value 1, 2 or 3. The corresponding SGFC
  /// command line option is -bx.
  ///
  /// The parameter values 1-3 have the following meaning:
  /// - 1 = Advanced search algorithm (default)
  /// - 2 = First occurence of "(;"
  /// - 3 = First occurence of "("
  ///
  /// The advanced search algorithm can be said to be a combination of
  /// the more simple and straightforward algorithms 2 and 3. SGFC basically
  /// searches for "(;", but some erroneous files mark the beginning only
  /// with "(". To detect such files SGFC uses a more sophisticated search.
  /// In rare cases this might go wrong, so if you find yourself in that
  /// position you may wish to use the algorithm 2 or 3.
  ///
  /// The argument is invalid if you specify a parameter value that is not
  /// 1, 2 or 3.
  SGFCArgumentTypeBeginningOfSgfData,

  /// @brief Disable a given message ID. This argument requires an
  /// SGFCMessageID parameter value, the value denotes the ID of the message
  /// to disable. This argument can be specified multiple times.
  /// The corresponding SGFC command line option is -dn.
  ///
  /// If you feel that the SGFC syntax checking is too pedantic and generates
  /// too many messages, then you can use this argument to reduce the number
  /// of messages. You cannot use this argument to disable fatal error
  /// messages.
  ///
  /// Hints for a few non-critical warnings that you may wish to disable are
  /// #SGFCMessageIDEmptyValueDeleted,
  /// #SGFCMessageIDRequestedPropertyDeleted (since these messages are
  /// generated in response to an explicit request by the library client) and
  /// #SGFCMessageIDPropertyNotDefinedInFF.
  SGFCArgumentTypeDisableMessageID,

  /// @brief Disable @b all warning messages. The corresponding SGFC command
  /// line option is -w.
  ///
  /// If you feel that the SGFC syntax checking is too pedantic and generates
  /// too many messages, then you can use this argument to reduce the number
  /// of messages.
  ///
  /// Use this argument with care!
  SGFCArgumentTypeDisableWarningMessages,

  /// @brief Select how to interpret line breaks when reading Text property
  /// values. This argument requires a numeric parameter value 1, 2, 3 or 4.
  /// The corresponding SGFC command line option is -lx.
  ///
  /// This argument only affects how SGFC interprets SGF content during
  /// reading. When SGFC writes SGF content the output is always in FF4
  /// format.
  ///
  /// The parameter values 1-4 have the following meaning:
  /// - 1 = A line break preceded by a backslash ("\") character is treated
  ///       as a soft line break. All other line breaks are treated as a hard
  ///       line break. This is the default behaviour.
  /// - 2 = A line break preceded by a backslash ("\") character is treated
  ///       as a soft line break. A line break preceded by a space character
  ///       is converted to a space character (the result is that there are
  ///       now two space characters, the one that was in the original SGF
  ///       content and the one that was created by converting the line
  ///       break). All other line breaks are treated as a hard line break.
  ///       The SGFC documentation indicates that the MS-DOS/Windows
  ///       application "MGT" writes SGF content in this format.
  /// - 3 = A line break preceded by a backslash ("\") character is treated
  ///       as a soft line break. A single line break is converted to a space
  ///       character. Two line breaks are treated as a hard line break.
  /// - 4 = Experimentally determined that this seems to be almost the same
  ///       as parameter value 3. The distinction seems to be that the double
  ///       line break is preserved on writing. The SGFC documentation
  ///       characterizes this line break behaviour as "paragraph style
  ///       (ISHI format, MFGO)".
  ///
  /// The argument is invalid if you specify a parameter value that is not
  /// 1, 2, 3 or 4.
  ///
  /// @todo Find out more about parameter value 4. What does "paragraph style"
  /// mean? What is the ISHI format? MFGO is likely the abbreviation for the
  /// Go playing application "Many Faces of Go".
  SGFCArgumentTypeHardLineBreakMode,

  /// @brief When writing SGF content try to make each line end at the end of
  /// a node. The corresponding SGFC command line option is -L.
  ///
  /// This argument affects how SGFC formats the output when it writes SGF
  /// content:
  /// - By default SGFC attempts to keep the line length to a certain maximum.
  ///   If that length were to be exceeded SGFC inserts a line break before it
  ///   writes out the next property. In case of a Text property SGFC inserts
  ///   a soft line break in the middle of the property value.
  /// - When this argument is specified, SGFC instead focuses on keeping a
  ///   node's content on the same line, inserting a line break before it
  ///   writes out the next node. This can lead to longer lines being written
  ///   when a node has many properties or properties have many values. Also
  ///   SGFC does not insert soft line breaks in the middle of a Text property
  ///   value.
  SGFCArgumentTypeLineBreakAtEndOfNode,

  /// @brief Do not insert soft line breaks into Text values. The
  /// corresponding SGFC command line option is -t.
  ///
  /// This argument affects how SGFC formats the output when it writes SGF
  /// content:
  /// - By default SGFC attempts to keep the line length to a certain maximum.
  ///   If that length were to be exceeded SGFC inserts a line break before it
  ///   writes out the next property. In case of a Text property SGFC inserts
  ///   a soft line break in the middle of the property value.
  /// - When this argument is specified, SGFC never inserts soft line breaks in
  ///   the middle of a Text property value.
  ///
  /// Old SGF handling applications that pre-date FF4 cannot deal with soft
  /// line breaks. If you are concerned about compatibility to old
  /// applications you should specify this argument to avoid soft line breaks.
  SGFCArgumentTypeNoSoftLineBreaksInTextValues,

  /// @brief Delete markup on current move. This argument works only for games
  /// of type Go (GM[1]). The corresponding SGFC command line option is -m.
  ///
  /// Definition of "markup on current move":
  /// - A node contains a move property (e.g. B[aa]).
  /// - The same node also contains a markup property (MA, CR, TR, SQ, SL).
  /// - The markup property marks the point on which the move in the same
  ///   node played a stone.
  ///
  /// Some Go game servers create SGF files where the current move is marked
  /// with e.g. a circle (CR[]). Some people find this annoying. Specifying
  /// this argument tells SGFC to delete any markup properties on the position
  /// of the current move.
  ///
  /// @note When a markup property is deleted because of this argument type,
  /// this results in an error type message with
  /// #SGFCMessageIDPositionNotUnique. Example:
  /// "Markup <CR> position not unique ([partially] deleted)".
  SGFCArgumentTypeDeleteMarkupOnCurrentMove,

  /// @brief Delete empty nodes, i.e. nodes that contain no properties. The
  /// corresponding SGFC command line option is -n.
  ///
  /// There are empty nodes which cannot be deleted. These nodes are:
  /// - Root node, if it has more than one child.
  /// - A node which has siblings and has more than one child.
  ///
  /// @note When an empty node is deleted because of this argument type,
  /// this results in a warning type message with
  /// #SGFCMessageIDEmptyNodeDeleted. Example: "empty node deleted".
  SGFCArgumentTypeDeleteEmptyNodes,

  /// @brief Delete obsolete properties, i.e. properties that are not part of
  /// FF4. The corresponding SGFC command line option is -o.
  ///
  /// SGFC knows all FF4 properties (general ones and Go specific ones) and
  /// all FF1-FF3 properties. Properties that are defined only in FF1-FF3 but
  /// not in FF4 are considered obsolete. When this argument is specified
  /// SGFC deletes all such obsolete properties it encounters. Exceptions:
  /// - "L" is converted to its FF4 counterpart "LB".
  /// - "M" is converted to an FF4 counterpart, either "MA" or "TR".
  ///
  /// @note When an obsolete property is deleted because of this argument
  /// type, this results in a warning type message with
  /// #SGFCMessageIDRequestedPropertyDeleted. Example:
  /// "obsolete property <EL> deleted". Regardless of whether this argument
  /// type is used or not, SGFC generates a warning type message with
  /// #SGFCMessageIDPropertyNotDefinedInFF when it encounters an obsolete
  /// property. Example:
  /// "property <EL> is not defined in FF[4] (parsing done anyway)".
  SGFCArgumentTypeDeleteObsoleteProperties,

  /// @brief Delete unknown properties, i.e. properties that are not part of
  /// FF1-FF4. The corresponding SGFC command line option is -u.
  ///
  /// SGFC knows all FF4 properties (general ones and Go specific ones) and
  /// all FF1-FF3 properties. Properties that are not defined in any of these
  /// versions of the SGF standard are considered to be private properties of
  /// the application that was used to create the SGF content. When this
  /// argument is specified SGFC deletes all such unknown properties it
  /// encounters. Exceptions:
  /// - The "KI" property, which is a private property of the
  ///   "Smart Game Board" application (SGB), is converted to its FF4
  ///   counterpart "KM".
  ///
  /// @note When an unknown property is deleted because of this argument
  /// type, this results in a warning type message with
  /// #SGFCMessageIDUnknownPropertyDeleted. Example:
  /// "unknown property <XX> deleted".
  SGFCArgumentTypeDeleteUnknownProperties,

  /// @brief Delete properties of a given property type. This argument
  /// requires an SgfcPropertyType parameter value, the value denotes the
  /// properties to delete. This option can be specified multiple times. The
  /// corresponding SGFC command line option is -yP.
  ///
  /// SGFC converts certain obsolete and unknown properties to an FF4
  /// counterpart. To delete these properties you have to specify their
  /// original type, i.e. the type before the conversion takes place. Exmaple:
  /// SGFC converts the "L" property to its FF4 counterpart "LB". You have
  /// to specify SgfcPropertyType::L do delete this property.
  ///
  /// The SgfcPropertyType enumeration contains a number of values for
  /// properties that SGFC does not know about. Example: Game-specific
  /// property types like "CO" (Backgammon) or "BO" (Octi). The argument is
  /// invalid if you specify an SgfcPropertyType value that refers to a
  /// property type that is not known by SGFC.
  ///
  /// @note When a property is deleted because of this argument type, this
  /// results in a warning type message with
  /// #SGFCMessageIDRequestedPropertyDeleted. Example:
  /// "property <FF> deleted".
  SGFCArgumentTypeDeletePropertyType,

  /// @brief Write pass moves as "[tt]" if possible. This argument works only
  /// for games of type Go (GM[1]). The corresponding SGFC command line option
  /// is -p.
  ///
  /// The Go-specific part of FF4 specifies that pass moves should be written
  /// with an empty property value (e.g. B[]). For compatibility with FF3
  /// the value "tt" is still allowed, though (e.g. B[tt]). Specifying this
  /// argument causes SGFC to write pass moves out using the old "tt"
  /// notation. This is only possible if the board size is <= 19x19, because
  /// for board sizes 20x20 and larger the value "tt" refers to a valid
  /// location on the board. So for board sizes 20x20 and larger, SGFC writes
  /// a pass move with an empty property value even if this argument is
  /// specified.
  SGFCArgumentTypeUseOldPassMoveNotation,

  /// @brief Enable restrictive checking. The corresponding SGFC command line
  /// option is -r.
  ///
  /// If this argument is set then SGFC is even more pedantic than usual. The
  /// argument is designed to flag all kinds of bad style or uncommon
  /// characteristics that can cause problems with applications that are just
  /// able to deal with common cases. For example, if the SGF content contains
  /// more than one game tree SGFC now issues an error instead of a warning.
  ///
  /// Furthermore for games of type Go (GM[1]) SGFC now checks that no two
  /// successive moves have the same color, that no setup properties
  /// (AB/AW/AE) appear in the main branch apart from the root node, and that
  /// the "HA" property is set correctly.
  SGFCArgumentTypeEnableRestrictiveChecking,

  /// @brief Correct variation level and root moves. Variation level
  /// correction works only for games of type Go (GM[1]). The corresponding
  /// SGFC command line option is -v.
  ///
  /// It is bad style to have alternative moves at different tree levels. Some
  /// applications chose that way to represent variations as siblings instead
  /// of children - they add a child node, remove the latest move by using an
  /// "AE" property and put the alternative move into the node. When this
  /// argument is specified SGFC tries to correct such variations. Note that
  /// this kind of corrective action works only for games of type Go (GM[1]).
  ///
  /// Example: >>(;GM[1];B[aa](;W[bb])(;AE[aa]B[cc])(;AE[aa]B[dd]))<<
  /// Correct: >>(;GM[1](;B[aa];W[bb])(;B[cc])(;B[dd]))<<
  ///
  /// Another bad style is having the first move in the root node of a game
  /// tree. When this argument is specified SGFC splits the root node into
  /// two nodes and moves the first move into the second node. Note that this
  /// kind of corrective action works for all game types.
  ///
  /// Example: >>(;GM[1]C[first move in root node]GC[bad style]B[aa])<<
  /// Correct: >>(;GM[1]GC[good style];B[aa]C[first move not in root node])<<
  ///
  /// @note Variation fixes and root move fixes made because of this argument
  /// type result in warning type messages with
  /// #SGFCMessageIDVariationLevelCorrected and
  /// #SGFCMessageIDMoveInRootNodeSplit, respectively.
  /// Examples: "variation level corrected" and "move in root node found
  /// (splitted node into two)".
  SGFCArgumentTypeCorrectVariationLevelAndRootMoves,

  /// @brief Reverse ordering of variations. The corresponding SGFC command
  /// line option is -z.
  ///
  /// It is bad style to have the main line of the game not in the main branch
  /// (variation "A"). When this argument is specified SGFC reverses the
  /// ordering of all variations in a game tree, assuming that the main line
  /// of the game is actually in the last branch. Example: Variations A,B,C,D
  /// are reordered as D,C,B,A.
  ///
  /// The function can reorder only up to a hardcoded limit of variations
  /// of a single node. If you hit this limit you need to adjust the
  /// preprocessor macro MAX_REORDER_VARIATIONS in file all.h to a higher
  /// value and recompile SGFC and libsgfc++.
  SGFCArgumentTypeReverseVariationOrdering,

  /// @brief When writing SGF content, expand compressed point lists. This
  /// argument works only for games of type Go (GM[1]). The corresponding SGFC
  /// command line option is -e.
  ///
  /// This argument affects how SGFC formats the output when it writes SGF
  /// content:
  /// - By default when the game type is Go (GM[1]) and SGFC encounters a
  ///   property with a point list value type (e.g. property "MA"), it
  ///   attempts to compress the point values to take advantage of the FF4
  ///   "compressed point lists" format. If SGFC reads in SGF content that
  ///   already contains point lists in the compressed format, it retains the
  ///   compressed format when writing the SGF content.
  /// - When this argument is specified, SGFC does not compress uncompressed
  ///   point lists, and it actively expands point lists that were in the
  ///   compressed format in the original SGF content.
  ///
  /// Old SGF handling applications that pre-date FF4 cannot deal with the
  /// compressed format. If you are concerned about compatibility to old
  /// applications you should specify this argument to avoid compressed point
  /// lists.
  SGFCArgumentTypeExpandCompressedPointLists,
};
