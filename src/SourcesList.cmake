set (
  SOURCES
  document/typedpropertyvalue/go/SGFCGoMovePropertyValue.mm
  document/typedpropertyvalue/go/SGFCGoPointPropertyValue.mm
  document/typedpropertyvalue/go/SGFCGoStonePropertyValue.mm
  document/typedpropertyvalue/SGFCColorPropertyValue.mm
  document/typedpropertyvalue/SGFCDoublePropertyValue.mm
  document/typedpropertyvalue/SGFCMovePropertyValue.mm
  document/typedpropertyvalue/SGFCNumberPropertyValue.mm
  document/typedpropertyvalue/SGFCPointPropertyValue.mm
  document/typedpropertyvalue/SGFCRealPropertyValue.mm
  document/typedpropertyvalue/SGFCSimpleTextPropertyValue.mm
  document/typedpropertyvalue/SGFCStonePropertyValue.mm
  document/typedpropertyvalue/SGFCTextPropertyValue.mm
  document/SGFCComposedPropertyValue.mm
  document/SGFCDocument.mm
  document/SGFCGame.mm
  document/SGFCNode.mm
  document/SGFCProperty.mm
  document/SGFCSinglePropertyValue.mm
  document/SGFCTreeBuilder.mm
  factory/SGFCKitFactory.mm
  factory/SGFCPropertyFactory.mm
  factory/SGFCPropertyValueFactory.mm
  game/go/SGFCGoGameInfo.mm
  game/go/SGFCGoMove.mm
  game/go/SGFCGoPlayerRank.mm
  game/go/SGFCGoPoint.mm
  game/go/SGFCGoRuleset.mm
  game/go/SGFCGoStone.mm
  game/NSValue+SGFCDate.mm
  game/SGFCBoardSize.mm
  game/SGFCDate.mm
  game/SGFCGameInfo.mm
  game/SGFCGameResult.mm
  game/SGFCRoundInformation.mm
  sgfc/argument/SGFCArgument.mm
  sgfc/argument/SGFCArguments.mm
  sgfc/frontend/SGFCCommandLine.mm
  sgfc/frontend/SGFCDocumentReader.mm
  sgfc/frontend/SGFCDocumentReadResult.mm
  sgfc/frontend/SGFCDocumentWriter.mm
  sgfc/frontend/SGFCDocumentWriteResult.mm
  sgfc/message/SGFCMessage.mm
  SGFCConstants.mm
  SGFCExceptionUtility.mm
  SGFCMappingUtility.mm
  SGFCPrivateConstants.mm
  SGFCWrappingUtility.mm
  ${SOURCES_LIST_FILE_NAME}
)

set (
  HEADERS_PRIVATE
  interface/internal/SGFCArgumentInternalAdditions.h
  interface/internal/SGFCArgumentsInternalAdditions.h
  interface/internal/SGFCColorPropertyValueInternalAdditions.h
  interface/internal/SGFCComposedPropertyValueInternalAdditions.h
  interface/internal/SGFCDocumentInternalAdditions.h
  interface/internal/SGFCDocumentReadResultInternalAdditions.h
  interface/internal/SGFCDocumentWriteResultInternalAdditions.h
  interface/internal/SGFCDoublePropertyValueInternalAdditions.h
  interface/internal/SGFCGameInfoInternalAdditions.h
  interface/internal/SGFCGameInternalAdditions.h
  interface/internal/SGFCGoGameInfoInternalAdditions.h
  interface/internal/SGFCGoMoveInternalAdditions.h
  interface/internal/SGFCGoMovePropertyValueInternalAdditions.h
  interface/internal/SGFCGoPointInternalAdditions.h
  interface/internal/SGFCGoPointPropertyValueInternalAdditions.h
  interface/internal/SGFCGoStoneInternalAdditions.h
  interface/internal/SGFCGoStonePropertyValueInternalAdditions.h
  interface/internal/SGFCMessageInternalAdditions.h
  interface/internal/SGFCMovePropertyValueInternalAdditions.h
  interface/internal/SGFCNodeInternalAdditions.h
  interface/internal/SGFCNumberPropertyValueInternalAdditions.h
  interface/internal/SGFCPointPropertyValueInternalAdditions.h
  interface/internal/SGFCPropertyInternalAdditions.h
  interface/internal/SGFCPropertyValueInternal.h
  interface/internal/SGFCRealPropertyValueInternalAdditions.h
  interface/internal/SGFCSimpleTextPropertyValueInternalAdditions.h
  interface/internal/SGFCSinglePropertyValueInternalAdditions.h
  interface/internal/SGFCStonePropertyValueInternalAdditions.h
  interface/internal/SGFCTextPropertyValueInternalAdditions.h
  interface/internal/SGFCTreeBuilderInternalAdditions.h
  SGFCExceptionUtility.h
  SGFCMappingUtility.h
  SGFCPrivateConstants.h
  SGFCWrappingUtility.h
)

