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
#import "../../../include/SGFCGoStone.h"
#import "../../interface/internal/SGFCGoPointInternalAdditions.h"
#import "../../interface/internal/SGFCGoStoneInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcGoStone.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

#pragma mark - Class extension

@interface SGFCGoStone()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcGoStone> _wrappedGoStone;
}

@property(nonatomic, strong, readwrite) SGFCGoPoint* location;

@end

@implementation SGFCGoStone

#pragma mark - Initialization and deallocation

- (id) init
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  // Always raising an exception is intended. This guards against the library
  // client attempting to manually allocate/initialize an SGFCGoStone.
  [SGFCExceptionUtility raiseInvalidOperationExceptionWithReason:@"SGFCGoStone cannot be instantiated from outside of the library"];

  // Dummy return to make compiler happy (compiler does not see that an
  // exception is raised)
  return self;
}

- (id) initWithWrappedGoStone:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoStone>)wrappedGoStone;
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  if (wrappedGoStone == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedGoStone\" is nullptr"];

  _wrappedGoStone = wrappedGoStone;

  auto wrappedLocation = _wrappedGoStone->GetLocation();
  if (wrappedLocation == nullptr)
    self.location = nil;
  else
    self.location = [[SGFCGoPoint alloc] initWithWrappedGoPoint:wrappedLocation];

  return self;
}

- (void) dealloc
{
  _wrappedGoStone = nullptr;
  self.location = nil;
}

#pragma mark - Public API

- (SGFCColor) color
{
  return [SGFCMappingUtility toSgfcKitColor:_wrappedGoStone->GetColor()];
}

- (BOOL) hasLocation
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedGoStone->HasLocation()];
}

@end
