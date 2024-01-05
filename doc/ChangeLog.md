# ChangeLog

## Version 2.0.1 (January 05 2024)

Note: There is no version 2.0.0 of SgfcKit because SgfcKit versioning follows the versioning of libsgfc++, and libsgfc++ 2.0.0 was faulty so there is no point in making an SgfcKit 2.0.0 release.

### Features

- None

### Bugfixes

The following bugfixes match similar bugfixes in libsgfc++:

- Fixed numeric value of `SGFCMessageIDIllegalVariationStartCorrected` (#3). The enum value had the same numeric value as `SGFCMessageIDIllegalVariationStartIgnored`.
- Changed the type for referencing line and column numbers in messages to `NSNumber` objects wrapping an `unsigned long` value, to match the error reporting interface of SGFC (#4). The old type `NSInteger` was insufficient to hold all possible `unsigned long` values, also there was a signed/unsigned mismatch. The change affects the `SGFCMessage` properties `lineNumber` and `columnNumber`, as well as the constants `SGFCConstants::SGFCInvalidLineNumber` and `SGFCConstants::SGFCInvalidColumnNumber`. The constants also changed their value (previously -1, now 0).

### Regressions

- None

### Technical changes

- Updated libsgfc++ from 1.0 to 2.0.1.
- Updated `Build.md` to match documentation in `Build.md` in libsgfc++. A major update was the [Cross-compiling for iOS](Build.md#cross-compiling-for-ios) documentation for modern CMake/Xcode versions.
- Added support for building Doxygen documentation.
- Fixed a number of errors in the Doxygen documentation.
- Updated the GitHub build pipeline.
- Added the documents `NOTICE` and `ChangeLog.md`.

### GitHub issue list

A list of all issues closed for this release is available [on GitHub](https://github.com/herzbube/SgfcKit/milestone/1?closed=1)


## Version 1.0 (February 23 2021)

Initial 1.0 release that wraps libsgfc++ 1.0 and uses SGFC v2.0.

Note: The Git tag `1.0` in branch `master` points to a commit in the libsgfcplusplus 
git submodule which in turn points to the wrong commit in the SGFC git submodule.

## November 06 2020

Wrapping of libsgfc++ 0.1 (alpha) complete.

## October 18 2020

Created project.