set (
  MASTER_HEADER_FILE_TEMPLATE
  MasterHeaderFile.h.in
)

set (
  HEADERS_PUBLIC
  ../include/NSValue+SGFCDate.h
  ../include/SGFCArgument.h
  ../include/SGFCArguments.h
  ../include/SGFCArgumentType.h
  ../include/SGFCBoardSize.h
  ../include/SGFCColor.h
  ../include/SGFCColorPropertyValue.h
  ../include/SGFCCommandLine.h
  ../include/SGFCComposedPropertyValue.h
  ../include/SGFCConstants.h
  ../include/SGFCCoordinateSystem.h
  ../include/SGFCDate.h
  ../include/SGFCDocument.h
  ../include/SGFCDocumentReader.h
  ../include/SGFCDocumentReadResult.h
  ../include/SGFCDocumentWriter.h
  ../include/SGFCDocumentWriteResult.h
  ../include/SGFCDouble.h
  ../include/SGFCDoublePropertyValue.h
  ../include/SGFCExitCode.h
  ../include/SGFCGame.h
  ../include/SGFCGameInfo.h
  ../include/SGFCGameResult.h
  ../include/SGFCGameResultType.h
  ../include/SGFCGameType.h
  ../include/SGFCGoGameInfo.h
  ../include/SGFCGoMove.h
  ../include/SGFCGoMovePropertyValue.h
  ../include/SGFCGoPlayerRank.h
  ../include/SGFCGoPlayerRankType.h
  ../include/SGFCGoPlayerRatingType.h
  ../include/SGFCGoPoint.h
  ../include/SGFCGoPointNotation.h
  ../include/SGFCGoPointPropertyValue.h
  ../include/SGFCGoRuleset.h
  ../include/SGFCGoRulesetType.h
  ../include/SGFCGoStone.h
  ../include/SGFCGoStonePropertyValue.h
  ../include/SGFCMovePropertyValue.h
  ../include/SGFCKitFactory.h
  ../include/SGFCMessage.h
  ../include/SGFCMessageID.h
  ../include/SGFCMessageType.h
  ../include/SGFCNode.h
  ../include/SGFCNodeTraits.h
  ../include/SGFCNumberPropertyValue.h
  ../include/SGFCPointPropertyValue.h
  ../include/SGFCProperty.h
  ../include/SGFCPropertyCategory.h
  ../include/SGFCPropertyFactory.h
  ../include/SGFCPropertyTraits.h
  ../include/SGFCPropertyType.h
  ../include/SGFCPropertyValue.h
  ../include/SGFCPropertyValueFactory.h
  ../include/SGFCPropertyValueType.h
  ../include/SGFCRealPropertyValue.h
  ../include/SGFCRoundInformation.h
  ../include/SGFCSimpleTextPropertyValue.h
  ../include/SGFCSinglePropertyValue.h
  ../include/SGFCStonePropertyValue.h
  ../include/SGFCTextPropertyValue.h
  ../include/SGFCTreeBuilder.h
  ../include/SGFCTypedefs.h
  ../include/SGFCWinType.h
)
