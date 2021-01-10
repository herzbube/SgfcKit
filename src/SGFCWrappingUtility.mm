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
#import "interface/internal/SGFCArgumentInternalAdditions.h"
#import "interface/internal/SGFCArgumentsInternalAdditions.h"
#import "interface/internal/SGFCBoardSizePropertyInternalAdditions.h"
#import "interface/internal/SGFCColorPropertyValueInternalAdditions.h"
#import "interface/internal/SGFCComposedPropertyValueInternalAdditions.h"
#import "interface/internal/SGFCDocumentInternalAdditions.h"
#import "interface/internal/SGFCDocumentReadResultInternalAdditions.h"
#import "interface/internal/SGFCDocumentWriteResultInternalAdditions.h"
#import "interface/internal/SGFCDoublePropertyValueInternalAdditions.h"
#import "interface/internal/SGFCGameInternalAdditions.h"
#import "interface/internal/SGFCGameInfoInternalAdditions.h"
#import "interface/internal/SGFCGameTypePropertyInternalAdditions.h"
#import "interface/internal/SGFCGoGameInfoInternalAdditions.h"
#import "interface/internal/SGFCGoMoveInternalAdditions.h"
#import "interface/internal/SGFCGoMovePropertyValueInternalAdditions.h"
#import "interface/internal/SGFCGoPointInternalAdditions.h"
#import "interface/internal/SGFCGoPointPropertyValueInternalAdditions.h"
#import "interface/internal/SGFCGoStoneInternalAdditions.h"
#import "interface/internal/SGFCGoStonePropertyValueInternalAdditions.h"
#import "interface/internal/SGFCMessageInternalAdditions.h"
#import "interface/internal/SGFCNodeInternalAdditions.h"
#import "interface/internal/SGFCMovePropertyValueInternalAdditions.h"
#import "interface/internal/SGFCNumberPropertyValueInternalAdditions.h"
#import "interface/internal/SGFCPointPropertyValueInternalAdditions.h"
#import "interface/internal/SGFCPropertyInternalAdditions.h"
#import "interface/internal/SGFCRealPropertyValueInternalAdditions.h"
#import "interface/internal/SGFCSimpleTextPropertyValueInternalAdditions.h"
#import "interface/internal/SGFCSinglePropertyValueInternalAdditions.h"
#import "interface/internal/SGFCStonePropertyValueInternalAdditions.h"
#import "interface/internal/SGFCTextPropertyValueInternalAdditions.h"
#import "SGFCExceptionUtility.h"
#import "SGFCWrappingUtility.h"

// System includes
#import <Foundation/NSArray.h>
#import <Foundation/NSString.h>

@implementation SGFCWrappingUtility

#pragma mark - Public API

+ (SGFCArgument*) wrapArgument:(std::shared_ptr<LibSgfcPlusPlus::ISgfcArgument>)argumentToWrap
{
  return [[SGFCArgument alloc] initWithWrappedArgument:argumentToWrap];
}

+ (NSArray*) wrapArgumentCollection:(const std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcArgument>>&)argumentCollectionToWrap
{
  NSMutableArray* argumentCollection = [NSMutableArray arrayWithCapacity:0];

  for (auto argumentToWrap : argumentCollectionToWrap)
  {
    SGFCArgument* argument = [SGFCWrappingUtility wrapArgument:argumentToWrap];
    [argumentCollection addObject:argument];
  }

  return argumentCollection;
}

+ (SGFCArguments*) wrapArguments:(std::shared_ptr<LibSgfcPlusPlus::ISgfcArguments>)argumentsToWrap
{
  return [[SGFCArguments alloc] initWithWrappedArguments:argumentsToWrap];
}

+ (SGFCDocument*) wrapDocument:(std::shared_ptr<LibSgfcPlusPlus::ISgfcDocument>)documentToWrap
{
  return [[SGFCDocument alloc] initWithWrappedDocument:documentToWrap];
}

+ (SGFCDocumentReadResult*) wrapDocumentReadResult:(std::shared_ptr<LibSgfcPlusPlus::ISgfcDocumentReadResult>)documentReadResultToWrap
{
  return [[SGFCDocumentReadResult alloc] initWithWrappedDocumentReadResult:documentReadResultToWrap];
}

+ (SGFCDocumentWriteResult*) wrapDocumentWriteResult:(std::shared_ptr<LibSgfcPlusPlus::ISgfcDocumentWriteResult>)documentWriteResultToWrap
{
  return [[SGFCDocumentWriteResult alloc] initWithWrappedDocumentWriteResult:documentWriteResultToWrap];
}

