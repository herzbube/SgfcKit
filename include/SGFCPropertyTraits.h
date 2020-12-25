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

/// @file

/// @brief An SGFCPropertyTraits value describes the traits of an
/// SGFCProperty object. The value is a combination of individual flags
/// defined in the SGFCPropertyTrait enumeration.
///
/// @ingroup public-api
///
/// All bitwise operators have been overloaded to make the SGFCPropertyTraits
/// typedef interoperate with the SGFCPropertyTrait enumeration as
/// conveniently as possible. There are some limitations, though, because
/// SGFCPropertyTraits is a typedef and not a true type (i.e. it's not a
/// class or struct). For instance, the assignment operator cannot be
/// overloaded so it's not possible to assign an SGFCPropertyTrait enumeration
/// member directly to an SGFCPropertyTraits variable. Consequently, whenever
/// SGFCPropertyTrait (the enum type) needs to be treated interchangeably with
/// SGFCPropertyTraits (the typdef) a static_cast must be done. This works
/// because SGFCPropertyTraits (the typedef) is used as the underlying type
/// of SGFCPropertyTrait (the enum type).
///
/// @verbatim
/// SGFCPropertyTraits traits = static_cast<SGFCPropertyTraits>(SGFCPropertyTraitInheritable);
/// @endverbatim
///
/// @see SGFCPropertyTraitsNone
/// @see SGFCPropertyTraitsAll
///
/// @note Using an unsigned numerical type as the underlying type of this
/// typedef is important to make the bitwise operators, specifically the
/// shift left and shift right operators, unambiguous and safe to use.
typedef unsigned long long SGFCPropertyTraits;

/// @brief SGFCPropertyTrait enumerates the individual traits that an
/// SGFCProperty object can have. An SGFCProperty object can have several
/// traits, which is why the enumeration values are defined as flags that can
/// be combined into a single SGFCPropertyTraits value.
///
/// @ingroup public-api
///
/// The SGF standard uses the term "property attribute" instead of
/// "property trait".
///
/// @see SGFCPropertyTraitsNone
/// @see SGFCPropertyTraitsAll
typedef NS_ENUM(SGFCPropertyTraits, SGFCPropertyTrait)
{
  /// @brief The property is an inheritable property. Inheritable properties
  /// are properties that affect not only the node contining these properties
  /// but also ALL subsequent child nodes, until a new setting is encountered
  /// or the setting is cleared.
  SGFCPropertyTraitInheritable = 1ULL,
};

/// @name Bitwise AND operators
//@{
/// @brief Bitwise AND operator, applying the right-hand-side trait operand
/// @a rhs to the left-hand-side traits operand @a lhs.
SGFCPropertyTraits operator&(SGFCPropertyTraits lhs, SGFCPropertyTrait rhs);
/// @brief Bitwise AND operator, combining the left-hand-side trait operand
/// @a lhs with the right-hand-side trait operand @ rhs.
///
/// This operator does not make much sense - the result will always be
/// SGFCPropertyTraitsNone
SGFCPropertyTraits operator&(SGFCPropertyTrait lhs, SGFCPropertyTrait rhs);
/// @brief Bitwise AND compound assignment operator, applying the
/// right-hand-side trait operand @a rhs to the left-hand-side traits
/// operand @a lhs.
SGFCPropertyTraits& operator&=(SGFCPropertyTraits& lhs, SGFCPropertyTrait rhs);
//@}

/// @name Bitwise OR operators
//@{
/// @brief Bitwise OR operator, applying the right-hand-side trait operand
/// @a rhs to the left-hand-side traits operand @a lhs.
SGFCPropertyTraits operator|(SGFCPropertyTraits lhs, SGFCPropertyTrait rhs);
/// @brief Bitwise OR operator, combining the left-hand-side trait operand
/// @a lhs with the right-hand-side trait operand @ rhs.
SGFCPropertyTraits operator|(SGFCPropertyTrait lhs, SGFCPropertyTrait rhs);
/// @brief Bitwise OR compound assignment operator, applying the
/// right-hand-side trait operand @a rhs to the left-hand-side traits
/// operand @a lhs.
SGFCPropertyTraits& operator|=(SGFCPropertyTraits& lhs, SGFCPropertyTrait rhs);
//@}

/// @name Bitwise XOR operators
//@{
/// @brief Bitwise XOR operator, applying the right-hand-side trait operand
/// @a rhs to the left-hand-side traits operand @a lhs.
SGFCPropertyTraits operator^(SGFCPropertyTraits lhs, SGFCPropertyTrait rhs);
/// @brief Bitwise XOR operator, combining the left-hand-side trait operand
/// @a lhs with the right-hand-side trait operand @ rhs.
///
/// This operator does not make much sense - the result will always be
/// SGFCPropertyTraitsNone
SGFCPropertyTraits operator^(SGFCPropertyTrait lhs, SGFCPropertyTrait rhs);
/// @brief Bitwise XOR compound assignment operator, applying the
/// right-hand-side trait operand @a rhs to the left-hand-side traits
/// operand @a lhs.
SGFCPropertyTraits& operator^=(SGFCPropertyTraits& lhs, SGFCPropertyTrait rhs);
//@}

/// @name Bitwise shift operators
//@{
/// @brief Bitwise left shift operator, shifting the left-hand-side traits
/// operand @a lhs by the number of bits in the right-hand-side operand
/// @a numberOfBitsToShift.
SGFCPropertyTraits operator<<(SGFCPropertyTrait lhs, unsigned short numberOfBitsToShift);

/// @brief Bitwise right shift operator, shifting the left-hand-side traits
/// operand @a lhs by the number of bits in the right-hand-side operand
/// @a numberOfBitsToShift.
SGFCPropertyTraits operator>>(SGFCPropertyTrait lhs, unsigned short numberOfBitsToShift);
//@}

/// @name Other bitwise operators
//@{
/// @brief Bitwise NOT operator, flipping all bits of the right-hand-side
/// trait operand @a rhs.
SGFCPropertyTraits operator~(SGFCPropertyTrait rhs);
//@}

