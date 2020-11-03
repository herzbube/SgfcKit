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
#import "../../../include/SGFCGoPoint.h"
#import "../../interface/internal/SGFCGoPointInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcGoPoint.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

#pragma mark - Class extension

@interface SGFCGoPoint()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcGoPoint> _wrappedGoPoint;
}

- (id) initWithWrappedGoPoint:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoPoint>)wrappedGoPoint NS_DESIGNATED_INITIALIZER;

@end

@implementation SGFCGoPoint

#pragma mark - Initialization and deallocation

- (id) init
{
  // Always raising an exception is intended. This guards against the library
  // client attempting to manually allocate/initialize an SGFCGoPoint.
  [SGFCExceptionUtility raiseInvalidOperationExceptionWithReason:@"SGFCGoPoint cannot be instantiated from outside of the library"];

  // Dummy return to make compiler happy (compiler does not see that an
  // exception is raised)
  return [self initWithWrappedGoPoint:nullptr];
}

- (id) initWithWrappedGoPoint:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoPoint>)wrappedGoPoint;
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  if (wrappedGoPoint == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedGoPoint\" is nullptr"];

  _wrappedGoPoint = wrappedGoPoint;

  return self;
}

- (void) dealloc
{
  _wrappedGoPoint = nullptr;
}

#pragma mark - Public API

- (NSUInteger) xPositionInCoordinateSystem:(SGFCCoordinateSystem)coordinateSystem
{
  return [SGFCMappingUtility toSgfcKitUInteger:_wrappedGoPoint->GetXPosition(
    [SGFCMappingUtility fromSgfcKitCoordinateSystem:coordinateSystem])];
}

- (NSUInteger) yPositionInCoordinateSystem:(SGFCCoordinateSystem)coordinateSystem
{
  return [SGFCMappingUtility toSgfcKitUInteger:_wrappedGoPoint->GetYPosition(
    [SGFCMappingUtility fromSgfcKitCoordinateSystem:coordinateSystem])];
}

- (BOOL) hasPositionInGoPointNotation:(SGFCGoPointNotation)goPointNotation
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedGoPoint->HasPosition(
    [SGFCMappingUtility fromSgfcKitGoPointNotation:goPointNotation])];
}

- (NSString*) positionInGoPointNotation:(SGFCGoPointNotation)goPointNotation
{
  return [SGFCMappingUtility toSgfcKitString:_wrappedGoPoint->GetPosition(
    [SGFCMappingUtility fromSgfcKitGoPointNotation:goPointNotation])];
}

- (NSString*) xPositionInGoPointNotation:(SGFCGoPointNotation)goPointNotation
{
  return [SGFCMappingUtility toSgfcKitString:_wrappedGoPoint->GetXPosition(
    [SGFCMappingUtility fromSgfcKitGoPointNotation:goPointNotation])];
}

- (NSString*) yPositionInGoPointNotation:(SGFCGoPointNotation)goPointNotation
{
  return [SGFCMappingUtility toSgfcKitString:_wrappedGoPoint->GetYPosition(
    [SGFCMappingUtility fromSgfcKitGoPointNotation:goPointNotation])];
}

@end
