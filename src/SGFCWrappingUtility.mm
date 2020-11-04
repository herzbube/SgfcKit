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
#import "interface/internal/SGFCColorPropertyValueInternalAdditions.h"
#import "interface/internal/SGFCDoublePropertyValueInternalAdditions.h"
#import "interface/internal/SGFCGoMovePropertyValueInternalAdditions.h"
#import "interface/internal/SGFCGoPointPropertyValueInternalAdditions.h"
#import "interface/internal/SGFCGoStonePropertyValueInternalAdditions.h"
#import "interface/internal/SGFCMessageInternalAdditions.h"
#import "interface/internal/SGFCMovePropertyValueInternalAdditions.h"
#import "interface/internal/SGFCNumberPropertyValueInternalAdditions.h"
#import "interface/internal/SGFCPointPropertyValueInternalAdditions.h"
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

+ (NSArray*) wrapMessages:(const std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcMessage>>&)messagesToWrap
{
  NSMutableArray* messages = [NSMutableArray arrayWithCapacity:0];

  for (auto messageToWrap : messagesToWrap)
  {
    [messages addObject:[[SGFCMessage alloc] initWithWrappedMessage:messageToWrap]];
  }

  return messages;
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

@end
