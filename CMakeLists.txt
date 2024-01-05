# We are requiring 3.10 only because that's the minimum version required by the
# tutorial of the 3.17 release, on which this CMake file is based. We possibly
# could do with a lower version.
cmake_minimum_required ( VERSION 3.10 )

# As a side effect this command sets PROJECT_SOURCE_DIR, PROJECT_BINARY_DIR and
# a few other variables.
# The source directory is the folder where the CMakeLists.txt file resides.
# The binary directory is the folder where CMake is executed.
project (
  # The project name.
  # Sets PROJECT_NAME and, because this is the top-level CMakeLists.txt, also
  # CMAKE_PROJECT_NAME.
  SgfcKit

  # OBJC = Objective-C
  # OBJCXX = Objective-C++
  # C only to support CMake when it detects compiler capabilities during
  #   generation of the build system. Apparently CMake tries to compile
  #   several .c files for this detection. If LANGUAGES contains only OBJC
  #   then the probing fails with several error messages similar to this:
  #     [...]
  #     Unknown extension ".c" for file
  #     try_compile() works only for enabled languages.  Currently these are:
  #     [...]
  LANGUAGES OBJC OBJCXX C

  # The project version.
  # Sets PROJECT_VERSION, PROJECT_VERSION_MAJOR, PROJECT_VERSION_MINOR,
  # PROJECT_VERSION_PATCH and PROJECT_VERSION_TWEAK.
  VERSION 2.0.1

  # Some informational package metadata. Not necessary for the build.
  # Sets PROJECT_HOMEPAGE_URL and PROJECT_DESCRIPTION
  HOMEPAGE_URL https://github.com/herzbube/SgfcKit
  DESCRIPTION "An Objective-C library that uses SGFC for reading and writing SGF (Smart Game Format) data."
)

set (
  SEPARATOR_LINE "--------------------------------------------------------------------------------"
)
message ( STATUS ${SEPARATOR_LINE} )
message ( STATUS ${PROJECT_NAME} )
message ( STATUS ${PROJECT_DESCRIPTION} )
message ( STATUS ${PROJECT_HOMEPAGE_URL} )
message ( STATUS ${SEPARATOR_LINE} )

# Print some information that may help with identifying build issues
message ( STATUS "CMAKE_VERSION = ${CMAKE_VERSION}" )
if ( ${MSVC} )
  message ( STATUS "MSVC_VERSION = ${MSVC_VERSION}" )
endif()

# Specify the C++ standard
# If we don't set a standard the compiler has problems parsing the upstream
# header files. To be on the safe side we set the same version of the standard
# that libsgfc++ uses.
set ( CMAKE_CXX_STANDARD 17 )
set ( CMAKE_CXX_STANDARD_REQUIRED True )

# Enable testing for this folder and all subfolders. Because this appears in
# the top-level CMakeLists.txt file it enables testing for the entire project.
# CMakeLists.txt in sub-folders can now add tests with the add_test() command.
# We need enable_testing() in this top-level CMakeLists.txt so that CMake
# generates a "test" target (i.e. "make test").
enable_testing ()

# Define a base name that is used throughout the build system to form the
# filesystem name of the build artifacts. Notably this determines the name of
# the generated shared library file, static library file and test executable
# file. The project-specific subdirectory where the public header files are
# installed is also derived from the base name.
set ( LIBRARY_BASE_NAME SgfcKit )

# Define target names
set ( SHARED_LIBRARY_TARGET_NAME ${LIBRARY_BASE_NAME}_shared )
set ( STATIC_LIBRARY_TARGET_NAME ${LIBRARY_BASE_NAME}_static )
set ( SHARED_OBJECT_LIBRARY_TARGET_NAME ${SHARED_LIBRARY_TARGET_NAME}_objects )
set ( STATIC_OBJECT_LIBRARY_TARGET_NAME ${STATIC_LIBRARY_TARGET_NAME}_objects )
set ( SHARED_FRAMEWORK_TARGET_NAME ${SHARED_LIBRARY_TARGET_NAME}_framework )
set ( STATIC_FRAMEWORK_TARGET_NAME ${STATIC_LIBRARY_TARGET_NAME}_framework )
set ( TEST_EXECUTABLE_TARGET_NAME ${LIBRARY_BASE_NAME}-test )
set ( EXAMPLE_EXECUTABLE_TARGET_NAME ${LIBRARY_BASE_NAME}-example )
set ( DOCUMENTATION_TARGET_NAME ${LIBRARY_BASE_NAME}-doc )