+ (NSArray*) wrapGames:(const std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcGame>>&)gamesToWrap
{
  NSMutableArray* games = [NSMutableArray arrayWithCapacity:0];

  for (auto gameToWrap : gamesToWrap)
  {
    [games addObject:[[SGFCGame alloc] initWithWrappedGame:gameToWrap]];
  }

  return games;
}

+ (SGFCGoMove*) wrapGoMove:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoMove>)goMoveToWrap
{
  return [[SGFCGoMove alloc] initWithWrappedGoMove:goMoveToWrap];
}

+ (SGFCGoPoint*) wrapGoPoint:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoPoint>)goPointToWrap
{
  return [[SGFCGoPoint alloc] initWithWrappedGoPoint:goPointToWrap];
}

+ (SGFCGoStone*) wrapGoStone:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoStone>)goStoneToWrap
{
  return [[SGFCGoStone alloc] initWithWrappedGoStone:goStoneToWrap];
}

+ (SGFCMessage*) wrapMessage:(std::shared_ptr<LibSgfcPlusPlus::ISgfcMessage>)messageToWrap
{
  return [[SGFCMessage alloc] initWithWrappedMessage:messageToWrap];
}

+ (NSArray*) wrapMessages:(const std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcMessage>>&)messagesToWrap
{
  NSMutableArray* messages = [NSMutableArray arrayWithCapacity:0];

  for (auto messageToWrap : messagesToWrap)
  {
    SGFCMessage* message = [SGFCWrappingUtility wrapMessage:messageToWrap];
    [messages addObject:message];
  }

  return messages;
}

+ (SGFCNode*) wrapNode:(std::shared_ptr<LibSgfcPlusPlus::ISgfcNode>)nodeToWrap
{
  return [[SGFCNode alloc] initWithWrappedNode:nodeToWrap];
}

+ (NSArray*) wrapNodes:(const std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcNode>>&)nodesToWrap
{
  NSMutableArray* nodes = [NSMutableArray arrayWithCapacity:0];

  for (auto nodeToWrap : nodesToWrap)
  {
    [nodes addObject:[[SGFCNode alloc] initWithWrappedNode:nodeToWrap]];
  }

  return nodes;
}

+ (SGFCProperty*) wrapProperty:(std::shared_ptr<LibSgfcPlusPlus::ISgfcProperty>)propertyToWrap
{
  SGFCProperty* property;

  // std::dynamic_pointer_cast performs a downcast and packages the
  // result into a shared_ptr, all in one go. Note: We can't use
  // std::static_pointer_cast because of multiple inheritance.

  switch (propertyToWrap->GetPropertyType())
  {
    case LibSgfcPlusPlus::SgfcPropertyType::GM:
    {
      std::shared_ptr<LibSgfcPlusPlus::ISgfcGameTypeProperty> gameTypePropertyToWrap =
        std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcGameTypeProperty>(propertyToWrap);
      property = [[SGFCGameTypeProperty alloc] initWithWrappedGameTypeProperty:gameTypePropertyToWrap];
      break;
    }
    case LibSgfcPlusPlus::SgfcPropertyType::SZ:
    {
      std::shared_ptr<LibSgfcPlusPlus::ISgfcBoardSizeProperty> boardSizePropertyToWrap =
        std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcBoardSizeProperty>(propertyToWrap);
      property = [[SGFCBoardSizeProperty alloc] initWithWrappedBoardSizeProperty:boardSizePropertyToWrap];
      break;
    }
    default:
    {
      property = [[SGFCProperty alloc] initWithWrappedProperty:propertyToWrap];
      break;
    }
  }

  return property;
}

+ (NSArray*) wrapProperties:(const std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcProperty>>&)propertiesToWrap
{
  NSMutableArray* properties = [NSMutableArray arrayWithCapacity:0];

  for (auto propertyToWrap : propertiesToWrap)
  {
    [properties addObject:[[SGFCProperty alloc] initWithWrappedProperty:propertyToWrap]];
  }

  return properties;
}

