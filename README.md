[![Build Status](https://github.com/herzbube/sgfckit/workflows/build/badge.svg)](https://github.com/herzbube/sgfckit/actions?query=workflow%3Abuild)
[![Github Releases](https://img.shields.io/github/release/herzbube/sgfckit.svg)](https://github.com/herzbube/sgfckit/releases)
[![Github Releases](https://img.shields.io/github/license/herzbube/sgfckit.svg)](https://github.com/herzbube/sgfckit/blob/master/LICENSE)

## What is it?

SgfcKit is an Objective-C wrapper library around the C++ library [libsgfc++](https://github.com/herzbube/libsgfcplusplus), which in turn is a wrapper for [SGFC](https://www.red-bean.com/sgf/sgfc/), the SGF Syntax Checker & Converter. SgfcKit transitively inherits SGFC's core functionality from libsgfc++:

- Read and write SGF (Smart Game Format) files.
- Check the file content for correctness.
- Correct any errors.
- Convert FF[1] - FF[3] files to the FF[4] format.

SgfcKit is not restricted to files, it also reads and writes SGF data from/to `NSString` without filesystem interaction.

The SgfcKit API closely resembles the one offered by libsgfc++, but is re-modeled towards the idioms that prevail in the Objective-C world.

SgfcKit theoretically is cross-platform - as long as your desired platform has an Objective-C compiler and you are able to also build the underlying libsgfc++, you might be successful in building and running SgfcKit for/on that platform. In practice, though, SgfcKit is likely to be restricted to the macOS and iOS-derived platforms.

## What it's not

The limitations of SGFC also apply to SgfcKit. Quoting from the [SGFC website](https://www.red-bean.com/sgf/sgfc/):

> SGFC is intended to be a tool for SGF experts, coders and maintainers of large SGF archives. You ought to have quite some knowledge of SGF to use SGFC efficiently.
> 
> SGFC was written primarily for Go/WeiQi/Baduk (GM[1]) files. It can't handle other games yet, i.e. it doesn't check any game-specific properties and values of other games than Go. It may even save erronous game-specific properties of other games! Use SGFC for other games with care. 

## Dependencies

At runtime SgfcKit only depends on libsgfc++, the C/C++/Objective-C runtime libraries and the C++ standard library.

At build time SgfcKit has the following dependencies:

1. The main dependency, of course, is [libsgfc++](https://github.com/herzbube/libsgfcplusplus).
2. The second dependency is the build management tool [CMake](https://cmake.org/cmake/help/latest/).
3. A last dependency is [Doxygen](https://www.doxygen.org/), used to optionally generate the project's API documentation.

Dependency 1 is integrated via Git submodule.

## Project build system

The project build system is [documented here](doc/Build.md).

## More documentation

- [Library design and working principles](doc/Principles.md)
- [Bugs and limitations](doc/Bugs.md)
- [Coding guidelines](doc/CodingGuidelines.md)
- If you have SGF-related questions you may find them answered in the [document section of libsgfc++](https://github.com/herzbube/libsgfcplusplus/tree/develop/doc).

## License

SgfcKit is released under the [Apache License](http://www.apache.org/licenses/LICENSE-2.0) (2.0). Here's the [link to the license file](LICENSE).

libsgfc++ is released under the terms of the [Apache License](http://www.apache.org/licenses/LICENSE-2.0) (2.0).

- [Link to local license file](libsgfcplusplus/COPYING). This works only if you have a local clone of the SGFC git submodule.
- [Link to remote license file](https://github.com/herzbube/libsgfcplusplus/blob/master/LICENSE). This link points to the `master` branch version of the license file.

SGFC is released under the terms of the [BSD License](https://opensource.org/licenses/BSD-3-Clause).

- [Link to local license file](libsgfcplusplus/sgfc/COPYING). This works only if you have a local clone of the SGFC git submodule.
- [Link to remote license file](https://bitbucket.org/arnoh/sgfc/src/master/COPYING). This link points to the `master` branch version of the license file.
