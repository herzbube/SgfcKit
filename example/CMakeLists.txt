include( ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCES_LIST_FILE_NAME} )
if ( NOT DEFINED SOURCES )
  message ( FATAL_ERROR "List of source files not defined by ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCES_LIST_FILE_NAME}" )
endif()

# Find the Foundation system framework. The basic objc system library is not
# sufficient because the project requires types such as NSString that are not
# defined in the library.
find_library ( FOUNDATION_SYSTEM_FRAMEWORK Foundation REQUIRED )

# Here we define the example executable target.
add_executable (
  ${EXAMPLE_EXECUTABLE_TARGET_NAME}
  ${SOURCES}
)

target_include_directories (
  ${EXAMPLE_EXECUTABLE_TARGET_NAME}
  # The examples treat SgfcKit itself as a third-party library, so the next
  # include directory is required to find the public interface headers.
  PRIVATE ../include
)

# We link against the shared library. We could also link against the static
# library, but this would be a bit slower.
target_link_libraries (
  ${EXAMPLE_EXECUTABLE_TARGET_NAME}
  ${LINK_LIBRARY_TARGET_NAME}
  ${FOUNDATION_SYSTEM_FRAMEWORK}
)

# Enable ARC
target_compile_options (
  ${EXAMPLE_EXECUTABLE_TARGET_NAME}
  PUBLIC
  ${COMPILE_OPTION_OBJECTIVE_C_ARC}
  ${COMPILE_OPTION_OBJECTIVE_C_ARC_EXCEPTIONS}
)
