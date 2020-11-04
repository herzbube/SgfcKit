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

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcMessage.h>

// C++ Standard Library includes
#import <memory>
#import <vector>

// System includes
#import <Foundation/NSObject.h>

// Forward declarations
@class NSArray;

/// @brief The SGFCWrappingUtility class is a container for various utility
/// functions related to wrapping libsgfc++ objects into the corresponding
/// SgfcKit objects.
///
/// @ingroup internals
/// @ingroup library-support
///
/// All functions in SGFCWrappingUtility are class methods, so there is no
/// need to create an instance of SGFCWrappingUtility.
@interface SGFCWrappingUtility : NSObject
{
}

/// @brief Returns a collection of newly created SGFCMessage objects that wrap
/// the libsgfc++ ISgfcMessage objects in @a messagesToWrap. The returned
/// collection has the same order as the input collection.
+ (NSArray*) wrapMessages:(const std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcMessage>>&)messagesToWrap;

@end
