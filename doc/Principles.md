# Library design and working principles

## Adapting libsgfc++ to the Objective-C world

SgfcKit is an Objective-C wrapper library around the C++ library [libsgfc++](https://github.com/herzbube/libsgfcplusplus).

These are the guiding principles for writing the wrapper:

- Expose as much functionality of libsgfc++ as possible to Objective-C clients
- Add as little logic and behaviour as possible
- Replicate all relevant libsgfc++ API documentation in SgfcKit, so that SgfcKit can be directly used in an IDE. The API documentation must be adapted to SgfcKit type names.
- Adapt C++ idioms to Objective-C idioms as far as possible.

## Principles inherited from libsgfc++

SgfcKit inherits the following principles from libsgfc++. Follow the links to read the respective section in `Principles.md` in the libsgfc++ project.

- [Concurrency](https://github.com/herzbube/libsgfcplusplus/blob/develop/doc/Principles.md#Concurrency)
- [Operation modes](https://github.com/herzbube/libsgfcplusplus/blob/develop/doc/Principles.md#Operation-modes)
- [Error handling](https://github.com/herzbube/libsgfcplusplus/blob/develop/doc/Principles.md#Error-handling)
- [Document concept](https://github.com/herzbube/libsgfcplusplus/blob/develop/doc/Principles.md#Document-concept)

## Memory management

SgfcKit uses ARC.

## Platform independence

SgfcKit tries to stick to the Objective-C foundations so that, in theory it can also be built on other platforms than macOS / iOS.

In an early version the project had a dependency on the `objc` library only. This was sufficient for `NSObject` and some other extremely basic stuff from the Objective-runtime like the `BOOL` typedef. It became obvious real quick, though, that `objc` is just too basic, and SgfcKit had to switch to the Foundation framework, to get support for stuff like `NSString` and `NSArray`.

On non-macOS platforms (Linux, Windows) the way to go apparently is [GNUstep](http://gnustep.org/). GNUstep provides an implementation of the Foundation library, so it should be possible to somehow get SgfcKit to build as long as you have a compiler that supports Objective-C 2.0 features and understands Objective-C++. This compiler is likely to be clang.
