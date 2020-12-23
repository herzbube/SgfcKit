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

/// @brief SGFCExitCode enumerates all SGFC exit codes supported by the
/// library.
///
/// @ingroup public-api
typedef NS_ENUM(NSUInteger, SGFCExitCode)
{
  /// @brief The SGFC operation did not generate any warning or error
  /// messages. If the #SGFCArgumentTypeDisableMessageID argument was
  /// passed to SGFC some messages may have been ignored.
  SGFCExitCodeOk = 0,

  /// @brief The SGFC operation generated one or more warning messages, but
  /// no fatal error messages and no non-fatal error messages.
  SGFCExitCodeWarning = 5,

  /// @brief The SGFC operation generated one or more error messages, but
  /// no fatal error messages. It may have generated 0-n warning messages.
  SGFCExitCodeError = 10,

  /// @brief The SGFC operation generated a fatal error message. It may have
  /// generated 0-n warning or error messages. Note that because the SGFC
  /// operation aborts immediately when a fatal error occurs, there is
  /// guaranteed to be exactly one fatal error message (i.e. not more than 1).
  SGFCExitCodeFatalError = 20,
};
