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
#include "../../include/SGFCDocument.h"

// libsgfc++ includes
//#include <libsgfcplusplus/SgfcPlusPlusFactory.h>

// TODO xxx remove
#include <iostream>

@implementation SGFCDocument

#pragma mark - Initialization and deallocation

// -----------------------------------------------------------------------------
/// @brief Initializes an SGFCDocument object.
///
/// @note This is the designated initializer of SGFCDocument.
// -----------------------------------------------------------------------------
- (id) init
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;


  return self;
}

- (void) dealloc
{
  // TODO xxx remove
  std::cout << "SGFCDocument dealloc invoked" << std::endl;
}

#pragma mark - SGFCDocument overrides

- (bool) isEmpty
{
  return true;
}

- (void) setGames:(NSArray*)games
{
}

- (void) appendGame:(SGFCGame*)game
{
}

- (void) removeGame:(SGFCGame*)game
{
}

- (void) removeAllGames
{
}

- (void) debugPrintToConsole
{
  // TODO xxx remove
  std::cout << "SGFCDocument debugPrintToConsole invoked" << std::endl;
}

@end
