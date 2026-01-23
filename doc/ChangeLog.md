# ChangeLog

## Version 2.1.0 (January 23 2026)

### Features

- Library clients can now set a custom value for the SGF property AP (#11). To do so, a library client must use `SGFCArgumentTypeDoNotAddSgfcApProperty` when writing SGF content, in addition to adding the AP property to the document tree. If the library client does not use the argument, then SGFC will write its own AP property with value "SGFC:<sgfc-version>". See SgfcNotes.md in the libsgfc++ project for details.

### Bugfixes

- Fixed a bug in SGFC that, when saving SGF files with 5'000 characters or more, would write one or more random byte values into the file. (#9). When generating SGF content, SGFC uses an internal buffer that starts with a size of 5'000 bytes and then doubles in size whenever the buffer end is reached (5'000, 10'000, 20'000, 40'000, etc.). When the buffer was doubled, the bug caused the byte at position `buffer size - 1` to be skipped, thus introducing a random value at byte positions 4'999, 9'999, 19'999, 39'999, etc.
- Fixed bugs when converting SGF property values of type "Real" and "Number" to string (#10). Depending on the numeric value, it was possible that "Real" values would be converted using the scientific notation or with a maximum precision of 6 decimal digits, while "Number" values would be converted with thousands separators. After the fix, scientific notation and thousands separators will no longer be used, and "Real" values will have a precision of up to 16 decimal digits. See SgfNotes.md in the libsgfc++ project for details about the floating point precision used during conversion.

### Regressions

- None

### Technical changes

- Updated libsgfc++ from 2.0.1 to 2.1.0.

### GitHub issue list

A list of all issues closed for this release is available [on GitHub](https://github.com/herzbube/SgfcKit/milestone/3?closed=1)

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
