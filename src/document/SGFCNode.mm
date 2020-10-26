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
#import "../../include/SGFCNode.h"
#import "../interface/internal/SGFCNodeInternalAdditions.h"
#import "../SGFCExceptionUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcNode.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

// System includes
#import <Foundation/NSArray.h>

#pragma mark - Class extension

@interface SGFCNode()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcNode> _wrappedNode;
}

@property(nonatomic, strong, readwrite) SGFCNode* firstChild;
@property(nonatomic, strong, readwrite) SGFCNode* nextSibling;
@property(nonatomic, weak, readwrite) SGFCNode* parent;

@end

@implementation SGFCNode

#pragma mark - Initialization and deallocation

+ (SGFCNode*) node
{
  return [[SGFCNode alloc] init];
}

- (id) init
{
  return [self initPrivateWithWrappedNode:LibSgfcPlusPlus::SgfcPlusPlusFactory::CreateNode()];
}

- (id) initPrivateWithWrappedNode:(std::shared_ptr<LibSgfcPlusPlus::ISgfcNode>)wrappedNode
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  if (wrappedNode == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedNode\" is nullptr"];

  _wrappedNode = wrappedNode;

  return self;
}

- (void) dealloc
{
  _wrappedNode = nullptr;
}

#pragma mark - NSObject overrides

- (BOOL) isEqualToNode:(SGFCNode*)aNode
{
  if (aNode == nil)
    return NO;
  else if (self == aNode)
    return YES;
  else
    return _wrappedNode == [aNode wrappedNode];
}

- (BOOL) isEqual:(id)anObject
{
  if (anObject == nil)
    return NO;
  else if (self == anObject)
    return YES;
  else if (! [anObject isKindOfClass:[self class]])
    return NO;
  else
    return _wrappedNode == [(SGFCNode*)anObject wrappedNode];
}

- (NSUInteger) hash
{
  return reinterpret_cast<NSUInteger>(_wrappedNode.get());
}

#pragma mark - Public API

- (SGFCNode*) firstChild
{
  return [self nodeOrNil:_wrappedNode->GetFirstChild()];
}

- (SGFCNode*) lastChild
{
  return [self nodeOrNil:_wrappedNode->GetLastChild()];
}

- (NSArray*) children
{
  NSMutableArray* array = [NSMutableArray arrayWithCapacity:0];

  for (auto wrappedChildNode : _wrappedNode->GetChildren())
  {
    [array addObject:[self nodeOrNil:wrappedChildNode]];
  }

  return array;
}

- (bool) hasChildren
{
  return _wrappedNode->HasChildren();
}

- (SGFCNode*) nextSibling
{
  return [self nodeOrNil:_wrappedNode->GetNextSibling()];
}

- (bool) hasNextSibling
{
  return _wrappedNode->HasNextSibling();
}

- (SGFCNode*) previousSibling
{
  return [self nodeOrNil:_wrappedNode->GetPreviousSibling()];
}

- (bool) hasPreviousSibling
{
  return _wrappedNode->HasPreviousSibling();
}

- (SGFCNode*) parent
{
  return [self nodeOrNil:_wrappedNode->GetParent()];
}

- (bool) hasParent
{
  return _wrappedNode->HasParent();
}

- (bool) isDescendantOfNode:(SGFCNode*)node
{
  return _wrappedNode->IsDescendantOf([node wrappedNode]);
}

- (bool) isAncestorOfNode:(SGFCNode*)node
{
  return _wrappedNode->IsAncestorOf([node wrappedNode]);
}

- (SGFCNode*) root
{
  return [self nodeOrNil:_wrappedNode->GetRoot()];
}

- (bool) isRoot
{
  return _wrappedNode->IsRoot();
}

- (NSArray*) properties
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"properties"];
  return nil;
}

- (SGFCProperty*) propertyWithType:(SGFCPropertyType)propertyType
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"propertyWithType"];
  return nil;
}

#pragma mark - Internal API

- (std::shared_ptr<LibSgfcPlusPlus::ISgfcNode>) wrappedNode
{
  return _wrappedNode;
}

#pragma mark - Private API

- (SGFCNode*) nodeOrNil:(std::shared_ptr<LibSgfcPlusPlus::ISgfcNode>)wrappedNode
{
  if (wrappedNode == nullptr)
    return nil;
  else
    return [[SGFCNode alloc] initPrivateWithWrappedNode:wrappedNode];
}

@end
