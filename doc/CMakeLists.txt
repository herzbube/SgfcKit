include( ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCES_LIST_FILE_NAME} )
if ( NOT DEFINED SOURCES )
  message ( FATAL_ERROR "List of source files not defined by ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCES_LIST_FILE_NAME}" )
endif()
if ( NOT DEFINED OUTPUT_DIRECTORIES )
  message ( FATAL_ERROR "List of output directories not defined by ${CMAKE_CURRENT_SOURCE_DIR}/${SOURCES_LIST_FILE_NAME}" )
endif()

# We don't care about sub-components of Doxygen (e.g. dot). Because we don't
# mention them here they are treated as optional.
find_package ( Doxygen )

if ( ${DOXYGEN_FOUND} )

  # Variables prefixed with "DOXYGEN_" will cause doxygen_add_docs() to set the
  # corresponding setting in the generated Doxygen configuration file to the
  # variable's value. Example: "DOXYGEN_FOO=bar" will cause "FOO=bar" in the
  # Doxygen config file.
  #
  # Variables which we expect doxygen_add_docs() to set up on its own:
  # - DOXYGEN_PROJECT_NAME = PROJECT_NAME
  # - DOXYGEN_PROJECT_NUMBER = PROJECT_VERSION
  # - DOXYGEN_PROJECT_BRIEF = PROJECT_DESCRIPTION
  # - DOXYGEN_GENERATE_LATEX = NO
  # - DOXYGEN_RECURSIVE = YES
  # - DOXYGEN_OUTPUT_DIRECTORY = CMAKE_CURRENT_BINARY_DIR
  set ( DOXYGEN_IGNORE_PREFIX SGFC )
  set ( DOXYGEN_USE_MDFILE_AS_MAINPAGE ../README.md )

  # The following three variables are needed so that Doxygen is able to parse
  # enumeration typedefs like this:
  #   typedef NS_ENUM(NSUInteger, EnumType)
  #
  # MACRO_EXPANSION = YES     We let Doxygen expand preprocessor macros
  # EXPAND_ONLY_PREDEF = YES  But only those that are in the PREDEFINED setting
  # PREDEFINED = ...          Here we re-define "NS_ENUM" to "enum", which is a
  #                           keyword known to Doxygen
  set ( DOXYGEN_MACRO_EXPANSION YES )
  set ( DOXYGEN_EXPAND_ONLY_PREDEF YES )
  set ( DOXYGEN_PREDEFINED "NS_ENUM(enum_type,enum_name)=enum enum_name" )
  
  # This constructs a Doxyfile and defines a custom target that runs Doxygen on
  # that generated file. Files listed explicitly as input are added as SOURCES
  # of the custom target so they will show up in an IDE project's source list.
  # We don't specify the parameter ALL because we don't want the documentation
  # to be built automatically every time a build is made.
  doxygen_add_docs (
    ${DOCUMENTATION_TARGET_NAME}
    ${SOURCES}
  )

  # Because the documentation-generating target set up by doxygen_add_docs()
  # above is not part of ALL, the files to be installed here must also be marked
  # with EXCLUDE_FROM_ALL. Instead we associate them with a component that has
  # the same name as the doc target so that they can be installed with the
  # command line option --component.
  install (
    DIRECTORY ${OUTPUT_DIRECTORIES}
    TYPE DOC
    COMPONENT ${DOCUMENTATION_TARGET_NAME}
    EXCLUDE_FROM_ALL
  )

endif()
