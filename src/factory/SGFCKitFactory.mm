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
#import "../../include/SGFCArguments.h"
#import "../../include/SGFCCommandLine.h"
#import "../../include/SGFCDocument.h"
#import "../../include/SGFCDocumentReader.h"
#import "../../include/SGFCDocumentWriter.h"
#import "../../include/SGFCGame.h"
#import "../../include/SGFCNode.h"
#import "../../include/SGFCKitFactory.h"
#import "../SGFCExceptionUtility.h"

@implementation SGFCKitFactory

#pragma mark - Public API

+ (SGFCArguments*) emptyArguments
{
  return [SGFCArguments emptyArguments];
}

+ (SGFCCommandLine*) commandLineWithArguments:(SGFCArguments*)arguments
{
  return [SGFCCommandLine commandLineWithArguments:arguments];
}

+ (SGFCCommandLine*) commandLineWithNoArguments
{
  return [SGFCCommandLine commandLineWithNoArguments];
}

+ (SGFCDocumentReader*) documentReader
{
  return [SGFCDocumentReader documentReader];
}

+ (SGFCDocumentWriter*) documentWriter
{
  return [SGFCDocumentWriter documentWriter];
}

+ (SGFCDocument*) document
{
  return [SGFCDocument document];
}

+ (SGFCDocument*) documentWithGame:(SGFCGame*)game
{
  return [SGFCDocument documentWithGame:game];
}

+ (SGFCGame*) game
{
  return [SGFCGame game];
}

+ (SGFCGame*) gameWithRootNode:(SGFCNode*)rootNode
{
  return [SGFCGame gameWithRootNode:rootNode];
}

+ (SGFCNode*) node
{
  return [SGFCNode node];
}

+ (SGFCPropertyFactory*) propertyFactory
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"propertyFactory"];
  return nil;
}

+ (SGFCPropertyValueFactory*) propertyValueFactory
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"propertyValueFactory"];
  return nil;
}

@end
