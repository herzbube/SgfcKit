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
#import "../../include/SGFCTreeBuilder.h"
#import "../interface/internal/SGFCGameInternalAdditions.h"
#import "../interface/internal/SGFCNodeInternalAdditions.h"
#import "../interface/internal/SGFCTreeBuilderInternalAdditions.h"
#import "../SGFCExceptionUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcTreeBuilder.h>

#pragma mark - Class extension

@interface SGFCTreeBuilder()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcTreeBuilder> _wrappedTreeBuilder;
}
@end

@implementation SGFCTreeBuilder

#pragma mark - Initialization and deallocation

- (id) init
{
  // This always raises NSInvalidArgumentException! Implementing this
  // initializer guards against the library client attempting to manually
  // allocate/initialize an SGFCTreeBuilder.
  return [self initWithGame:nil];
}

- (id) initWithGame:(SGFCGame*)game
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:game
                                                 invalidArgumentName:@"game"];

  _wrappedTreeBuilder = [game wrappedGame]->GetTreeBuilder();
  _game = game;

  return self;
}

- (void) dealloc
{
  _wrappedTreeBuilder = nullptr;
  _game = nil;
}

#pragma mark - Public API

- (void) setFirstChild:(SGFCNode*)child
                ofNode:(SGFCNode*)node
{
  try
  {
    _wrappedTreeBuilder->SetFirstChild(
      [self wrappedNodeOrNullPtr:node],
      [self wrappedNodeOrNullPtr:child]);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }
}

- (void) appendChild:(SGFCNode*)child
              toNode:(SGFCNode*)node
{
  try
  {
    _wrappedTreeBuilder->AppendChild(
      [self wrappedNodeOrNullPtr:node],
      [self wrappedNodeOrNullPtr:child]);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }
}

- (void) insertChild:(SGFCNode*)child
              toNode:(SGFCNode*)node
beforeReferenceChild:(SGFCNode*)referenceChild
{
  try
  {
    _wrappedTreeBuilder->InsertChild(
      [self wrappedNodeOrNullPtr:node],
      [self wrappedNodeOrNullPtr:child],
      [self wrappedNodeOrNullPtr:referenceChild]);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }
}

- (void) removeChild:(SGFCNode*)child
            fromNode:(SGFCNode*)node
{
  try
  {
    _wrappedTreeBuilder->RemoveChild(
      [self wrappedNodeOrNullPtr:node],
      [self wrappedNodeOrNullPtr:child]);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }
}

- (void) replaceChild:(SGFCNode*)oldChild
         withNewChild:(SGFCNode*)newChild
               inNode:(SGFCNode*)node
{
  try
  {
    _wrappedTreeBuilder->ReplaceChild(
      [self wrappedNodeOrNullPtr:node],
      [self wrappedNodeOrNullPtr:newChild],
      [self wrappedNodeOrNullPtr:oldChild]);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }
}

- (void) setNextSibling:(SGFCNode*)nextSibling
                 ofNode:(SGFCNode*)node
{
  try
  {
    _wrappedTreeBuilder->SetNextSibling(
      [self wrappedNodeOrNullPtr:node],
      [self wrappedNodeOrNullPtr:nextSibling]);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }
}

- (void) setParent:(SGFCNode*)parent
            ofNode:(SGFCNode*)node
{
  try
  {
    _wrappedTreeBuilder->SetParent(
      [self wrappedNodeOrNullPtr:node],
      [self wrappedNodeOrNullPtr:parent]);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }
}

#pragma mark - Private API

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcNode>) wrappedNodeOrNullPtr:(SGFCNode*)node
{
  if (node)
    return [node wrappedNode];
  else
    return nullptr;
}

@end