# Define target output basic names. The regular prefix and suffix will still be
# tacked on.
set ( SHARED_LIBRARY_OUTPUT_NAME ${LIBRARY_BASE_NAME} )
set ( STATIC_LIBRARY_OUTPUT_NAME ${STATIC_LIBRARY_TARGET_NAME} )
set ( SHARED_FRAMEWORK_OUTPUT_NAME ${LIBRARY_BASE_NAME} )
set ( STATIC_FRAMEWORK_OUTPUT_NAME ${STATIC_LIBRARY_TARGET_NAME} )

# On some systems the module GNUInstallDirs is auto-included, but on other
# systems it is not, for unknown reasons. Examples where it's auto-included:
# macOS with CMake 3.11 and Xcode, Windows with CMake 3.16 and VisualStudio.
# Example where it's not included: Ubuntu 18.04 with CMake 3.12 and GCC (the
# Travis build system "bionic"). We manually include the module because our
# install() commands base their destinations on the variables defined by the
# module (e.g. CMAKE_INSTALL_LIBDIR).
if ( NOT DEFINED CMAKE_INSTALL_LIBDIR )
  message ( STATUS "Including module GNUInstallDirs, was not auto-included" )
  include ( GNUInstallDirs )
endif()

# The destination folder name to be used for frameworks. Use a relative path
# here. This is equivalent to "lib" or "include" for library and header
# destinations.
set ( FRAMEWORK_DESTINATION_FOLDER_NAME "Frameworks" )

# Library artifacts generated by a debug configuration build are named
# differently than those generated by release configuration builds.
set ( CMAKE_DEBUG_POSTFIX "d" )

# Every subfolder contains a "sources list" file that must have the following
# file name. The file enumerates the source files to be compiled, and possibly
# other files as well (e.g. public headers). The CMakeLists.txt includes this
# "sources list" file and thus remains relatively succinct. This solution is
# also better than letting CMake make up the file list via globbing, because
# with globbing CMake would not reconfigure when the file list changes in the
# filesystem.
set ( SOURCES_LIST_FILE_NAME "SourcesList.cmake" )

# Enable the Automatic Reference Counting (ARC) feature of the Objective-C
# compiler. Note that you can't just toggle this off (with -fno-objc-arc)
# because the library's code was explicitly written with no manual memory
# management.
set ( COMPILE_OPTION_OBJECTIVE_C_ARC "-fobjc-arc" )
# Enable exception-safe ARC. This is enabled by default in Objective-C++,
# which makes up a lot if not most of the library's code. Nevertheless we
# explicitly enable this option to be on the safe side, also in the future.
# Cf. https://clang.llvm.org/docs/AutomaticReferenceCounting.html#exceptions.
set ( COMPILE_OPTION_OBJECTIVE_C_ARC_EXCEPTIONS "-fobjc-arc-exceptions" )

# Define a number of variables for working with the libsgfc++ library
set ( LIBSGFCPLUSPLUS_VERSION 2.0.1 )
set ( LIBSGFCPLUSPLUS_LIBRARY_BASE_NAME libsgfcplusplus )
set ( LIBSGFCPLUSPLUS_PACKAGE_NAME ${LIBSGFCPLUSPLUS_LIBRARY_BASE_NAME} )
set ( LIBSGFCPLUSPLUS_PACKAGE_FOUND_VARIABLE_NAME ${LIBSGFCPLUSPLUS_PACKAGE_NAME}_FOUND )
set ( LIBSGFCPLUSPLUS_TARGET_NAMESPACE ${LIBSGFCPLUSPLUS_LIBRARY_BASE_NAME} )
set ( LIBSGFCPLUSPLUS_SHARED_LIBRARY_TARGET_NAME ${LIBSGFCPLUSPLUS_TARGET_NAMESPACE}::${LIBSGFCPLUSPLUS_LIBRARY_BASE_NAME}_shared )
set ( LIBSGFCPLUSPLUS_STATIC_LIBRARY_TARGET_NAME ${LIBSGFCPLUSPLUS_TARGET_NAMESPACE}::${LIBSGFCPLUSPLUS_LIBRARY_BASE_NAME}_static )
set ( LIBSGFCPLUSPLUS_SHARED_FRAMEWORK_TARGET_NAME ${LIBSGFCPLUSPLUS_SHARED_LIBRARY_TARGET_NAME}_framework )
set ( LIBSGFCPLUSPLUS_STATIC_FRAMEWORK_TARGET_NAME ${LIBSGFCPLUSPLUS_STATIC_LIBRARY_TARGET_NAME}_framework )

# Attempt to find the libsgfc++ package, first as a system-wide package, then
# if that fails in a custom location. The default is to look in the libsgfc++
# Git submodule, but the user can override this.
find_package (
  ${LIBSGFCPLUSPLUS_PACKAGE_NAME}
  ${LIBSGFCPLUSPLUS_VERSION}
  EXACT
  QUIET
)
if ( ${${LIBSGFCPLUSPLUS_PACKAGE_FOUND_VARIABLE_NAME}} )
  message ( STATUS "Found system-wide libsgfc++ CMake package." )
  message ( STATUS "${LIBSGFCPLUSPLUS_PACKAGE_FOUND_VARIABLE_NAME} = ${${LIBSGFCPLUSPLUS_PACKAGE_FOUND_VARIABLE_NAME}}" )
