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
#import "../../../include/SGFCArguments.h"
#import "../../../include/SGFCDocumentWriter.h"
#import "../../interface/internal/SGFCDocumentInternalAdditions.h"
#import "../../SGFCExceptionUtility.h"
#import "../../SGFCMappingUtility.h"
#import "../../SGFCWrappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/ISgfcDocumentWriter.h>
#import <libsgfcplusplus/SgfcPlusPlusFactory.h>

// System includes
#import <Foundation/NSArray.h>

#pragma mark - Class extension

@interface SGFCDocumentWriter()
{
  std::shared_ptr<LibSgfcPlusPlus::ISgfcDocumentWriter> _wrappedDocumentWriter;
}

@property(nonatomic, strong, readwrite) SGFCArguments* arguments;

@end

@implementation SGFCDocumentWriter

#pragma mark - Initialization and deallocation

+ (SGFCDocumentWriter*) documentWriter
{
  return [[SGFCDocumentWriter alloc] init];
}

- (instancetype) init
{
  // Call designated initializer of superclass (NSObject)
  self = [super init];
  if (! self)
    return nil;

  _wrappedDocumentWriter = LibSgfcPlusPlus::SgfcPlusPlusFactory::CreateDocumentWriter();
  self.arguments = [SGFCWrappingUtility wrapArguments:_wrappedDocumentWriter->GetArguments()];

  return self;
}

- (void) dealloc
{
  _wrappedDocumentWriter = nullptr;
  self.arguments = nil;
}

#pragma mark - Public API

- (SGFCDocumentWriteResult*) writeSgfContent:(SGFCDocument*)document
                                      toFile:(NSString*)sgfFilePath
{
  try
  {
    auto wrappedDocumentWriteResult = _wrappedDocumentWriter->WriteSgfFile(
      [document wrappedDocument],
      [SGFCMappingUtility fromSgfcKitString:sgfFilePath]);
    return [SGFCWrappingUtility wrapDocumentWriteResult:wrappedDocumentWriteResult];
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseDocumentStructureExceptionWithCStringReason:exception.what()];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return nil;
  }
}

// See SGFCCommandLine.mm for comments on the "out" keyword.
- (SGFCDocumentWriteResult*) writeSgfContent:(SGFCDocument*)document
                                    toString:(out NSString**)sgfContent
{
  try
  {
    std::string wrappedSgfContent;
    auto wrappedDocumentWriteResult = _wrappedDocumentWriter->WriteSgfContent(
      [document wrappedDocument],
      wrappedSgfContent);

    *sgfContent = [SGFCMappingUtility toSgfcKitString:wrappedSgfContent];

    return [SGFCWrappingUtility wrapDocumentWriteResult:wrappedDocumentWriteResult];
  }
  catch (std::logic_error& exception)
  {
    [SGFCExceptionUtility raiseDocumentStructureExceptionWithCStringReason:exception.what()];

    // Dummy return to make compiler happy (compiler does not see that an
    // exception is raised)
    return nil;
  }
}

- (void) debugPrintToConsole:(SGFCDocument*)document
{
  _wrappedDocumentWriter->DebugPrintToConsole([document wrappedDocument]);
}

@end