+ (id<SGFCPropertyValue>) wrapPropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcPropertyValue>)propertyValueToWrap
{
  id<SGFCPropertyValue> propertyValue = nil;

  // std::dynamic_pointer_cast performs a downcast and packages the
  // result into a shared_ptr, all in one go. Note: We can't use
  // std::static_pointer_cast because of multiple inheritance.

  if (propertyValueToWrap->IsComposedValue())
  {
    std::shared_ptr<LibSgfcPlusPlus::ISgfcComposedPropertyValue> composedPropertyValueToWrap =
      std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcComposedPropertyValue>(propertyValueToWrap);

    propertyValue = [[SGFCComposedPropertyValue alloc] initWithWrappedComposedPropertyValue:composedPropertyValueToWrap];
  }
  else
  {
    std::shared_ptr<LibSgfcPlusPlus::ISgfcSinglePropertyValue> singlePropertyValueToWrap =
      std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcSinglePropertyValue>(propertyValueToWrap);

    propertyValue = [SGFCWrappingUtility wrapSinglePropertyValue:singlePropertyValueToWrap];
  }

  return propertyValue;
}

+ (SGFCSinglePropertyValue*) wrapSinglePropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcSinglePropertyValue>)singlePropertyValueToWrap
{
  SGFCSinglePropertyValue* singlePropertyValue = nil;

  // std::dynamic_pointer_cast performs a downcast and packages the
  // result into a shared_ptr, all in one go. Note: We can't use
  // std::static_pointer_cast because of multiple inheritance.

    switch (singlePropertyValueToWrap->GetValueType())
    {
      case LibSgfcPlusPlus::SgfcPropertyValueType::Color:
      {
        std::shared_ptr<LibSgfcPlusPlus::ISgfcColorPropertyValue> colorPropertyValueToWrap =
          std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcColorPropertyValue>(singlePropertyValueToWrap);
        singlePropertyValue = [[SGFCColorPropertyValue alloc] initWithWrappedColorPropertyValue:colorPropertyValueToWrap];
        break;
      }
      case LibSgfcPlusPlus::SgfcPropertyValueType::Double:
      {
        std::shared_ptr<LibSgfcPlusPlus::ISgfcDoublePropertyValue> doublePropertyValueToWrap =
          std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcDoublePropertyValue>(singlePropertyValueToWrap);
        singlePropertyValue = [[SGFCDoublePropertyValue alloc] initWithWrappedDoublePropertyValue:doublePropertyValueToWrap];
        break;
      }
      case LibSgfcPlusPlus::SgfcPropertyValueType::Number:
      {
        std::shared_ptr<LibSgfcPlusPlus::ISgfcNumberPropertyValue> numberPropertyValueToWrap =
          std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcNumberPropertyValue>(singlePropertyValueToWrap);
        singlePropertyValue = [[SGFCNumberPropertyValue alloc] initWithWrappedNumberPropertyValue:numberPropertyValueToWrap];
        break;
      }
      case LibSgfcPlusPlus::SgfcPropertyValueType::Point:
      {
        std::shared_ptr<LibSgfcPlusPlus::ISgfcPointPropertyValue> pointPropertyValueToWrap =
          std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcPointPropertyValue>(singlePropertyValueToWrap);
        if (pointPropertyValueToWrap->ToGoPointValue())
        {
          std::shared_ptr<LibSgfcPlusPlus::ISgfcGoPointPropertyValue> goPointPropertyValueToWrap =
            std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcGoPointPropertyValue>(singlePropertyValueToWrap);
          singlePropertyValue = [[SGFCGoPointPropertyValue alloc] initWithWrappedGoPointPropertyValue:goPointPropertyValueToWrap];
        }
        else
        {
          singlePropertyValue = [[SGFCPointPropertyValue alloc] initWithWrappedPointPropertyValue:pointPropertyValueToWrap];
        }
        break;
      }
      case LibSgfcPlusPlus::SgfcPropertyValueType::Move:
      {
        std::shared_ptr<LibSgfcPlusPlus::ISgfcMovePropertyValue> movePropertyValueToWrap =
          std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcMovePropertyValue>(singlePropertyValueToWrap);
        if (movePropertyValueToWrap->ToGoMoveValue())
        {
          std::shared_ptr<LibSgfcPlusPlus::ISgfcGoMovePropertyValue> goMovePropertyValueToWrap =
            std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcGoMovePropertyValue>(singlePropertyValueToWrap);
          singlePropertyValue = [[SGFCGoMovePropertyValue alloc] initWithWrappedGoMovePropertyValue:goMovePropertyValueToWrap];
        }
        else
        {
          singlePropertyValue = [[SGFCMovePropertyValue alloc] initWithWrappedMovePropertyValue:movePropertyValueToWrap];
        }
        break;
      }
      case LibSgfcPlusPlus::SgfcPropertyValueType::Real:
      {
        std::shared_ptr<LibSgfcPlusPlus::ISgfcRealPropertyValue> realPropertyValueToWrap =
          std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcRealPropertyValue>(singlePropertyValueToWrap);
        singlePropertyValue = [[SGFCRealPropertyValue alloc] initWithWrappedRealPropertyValue:realPropertyValueToWrap];
        break;
      }
      case LibSgfcPlusPlus::SgfcPropertyValueType::SimpleText:
      {
        std::shared_ptr<LibSgfcPlusPlus::ISgfcSimpleTextPropertyValue> simpleTextPropertyValueToWrap =
          std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcSimpleTextPropertyValue>(singlePropertyValueToWrap);
        singlePropertyValue = [[SGFCSimpleTextPropertyValue alloc] initWithWrappedSimpleTextPropertyValue:simpleTextPropertyValueToWrap];
        break;
      }
      case LibSgfcPlusPlus::SgfcPropertyValueType::Stone:
      {
        std::shared_ptr<LibSgfcPlusPlus::ISgfcStonePropertyValue> stonePropertyValueToWrap =
          std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcStonePropertyValue>(singlePropertyValueToWrap);
        if (stonePropertyValueToWrap->ToGoStoneValue())
        {
          std::shared_ptr<LibSgfcPlusPlus::ISgfcGoStonePropertyValue> goStonePropertyValueToWrap =
            std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcGoStonePropertyValue>(singlePropertyValueToWrap);
          singlePropertyValue = [[SGFCGoStonePropertyValue alloc] initWithWrappedGoStonePropertyValue:goStonePropertyValueToWrap];
        }
        else
        {
          singlePropertyValue = [[SGFCStonePropertyValue alloc] initWithWrappedStonePropertyValue:stonePropertyValueToWrap];
        }
        break;
      }
      case LibSgfcPlusPlus::SgfcPropertyValueType::Text:
      {
        std::shared_ptr<LibSgfcPlusPlus::ISgfcTextPropertyValue> textPropertyValueToWrap =
          std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcTextPropertyValue>(singlePropertyValueToWrap);
        singlePropertyValue = [[SGFCTextPropertyValue alloc] initWithWrappedTextPropertyValue:textPropertyValueToWrap];
        break;
      }
      case LibSgfcPlusPlus::SgfcPropertyValueType::Unknown:
      {
        // libsgfc++ does not expose an interface for the internal
        // SgfcUnknownPropertyValue class, so SgfcKit does not have a specific
        // wrapper class either.

        singlePropertyValue = [[SGFCSinglePropertyValue alloc] initWithWrappedSinglePropertyValue:singlePropertyValueToWrap];
        break;
      }
      // Property value objects can never have value type None
      case LibSgfcPlusPlus::SgfcPropertyValueType::None:
      default:
      {
        NSString* reason = [NSString stringWithFormat:@"Property value object cannot be wrapped, unexpected value type: %d", static_cast<int>(singlePropertyValueToWrap->GetValueType())];
        [SGFCExceptionUtility raiseInternalInconsistencyExceptionWithReason:reason];
        break;
      }
    }

  return singlePropertyValue;
}

+ (NSArray*) wrapPropertyValues:(const std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcPropertyValue>>&)propertyValuesToWrap
{
  NSMutableArray* propertyValues = [NSMutableArray arrayWithCapacity:0];

  for (auto propertyValueToWrap : propertyValuesToWrap)
  {
    id<SGFCPropertyValue> propertyValue = [SGFCWrappingUtility wrapPropertyValue:propertyValueToWrap];
    [propertyValues addObject:propertyValue];
  }

  return propertyValues;
}

+ (SGFCGameInfo*) wrapGameInfo:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGameInfo>)gameInfoToWrap
{
  if (gameInfoToWrap->ToGoGameInfo() == nullptr)
  {
    return [[SGFCGameInfo alloc] initWithWrappedGameInfo:gameInfoToWrap];
  }
  else
  {
    auto goGameInfoToWrap = std::dynamic_pointer_cast<LibSgfcPlusPlus::ISgfcGoGameInfo>(gameInfoToWrap);
    return [[SGFCGoGameInfo alloc] initWithWrappedGoGameInfo:goGameInfoToWrap];
  }
}

@end
