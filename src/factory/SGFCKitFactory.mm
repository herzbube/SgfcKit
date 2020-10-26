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
#import "../../include/SGFCDocument.h"
#import "../../include/SGFCNode.h"
#import "../../include/SGFCKitFactory.h"
#import "../SGFCExceptionUtility.h"

@implementation SGFCKitFactory

#pragma mark - Public API

+ (SGFCArguments*) emptyArguments
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"emptyArguments"];
  return nil;
}

+ (SGFCCommandLine*) commandLineWithArguments:(SGFCArguments*)arguments
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"commandLineWithArguments"];
  return nil;
}

+ (SGFCCommandLine*) commandLineWithNoArguments
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"commandLineWithNoArguments"];
  return nil;
}

+ (SGFCDocumentReader*) documentReader
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"documentReader"];
  return nil;
}

+ (SGFCDocumentWriter*) documentWriter
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"documentWriter"];
  return nil;
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
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"game"];
  return nil;
}

+ (SGFCGame*) gameWithRootNode:(SGFCNode*)rootNode
{
  [SGFCExceptionUtility raiseNotImplementedExceptionWithReason:@"gameWithRootNode"];
  return nil;
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
