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
#import "../../../include/SGFCDocumentReader.h"
#import "../../SGFCMappingUtility.h"
#import "../../SGFCWrappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcDocumentReader.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

// System includes
#import <Foundation/NSArray.h>

#pragma mark - Class extension

@interface SGFCDocumentReader()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcDocumentReader> _wrappedDocumentReader;
}

@property(nonatomic, strong, readwrite) SGFCArguments* arguments;

@end

@implementation SGFCDocumentReader

#pragma mark - Initialization and deallocation

+ (SGFCDocumentReader*) documentReader
{
  return [[SGFCDocumentReader alloc] init];
}

- (id) init
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  _wrappedDocumentReader = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreateDocumentReader();
  self.arguments = [SGFCWrappingUtility wrapArguments:_wrappedDocumentReader->GetArguments()];

  return self;
}

- (void) dealloc
{
  _wrappedDocumentReader = nullptr;
  self.arguments = nil;
}

#pragma mark - Public API

- (SGFCDocumentReadResult*) readSgfContentFromFile:(NSString*)sgfFilePath
{
  auto wrappedDocumentReadResult = _wrappedDocumentReader->ReadSgfFile(
    [SGFCMappingUtility fromSgfcKitString:sgfFilePath]);
  return [SGFCWrappingUtility wrapDocumentReadResult:wrappedDocumentReadResult];
}

- (SGFCDocumentReadResult*) readSgfContentFromString:(NSString*)sgfContent
{
  auto wrappedDocumentReadResult = _wrappedDocumentReader->ReadSgfContent(
    [SGFCMappingUtility fromSgfcKitString:sgfContent]);
  return [SGFCWrappingUtility wrapDocumentReadResult:wrappedDocumentReadResult];
}

@end
