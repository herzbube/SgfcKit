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
#import "../../include/SGFCGoRuleset.h"
#import "../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/SgfcGoRuleset.h>

SGFCGoRuleset SGFCGoRulesetMake(SGFCGoRulesetType goRulesetType, BOOL isValid)
{
  SGFCGoRuleset goRuleset;

  goRuleset.GoRulesetType = goRulesetType;
  goRuleset.IsValid = isValid;

  return goRuleset;
}

SGFCGoRuleset SGFCGoRulesetFromPropertyValue(NSString* propertyValue)
{
  auto mappedGoRuleset = LibSgfcPlusPlus::SgfcGoRuleset::FromPropertyValue(
    [SGFCMappingUtility fromSgfcKitSimpleText:propertyValue]);

  return SGFCGoRulesetMake(
    [SGFCMappingUtility toSgfcKitGoRulesetType:mappedGoRuleset.GoRulesetType],
    [SGFCMappingUtility toSgfcKitBoolean:mappedGoRuleset.IsValid]);
}

NSString* SGFCGoRulesetToPropertyValue(SGFCGoRuleset goRuleset)
{
  LibSgfcPlusPlus::SgfcGoRuleset mappedGoRuleset =
  {
    [SGFCMappingUtility fromSgfcKitGoRulesetType:goRuleset.GoRulesetType],
    [SGFCMappingUtility fromSgfcKitBoolean:goRuleset.IsValid],
  };

  return [SGFCMappingUtility toSgfcKitString:LibSgfcPlusPlus::SgfcGoRuleset::ToPropertyValue(mappedGoRuleset)];
}

BOOL SGFCGoRulesetEqualToGoRuleset(SGFCGoRuleset goRuleset1, SGFCGoRuleset goRuleset2)
{
  if (goRuleset1.GoRulesetType != goRuleset2.GoRulesetType)
    return NO;
  else if (goRuleset1.IsValid != goRuleset2.IsValid)
    return NO;
  else
    return YES;
}

BOOL SGFCGoRulesetNotEqualToGoRuleset(SGFCGoRuleset goRuleset1, SGFCGoRuleset goRuleset2)
{
  return SGFCGoRulesetEqualToGoRuleset(goRuleset1, goRuleset2) ? NO : YES;
}
