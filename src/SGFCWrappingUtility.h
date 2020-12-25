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

#pragma once

// C++ Standard Library includes
#import <memory>
#import <vector>

// System includes
#import <Foundation/NSObject.h>

// Forward declarations
@class NSArray;
@class SGFCArgument;
@class SGFCArguments;
@class SGFCDocument;
@class SGFCDocumentReadResult;
@class SGFCDocumentWriteResult;
@class SGFCGoMove;
@class SGFCGoPoint;
@class SGFCGoStone;
@class SGFCMessage;
@class SGFCNode;
@class SGFCProperty;
@class SGFCSinglePropertyValue;
@protocol SGFCPropertyValue;

namespace LibSgfcPlusPlus
{
  class ISgfcArgument;
  class ISgfcArguments;
  class ISgfcDocument;
  class ISgfcDocumentReadResult;
  class ISgfcDocumentWriteResult;
  class ISgfcGame;
  class ISgfcGoMove;
  class ISgfcGoPoint;
  class ISgfcGoStone;
  class ISgfcMessage;
  class ISgfcNode;
  class ISgfcProperty;
  class ISgfcPropertyValue;
  class ISgfcSinglePropertyValue;
}

/// @brief The SGFCWrappingUtility class is a container for various utility
/// functions related to wrapping libsgfc++ objects into the corresponding
/// SgfcKit objects.
///
/// @ingroup internals
/// @ingroup library-support
///
/// All functions in SGFCWrappingUtility are class methods, so there is no
/// need to create an instance of SGFCWrappingUtility.
@interface SGFCWrappingUtility : NSObject
{
}

/// @brief Returns a newly created SGFCArgument object that
/// wraps the libsgfc++ ISgfcArgument object @a argumentToWrap.
+ (SGFCArgument*) wrapArgument:(std::shared_ptr<LibSgfcPlusPlus::ISgfcArgument>)argumentToWrap;

/// @brief Returns a collection of newly created SGFCArgument objects that wrap
/// the libsgfc++ ISgfcArgument objects in @a argumentCollectionToWrap. The returned
/// collection has the same order as the input collection.
+ (NSArray*) wrapArgumentCollection:(const std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcArgument>>&)argumentCollectionToWrap;

/// @brief Returns a newly created SGFCArgument object that
/// wraps the libsgfc++ ISgfcArgument object @a argumentToWrap.
+ (SGFCArguments*) wrapArguments:(std::shared_ptr<LibSgfcPlusPlus::ISgfcArguments>)argumentsToWrap;

/// @brief Returns a newly created SGFCDocument object that
/// wraps the libsgfc++ ISgfcDocument object @a documentToWrap.
+ (SGFCDocument*) wrapDocument:(std::shared_ptr<LibSgfcPlusPlus::ISgfcDocument>)documentToWrap;

/// @brief Returns a newly created SGFCDocumentReadResult object that
/// wraps the libsgfc++ ISgfcDocumentReadResult object
/// @a documentReadResultToWrap.
+ (SGFCDocumentReadResult*) wrapDocumentReadResult:(std::shared_ptr<LibSgfcPlusPlus::ISgfcDocumentReadResult>)documentReadResultToWrap;

/// @brief Returns a newly created SGFCDocumentWriteResult object that
/// wraps the libsgfc++ ISgfcDocumentWriteResult object
/// @a documentWriteResultToWrap.
+ (SGFCDocumentWriteResult*) wrapDocumentWriteResult:(std::shared_ptr<LibSgfcPlusPlus::ISgfcDocumentWriteResult>)documentWriteResultToWrap;

/// @brief Returns a collection of newly created SGFCGame objects that wrap
/// the libsgfc++ ISgfcGame objects in @a gamesToWrap. The returned
/// collection has the same order as the input collection.
+ (NSArray*) wrapGames:(const std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcGame>>&)gamesToWrap;

/// @brief Returns a newly created SGFCGoMove object that
/// wraps the libsgfc++ ISgfcGoMove object @a goMoveToWrap.
+ (SGFCGoMove*) wrapGoMove:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoMove>)goMoveToWrap;

/// @brief Returns a newly created SGFCGoPoint object that
/// wraps the libsgfc++ ISgfcGoPoint object @a goPointToWrap.
+ (SGFCGoPoint*) wrapGoPoint:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoPoint>)goPointToWrap;

/// @brief Returns a newly created SGFCGoStone object that
/// wraps the libsgfc++ ISgfcGoStone object @a goStoneToWrap.
+ (SGFCGoStone*) wrapGoStone:(std::shared_ptr<LibSgfcPlusPlus::ISgfcGoStone>)goStoneToWrap;

/// @brief Returns a newly created SGFCMessage object that
/// wraps the libsgfc++ ISgfcMessage object @a messageToWrap.
+ (SGFCMessage*) wrapMessage:(std::shared_ptr<LibSgfcPlusPlus::ISgfcMessage>)messageToWrap;

/// @brief Returns a collection of newly created SGFCMessage objects that wrap
/// the libsgfc++ ISgfcMessage objects in @a messagesToWrap. The returned
/// collection has the same order as the input collection.
+ (NSArray*) wrapMessages:(const std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcMessage>>&)messagesToWrap;

/// @brief Returns a newly created SGFCNode object that
/// wraps the libsgfc++ ISgfcNode object @a nodeToWrap.
+ (SGFCNode*) wrapNode:(std::shared_ptr<LibSgfcPlusPlus::ISgfcNode>)nodeToWrap;

/// @brief Returns a collection of newly created SGFCNode objects that wrap
/// the libsgfc++ ISgfcNode objects in @a nodesToWrap. The returned
/// collection has the same order as the input collection.
+ (NSArray*) wrapNodes:(const std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcNode>>&)nodesToWrap;

/// @brief Returns a newly created SGFCProperty object that
/// wraps the libsgfc++ ISgfcProperty object @a propertyToWrap.
+ (SGFCProperty*) wrapProperty:(std::shared_ptr<LibSgfcPlusPlus::ISgfcProperty>)propertyToWrap;

/// @brief Returns a collection of newly created SGFCProperty objects that wrap
/// the libsgfc++ ISgfcProperty objects in @a propertiesToWrap. The returned
/// collection has the same order as the input collection.
+ (NSArray*) wrapProperties:(const std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcProperty>>&)propertiesToWrap;

/// @brief Returns a newly created SGFCPropertyValue object that
/// wraps the libsgfc++ ISgfcPropertyValue object @a propertyValueToWrap.
+ (id<SGFCPropertyValue>) wrapPropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcPropertyValue>)propertyValueToWrap;

/// @brief Returns a newly created SGFCPropertyValue object that
/// wraps the libsgfc++ ISgfcPropertyValue object @a propertyValueToWrap.
+ (SGFCSinglePropertyValue*) wrapSinglePropertyValue:(std::shared_ptr<LibSgfcPlusPlus::ISgfcSinglePropertyValue>)singlePropertyValueToWrap;

/// @brief Returns a collection of newly created SGFCPropertyValue objects that
/// wrap the libsgfc++ ISgfcPropertyValue objects in @a propertiesToWrap. The
/// returned collection has the same order as the input collection.
+ (NSArray*) wrapPropertyValues:(const std::vector<std::shared_ptr<LibSgfcPlusPlus::ISgfcPropertyValue>>&)propertyValuesToWrap;

@end
