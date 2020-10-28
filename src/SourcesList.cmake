set (
  SOURCES
  document/SGFCDocument.mm
  document/SGFCGame.mm
  document/SGFCNode.mm
  document/SGFCTreeBuilder.mm
  factory/SGFCKitFactory.mm
  game/SGFCBoardSize.mm
  sgfc/argument/SGFCArgument.mm
  sgfc/argument/SGFCArguments.mm
  SGFCConstants.mm
  SGFCExceptionUtility.mm
  SGFCMappingUtility.mm
  SGFCPrivateConstants.mm
  ${SOURCES_LIST_FILE_NAME}
)

set (
  HEADERS_PRIVATE
  interface/internal/SGFCArgumentInternalAdditions.h
  interface/internal/SGFCArgumentsInternalAdditions.h
  interface/internal/SGFCGameInternalAdditions.h
  interface/internal/SGFCNodeInternalAdditions.h
  interface/internal/SGFCTreeBuilderInternalAdditions.h
  SGFCExceptionUtility.h
  SGFCMappingUtility.h
  SGFCPrivateConstants.h
)

set (
  HEADERS_PUBLIC
  ../include/SGFCArgument.h
  ../include/SGFCArguments.h
  ../include/SGFCArgumentType.h
  ../include/SGFCBoardSize.h
  ../include/SGFCColor.h
  ../include/SGFCConstants.h
  ../include/SGFCDocument.h
  ../include/SGFCDouble.h
  ../include/SGFCGame.h
  ../include/SGFCGameType.h
  ../include/SGFCKitFactory.h
  ../include/SGFCNode.h
  ../include/SGFCPropertyType.h
  ../include/SGFCPropertyValueType.h
  ../include/SGFCTreeBuilder.h
  ../include/SGFCTypedefs.h
)