else()
  message ( STATUS "System-wide libsgfc++ CMake package not found." )

  if ( NOT DEFINED LIBSGFCPLUSPLUS_INSTALLATION_PREFIX )
    message ( STATUS "Using default installation prefix to find libsgfc++ CMake package." )
    message ( STATUS "Define LIBSGFCPLUSPLUS_INSTALLATION_PREFIX to override this." )
    # A well known path within the libsgfc++ Git submodule where we expect the
    # user to have installed a version of libsgfc++ that was built from the
    # sources in the Git submodule.
    set ( LIBSGFCPLUSPLUS_INSTALLATION_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/libsgfcplusplus/build/install" )
  else()
    message ( STATUS "Using user-provided installation prefix to find libsgfc++ CMake package." )
  endif()

  # When cross-compiling for iOS find_package ignores the folder specified for
  # the PATHS option. Directly setting the <PackageName>_DIR variable causes
  # find_package to skip the search for the package's config file.
  if (${CMAKE_SYSTEM_NAME} STREQUAL "iOS")
    set ( ${LIBSGFCPLUSPLUS_PACKAGE_NAME}_DIR "${LIBSGFCPLUSPLUS_INSTALLATION_PREFIX}/lib/${LIBSGFCPLUSPLUS_PACKAGE_NAME}" )
    message ( STATUS "iOS cross-compiling hack: Setting ${LIBSGFCPLUSPLUS_PACKAGE_NAME}_DIR = ${${LIBSGFCPLUSPLUS_PACKAGE_NAME}_DIR}" )
  endif()

  find_package (
    ${LIBSGFCPLUSPLUS_PACKAGE_NAME}
    ${LIBSGFCPLUSPLUS_VERSION}
    EXACT
    QUIET
    PATHS ${LIBSGFCPLUSPLUS_INSTALLATION_PREFIX}
  )
  if ( ${${LIBSGFCPLUSPLUS_PACKAGE_FOUND_VARIABLE_NAME}} )
    message ( STATUS "Found libsgfc++ CMake package in installation prefix ${LIBSGFCPLUSPLUS_INSTALLATION_PREFIX}." )
  else()
    message ( FATAL_ERROR "libsgfc++ CMake package not found in installation prefix ${LIBSGFCPLUSPLUS_INSTALLATION_PREFIX}." )
  endif()
endif()

# Define defaults for optional build parts
if ( NOT DEFINED ENABLE_DEFAULT )
  set ( ENABLE_DEFAULT YES )
endif()
if ( NOT DEFINED ENABLE_SHARED_LIBRARY )
  # Unless the user explicitly requests it by setting ENABLE_SHARED_LIBRARY to
  # YES, don't build the shared library for iOS. The reason: The shared library
  # needs codesigning, but the project does not provide a codesigning identity,
  # so the iOS build would fail. We don't want that, so by default we don't
  # build the shared library for iOS.
  if (NOT ${CMAKE_SYSTEM_NAME} STREQUAL "iOS")
    set ( ENABLE_SHARED_LIBRARY ${ENABLE_DEFAULT} )
  else()
    set ( ENABLE_SHARED_LIBRARY NO )
  endif()
endif()
if ( NOT DEFINED ENABLE_STATIC_LIBRARY )
  set ( ENABLE_STATIC_LIBRARY ${ENABLE_DEFAULT} )
endif()
if ( NOT DEFINED ENABLE_SHARED_FRAMEWORK )
  # Unless the user explicitly requests it by setting ENABLE_SHARED_FRAMEWORK to
  # YES, don't build the shared library framework for iOS. For the reason see
  # the comments above why we also don't build the shared library for iOS.
  if (NOT ${CMAKE_SYSTEM_NAME} STREQUAL "iOS")
    set ( ENABLE_SHARED_FRAMEWORK ${ENABLE_DEFAULT} )
  else()
    set ( ENABLE_SHARED_FRAMEWORK NO )
  endif()
endif()
if ( NOT DEFINED ENABLE_STATIC_FRAMEWORK )
  set ( ENABLE_STATIC_FRAMEWORK ${ENABLE_DEFAULT} )
endif()
if ( NOT DEFINED ENABLE_TESTS )
  # Unless the user explicitly requests it by setting ENABLE_TESTS to YES,
  # don't build tests for iOS. The reason: The test runner executable needs
  # codesigning, and for it to be codesigned it would require a bundle
  # identifier. The project neither provides a bundle identifier, nor a
  # codesigning identity, so the iOS build would fail. We don't want that, so
  # by default we don't build tests for iOS.
  if (NOT ${CMAKE_SYSTEM_NAME} STREQUAL "iOS")
    set ( ENABLE_TESTS ${ENABLE_DEFAULT} )
  else()
    set ( ENABLE_TESTS NO )
  endif()
endif()
if ( NOT DEFINED ENABLE_EXAMPLES )
  # Unless the user explicitly requests it by setting ENABLE_EXAMPLES to YES,
  # don't build the examples for iOS. For the reason see the comments above
  # why we also don't build tests for iOS.
  if (NOT ${CMAKE_SYSTEM_NAME} STREQUAL "iOS")
    set ( ENABLE_EXAMPLES ${ENABLE_DEFAULT} )
  else()
    set ( ENABLE_EXAMPLES NO )
  endif()
endif()
if ( ${ENABLE_SHARED_LIBRARY} )
  message ( STATUS "Will build shared library." )
endif()
if ( ENABLE_SHARED_FRAMEWORK )
  message ( STATUS "Will build shared framework." )
endif()
if ( ENABLE_STATIC_LIBRARY )
  message ( STATUS "Will build static library." )
endif()
if ( ENABLE_STATIC_FRAMEWORK )
  message ( STATUS "Will build static framework." )
endif()
if ( ENABLE_TESTS )
  message ( STATUS "Will build tests." )
endif()
if ( ENABLE_EXAMPLES )
  message ( STATUS "Will build examples." )
endif()

# Set variables that depend on which parts of the build have been enabled
if ( ${ENABLE_SHARED_LIBRARY} OR ${ENABLE_STATIC_LIBRARY} OR ${ENABLE_SHARED_FRAMEWORK} OR ${ENABLE_STATIC_FRAMEWORK} )
  set ( AT_LEAST_ONE_LIBRARY_IS_ENABLED YES )
else()
  set ( AT_LEAST_ONE_LIBRARY_IS_ENABLED NO )
endif()
if ( ${ENABLE_SHARED_LIBRARY} OR ${ENABLE_SHARED_FRAMEWORK} )
  set ( AT_LEAST_ONE_SHARED_LIBRARY_IS_ENABLED YES )
else()
  set ( AT_LEAST_ONE_SHARED_LIBRARY_IS_ENABLED NO )
endif()
if ( ${ENABLE_STATIC_LIBRARY} OR ${ENABLE_STATIC_FRAMEWORK} )
  set ( AT_LEAST_ONE_STATIC_LIBRARY_IS_ENABLED YES )
else()
  set ( AT_LEAST_ONE_STATIC_LIBRARY_IS_ENABLED NO )
endif()

# Unit tests of course also test library-internal classes. The symbols for these
# internal classes might not be visible in shared libraries (depends on the
# compiler). To be on the safe side, the unit test target therefore links
# against a static library to gain access to all symbols.
if ( ENABLE_STATIC_LIBRARY )
  set ( LINK_LIBRARY_TARGET_NAME ${STATIC_LIBRARY_TARGET_NAME} )
elseif ( ENABLE_STATIC_FRAMEWORK )
  set ( LINK_LIBRARY_TARGET_NAME ${STATIC_FRAMEWORK_TARGET_NAME} )
else()
  set ( LINK_LIBRARY_TARGET_NAME "" )
endif()

# Perform some logic checks
if ( ${ENABLE_TESTS} OR ${ENABLE_EXAMPLES} )
  message ( CHECK_START "Check whether tests and examples can be built" )
  if ( ${AT_LEAST_ONE_STATIC_LIBRARY_IS_ENABLED} )
    message ( CHECK_PASS "yes")
    message ( STATUS "Tests and examples will be linked against target ${LINK_LIBRARY_TARGET_NAME}" )
  else()
    message ( CHECK_FAIL "no: all static libraries have been disabled" )
    message ( FATAL_ERROR "Tests and examples need to be linked against a static library" )
  endif()
endif()

# Add subfolders to the build that must contain other CMakeLists.txt files.
#
# IMPORTANT: These commands should appear at the end of this CMakeLists.txt
# because other commands further up have an impact on what is inside the
# subfolders' CMakeLists.txt files (e.g. setting CMAKE_CXX_STANDARD).
if ( ${AT_LEAST_ONE_LIBRARY_IS_ENABLED} )
  add_subdirectory ( "src" )
endif()
if ( ${ENABLE_TESTS} )
  add_subdirectory ( "test" )
endif()
if ( ${ENABLE_EXAMPLES} )
  add_subdirectory ( "example" )
endif()
add_subdirectory ( "doc" )
