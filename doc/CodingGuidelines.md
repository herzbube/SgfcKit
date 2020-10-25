# Coding guidelines

## Naming

- Class names and types that are visible in thhe public API start with the library prefix `SGFC` to avoid namespace clashes when a program combines this with several other libraries in a single global namespace. Remember: Objective-C has no namespaces!
- After the prefix class names start with an uppercase letter. Example: `SGFCFactory`.
- Method names start with a lowercase letter.
- Variable names start with a lowercase letter.
- Member variables use an underscore character (`_`) as prefix to distinguish them from variables that are local to a method. For properties the underlying member variable is automatically generated and follows this rule.
- Setter/getter methods should be named after the member variable they encapsulate (e.g. getter = `firstChild()`, setter = `setFirstChild:()`).
- Find good names for variables, methods and classes; don't hesitate to use long names; never (!) use abbreviations; don't use i, j, k for loop variables.

## Indentation and formatting

- Spaces, no tabs.
- 2 spaces per indentation level.
- Opening/closing braces are placed on their own line.
- No space is used to separate opening/closing paranthesis from the expression they surround.
- Operators (e.g. "+" in string concatenations) are separated by spaces from their operands.
- Pointers: No space between the type name and the asterisk; e.g. `NSString* foo`, not `NSString *foo`.
- Use braces liberally to improve readability, but don't hesitate to omit them in long `if`- or `switch`-clauses that use only one-line statements. Readability is the most important aspect here - sometimes the right use of braces can create a visual pattern that immediately tells the reader how the program flows.
- Method signatures should start in column 0 and use spaces etc. as in the following example. It's the style I like, although it deviates from Apple's style (which everybody else on the planet seems to have adopted). `- (NSString*) foo:(NSString*)bar;`

## Preprocessor

- No preprocessor macros unless absolutely necessary.

## Header files

- Only one type (class, struct, enumeration) per header file.
- No inline code in header files.
- Avoid including header files in other header files, whenever possible use forward declarations.

## Implementation files

- Use `#pragma mark` statements to help IDE users. Typical sections are "Class extension", "Initialization and deallocation", "Public API", "Internal API" and "Private API".

## Code structure

- Only one variable declaration per line.
- Only one statement per line; long statements (e.g. method invocations with many parameters) may span multiple lines.
- Lines should not be longer than 80 characters; for comment lines this limit is much stricter than for lines of code.
- Private properties of a class are declared in class extension which appears in the `.m` file
- Private methods of a class should not be declared to avoid unnecessary duplication of method signatures.
- Never **EVER** use side-effects, e.g.
  - Don't place ++/-- operators in the same line as an assignment.
  - Don't test a condition and make an assignment at the same time.

## Properties

- Consider declaring properties `readonly` in the public interface of a class, then redeclare them as `readwrite` in the private interface in the `.m` file.
- Always declare a property's setter semantics, i.e. explicitly declare `strong` even though it is the default and could be omitted.
- Use `nonatomic` unless the property really needs to be atomic.

## Documentation

- Everything should be documented with Doxygen documentation blocks; exceptions are possible but should remain rare.
- When a class is part of the public API its designated initializer must be documented in the header file. Consequently if the default `init` is the designated initializer, it must be explicitly declared in the public header file so that there is a spot for the documentation.
