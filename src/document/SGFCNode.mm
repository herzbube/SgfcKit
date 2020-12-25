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
#import "../SGFCWrappingUtility.h"

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

+ (instancetype) node
{
  return [[self alloc] init];
}

- (instancetype) init
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  _wrappedNode = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreateNode();
  _properties = [NSArray array];

  return self;
}

- (instancetype) initWithWrappedNode:(std::shared_ptr<LibSgfcPlusPlus::ISgfcNode>)wrappedNode
{
  if (wrappedNode == nullptr)
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithReason:@"Argument \"wrappedNode\" is nullptr"];

  self = [self init];
  if (! self)
    return nil;

  _wrappedNode = wrappedNode;
  _properties = [SGFCWrappingUtility wrapProperties:_wrappedNode->GetProperties()];

  return self;
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

#pragma mark - Public API - Game tree navigation

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

- (BOOL) isRoot
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedNode->IsRoot()];
}

#pragma mark - Public API - Node traits

- (SGFCNodeTraits) traits
{
  return [SGFCMappingUtility toSgfcKitNodeTraits:_wrappedNode->GetTraits()];
}

- (BOOL) hasTrait:(SGFCNodeTrait)trait
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedNode->HasTrait(
    [SGFCMappingUtility fromSgfcKitNodeTrait:trait])];
}

#pragma mark - Public API - Game tree search

- (SGFCNode*) root
{
  return [SGFCWrappingUtility wrapNode:_wrappedNode->GetRoot()];
}

- (SGFCNode*) gameInfoNode
{
  return [self nodeOrNil:_wrappedNode->GetGameInfoNode()];
}

- (NSArray*) mainVariationNodes
{
  return [SGFCWrappingUtility wrapNodes:_wrappedNode->GetMainVariationNodes()];
}

#pragma mark - Public API - Property access

- (BOOL) hasProperties
{
  return [SGFCMappingUtility toSgfcKitBoolean:_wrappedNode->HasProperties()];
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

- (void) setProperty:(SGFCProperty*)property
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:property
                                                 invalidArgumentName:@"property"];

  _wrappedNode->SetProperty([property wrappedProperty]);
  _properties = [SGFCWrappingUtility wrapProperties:_wrappedNode->GetProperties()];
}

- (void) appendProperty:(SGFCProperty*)property
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:property
                                                 invalidArgumentName:@"property"];

  try
  {
    _wrappedNode->SetProperty([property wrappedProperty]);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }

  _properties = [SGFCWrappingUtility wrapProperties:_wrappedNode->GetProperties()];
}

- (void) removeProperty:(SGFCProperty*)property
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:property
                                                 invalidArgumentName:@"property"];

  try
  {
    _wrappedNode->RemoveProperty([property wrappedProperty]);
  }
  catch (std::invalid_argument& exception)
  {
    [SGFCExceptionUtility raiseInvalidArgumentExceptionWithCStringReason:exception.what()];
  }

  _properties = [SGFCWrappingUtility wrapProperties:_wrappedNode->GetProperties()];
}

- (void) removeAllProperties
{
  _wrappedNode->RemoveAllProperties();
  _properties = [SGFCWrappingUtility wrapProperties:_wrappedNode->GetProperties()];
}

- (SGFCProperty*) propertyWithType:(SGFCPropertyType)propertyType
{
  auto propertyWithType = _wrappedNode->GetProperty(
    [SGFCMappingUtility fromSgfcKitPropertyType:propertyType]);

  return [SGFCWrappingUtility wrapProperty:propertyWithType];
}

- (SGFCProperty*) propertyWithName:(NSString*)propertyName
{
  [SGFCExceptionUtility raiseInvalidArgumentExceptionIfArgumentIsNil:propertyName
                                                 invalidArgumentName:@"propertyName"];

  auto propertyWithName = _wrappedNode->GetProperty(
    [SGFCMappingUtility fromSgfcKitString:propertyName]);

  return [SGFCWrappingUtility wrapProperty:propertyWithName];
}

- (NSArray*) propertiesWithCategory:(SGFCPropertyCategory)propertyCategory
{
  auto propertiesWithCategory = _wrappedNode->GetProperties(
    [SGFCMappingUtility fromSgfcKitPropertyCategory:propertyCategory]);

  return [SGFCWrappingUtility wrapProperties:propertiesWithCategory];
}

- (NSArray*) inheritedProperties
{
  auto inheritedProperties = _wrappedNode->GetInheritedProperties();

  return [SGFCWrappingUtility wrapProperties:inheritedProperties];
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
    return [SGFCWrappingUtility wrapNode:wrappedNode];
}

@end
