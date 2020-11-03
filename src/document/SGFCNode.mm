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
#import "../interface/internal/SGFCPropertyInternalAdditions.h"
#import "../SGFCExceptionUtility.h"
#import "../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcNode.h>
#import <libsgfcplusplus/ISgfcProperty.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

// System includes
#import <Foundation/NSArray.h>

#pragma mark - Class extension

@interface SGFCNode()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcNode> _wrappedNode;
}
@end

@implementation SGFCNode

#pragma mark - Initialization and deallocation

+ (SGFCNode*) node
{
  return [[SGFCNode alloc] init];
}

- (id) init
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  _wrappedNode = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreateNode();
  _properties = [NSArray array];

  return self;

}

- (id) initPrivateWithWrappedNode:(std::shared_ptr<LibSgfcPlusPlus::ISgfcNode>)wrappedNode
{
  if (wrappedNode == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedNode\" is nullptr"];

  self = [self init];
  if (! self)
    return nil;

  _wrappedNode = wrappedNode;
  // wrappedNode has no properties so we can keep the empty properties array
  // from the designated initializer
}

- (void) dealloc
{
  _wrappedNode = nullptr;
  // Don't use property accessor because of nil check
  _properties = nil;
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

- (BOOL) hasChildren
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedNode->HasChildren()];
}

- (SGFCNode*) nextSibling
{
  return [self nodeOrNil:_wrappedNode->GetNextSibling()];
}

- (BOOL) hasNextSibling
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedNode->HasNextSibling()];
}

- (SGFCNode*) previousSibling
{
  return [self nodeOrNil:_wrappedNode->GetPreviousSibling()];
}

- (BOOL) hasPreviousSibling
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedNode->HasPreviousSibling()];
}

- (SGFCNode*) parent
{
  return [self nodeOrNil:_wrappedNode->GetParent()];
}

- (BOOL) hasParent
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedNode->HasParent()];
}

- (BOOL) isDescendantOfNode:(SGFCNode*)node
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedNode->IsDescendantOf([node wrappedNode])];
}

- (BOOL) isAncestorOfNode:(SGFCNode*)node
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedNode->IsAncestorOf([node wrappedNode])];
}

- (SGFCNode*) root
{
  return [self nodeOrNil:_wrappedNode->GetRoot()];
}

- (BOOL) isRoot
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedNode->IsRoot()];
}

- (void) setProperties:(NSArray*)properties
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:properties
                                                 invalidArgumentName:@"properties"];

  std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcProperty>> wrappedProperties;

  for (id propertyObject in properties)
  {
    if (! propertyObject)
      [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"properties\" contains a nil object"];
    if (! [propertyObject isKindOfClass:[SGFCProperty class]])
      [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"properties\" contains an object that is not of type SGFCProperty"];

    SGFCProperty* property = propertyObject;
    wrappedProperties.push_back([property wrappedProperty]);
  }

  try
  {
    _wrappedNode->SetProperties(wrappedProperties);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }

  _properties = properties;
}

- (SGFCProperty*) propertyWithType:(SGFCPropertyType)propertyType
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"propertyWithType"];
  return nil;
}

#pragma mark - Internal API - SGFCNodeInternalAdditions overrides

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
