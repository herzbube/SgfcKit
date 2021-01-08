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
#import "../../include/SGFCRoundInformation.h"
#import "../SGFCMappingUtility.h"

// libsgfc++ includes
#import <libsgfcplusplus/SgfcRoundInformation.h>

// Prevent C++ name mangling
extern "C"
{
  SGFCRoundInformation SGFCRoundInformationMake(NSString* roundNumber, NSString* roundType, BOOL isValid)
  {
    SGFCRoundInformation roundInformation;

    roundInformation.RoundNumber = [NSString stringWithString:roundNumber];
    roundInformation.RoundType = [NSString stringWithString:roundType];
    roundInformation.IsValid = isValid;

    return roundInformation;
  }

  SGFCRoundInformation SGFCRoundInformationFromPropertyValue(NSString* propertyValue)
  {
    auto roundInformation = LibSgfcPlusPlus::SgfcRoundInformation::FromPropertyValue(
      [SGFCMappingUtility fromSgfcKitSimpleText:propertyValue]);

    return [SGFCMappingUtility toSgfcKitRoundInformation:roundInformation];
  }

  NSString* SGFCRoundInformationToPropertyValue(SGFCRoundInformation roundInformation)
  {
    LibSgfcPlusPlus::SgfcRoundInformation mappedRoundInformation =
      [SGFCMappingUtility fromSgfcKitRoundInformation:roundInformation];

    return [SGFCMappingUtility toSgfcKitString:LibSgfcPlusPlus::SgfcRoundInformation::ToPropertyValue(mappedRoundInformation)];
  }

  BOOL SGFCRoundInformationEqualToRoundInformation(SGFCRoundInformation roundInformation1, SGFCRoundInformation roundInformation2)
  {
    if (! [roundInformation1.RoundNumber isEqualToString:roundInformation2.RoundNumber])
      return NO;
    else if (! [roundInformation1.RoundType isEqualToString:roundInformation2.RoundType])
      return NO;
    else if (roundInformation1.IsValid != roundInformation2.IsValid)
      return NO;
    else
      return YES;
  }

  BOOL SGFCRoundInformationNotEqualToRoundInformation(SGFCRoundInformation roundInformation1, SGFCRoundInformation roundInformation2)
  {
    return SGFCRoundInformationEqualToRoundInformation(roundInformation1, roundInformation2) ? NO : YES;
  }
}
