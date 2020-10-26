set (
  SOURCES
  document/SGFCDocument.mm
  document/SGFCGame.mm
  document/SGFCNode.mm
  document/SGFCTreeBuilder.mm
  factory/SGFCKitFactory.mm
  game/SGFCBoardSize.mm
  SGFCConstants.mm
  SGFCExceptionUtility.mm
  ${SOURCES_LIST_FILE_NAME}
)

set (
  HEADERS_PRIVATE
  interface/internal/SGFCGameInternalAdditions.h
  interface/internal/SGFCNodeInternalAdditions.h
  interface/internal/SGFCTreeBuilderInternalAdditions.h
  SGFCExceptionUtility.h
)

set (
  HEADERS_PUBLIC
  ../include/SGFCBoardSize.h
  ../include/SGFCConstants.h
  ../include/SGFCDocument.h
  ../include/SGFCGame.h
  ../include/SGFCGameType.h
  ../include/SGFCKitFactory.h
  ../include/SGFCNode.h
  ../include/SGFCPropertyType.h
  ../include/SGFCTreeBuilder.h
  ../include/SGFCTypedefs.h
)
