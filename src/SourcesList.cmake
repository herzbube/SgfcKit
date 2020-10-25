set (
  SOURCES
  document/SGFCDocument.mm
  document/SGFCGame.mm
  factory/SGFCKitFactory.mm
  game/SGFCBoardSize.mm
  SGFCConstants.mm
  SGFCExceptionUtility.mm
  ${SOURCES_LIST_FILE_NAME}
)

set (
  HEADERS_PRIVATE
  interface/internal/SGFCGameInternalAdditions.h
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
  ../include/SGFCPropertyType.h
  ../include/SGFCTypedefs.h
)
