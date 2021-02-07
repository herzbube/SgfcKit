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
#import "../../interface/internal/SGFCGoStoneInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"
#import "../../SGFCWrappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcGoStone.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

#pragma mark - Class extension

@interface SGFCGoStone()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcGoStone> _wrappedGoStone;
}

- (instancetype) initWithWrappedGoStone:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoStone>)wrappedGoStone NS_DESIGNATED_INITIALIZER;

@property(nonatomic, strong, readwrite) SGFCGoPoint* location;

@end

@implementation SGFCGoStone

#pragma mark - Initialization and deallocation

- (instancetype) initWithWrappedGoStone:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoStone>)wrappedGoStone;
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
    self.location = [SGFCWrappingUtility wrapGoPoint:wrappedLocation];

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

@end
