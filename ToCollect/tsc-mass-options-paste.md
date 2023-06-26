Running tsc locally will compile the closest project defined by a tsconfig.json, or you can compile a set of TypeScript files by passing in a glob of files you want. When input files are specified on the command line, tsconfig.json files are ignored.

# Run a compile based on a backwards look through the fs for a tsconfig.json
tsc
# Emit JS for just the index.ts with the compiler defaults
tsc index.ts
# Emit JS for any .ts files in the folder src, with the default settings
tsc src/*.ts
# Emit files referenced in with the compiler settings from tsconfig.production.json
tsc --project tsconfig.production.json
# Emit d.ts files for a js file with showing compiler options which are booleans
tsc index.js --declaration --emitDeclarationOnly
# Emit a single .js file from two files via compiler options which take string arguments
tsc app.ts util.ts --target esnext --outfile index.js
Compiler Options
If you’re looking for more information about the compiler options in a tsconfig, check out the TSConfig Reference

CLI Commands
Flag	Type
	
boolean

Show all compiler options.

	
string

Generates an event trace and a list of types.

	
boolean

Gives local information for help on the CLI.

	
boolean

Initializes a TypeScript project and creates a tsconfig.json file.

	
boolean

Print names of files that are part of the compilation and then stop processing.

	
string

Set the language of the messaging from TypeScript. This does not affect emit.

	
string

Compile the project given the path to its configuration file, or to a folder with a 'tsconfig.json'.

	
boolean

Print the final configuration instead of building.

	
boolean

Print the compiler's version.

Build Options
Flag	Type
	
boolean

Build one or more projects and their dependencies, if out of date

	
boolean

Delete the outputs of all projects.

	
boolean

Show what would be built (or deleted, if specified with '--clean')

	
boolean

Build all projects, including those that appear to be up to date.

	
boolean

Enable verbose logging.

Watch Options
Flag	Type
	
list

Remove a list of directories from the watch process.

	
list

Remove a list of files from the watch mode's processing.

	
fixedinterval, priorityinterval, dynamicpriority, or fixedchunksize

Specify what approach the watcher should use if the system runs out of native file watchers.

	
boolean

Synchronously call callbacks and update the state of directory watchers on platforms that don`t support recursive watching natively.

	
boolean

Watch input files.

	
usefsevents, fixedpollinginterval, dynamicprioritypolling, or fixedchunksizepolling

Specify how directories are watched on systems that lack recursive file-watching functionality.

	
fixedpollinginterval, prioritypollinginterval, dynamicprioritypolling, fixedchunksizepolling, usefsevents, or usefseventsonparentdirectory

Specify how the TypeScript watch mode works.

Compiler Flags
Flag	Type	Default
	
boolean

false

Enable importing files with any extension, provided a declaration file is present.

	
boolean

false

Allow imports to include TypeScript file extensions.

	
boolean

false

Allow JavaScript files to be a part of your program. Use the checkJS option to get errors from these files.

	
boolean

true if esModuleInterop is enabled, module is system, or moduleResolution is bundler, false otherwise.

Allow 'import x from y' when a module doesn't have a default export.

	
boolean

false

Allow accessing UMD globals from modules.

	
boolean

Disable error reporting for unreachable code.

	
boolean

Disable error reporting for unused labels.

	
boolean

true if strict, false otherwise.

Ensure 'use strict' is always emitted.

	
boolean

false

Have recompiles in projects that use incremental and watch mode assume that changes within a file will only affect files directly depending on it.

	
string

Specify the base directory to resolve non-relative module names.

	
string

utf8

No longer supported. In early versions, manually set the text encoding for reading files.

	
boolean

false

Enable error reporting in type-checked JavaScript files.

	
boolean

false

Enable constraints that allow a TypeScript project to be used with project references.

	
list

Conditions to set in addition to the resolver-specific defaults when resolving imports.

	
boolean

true if composite, false otherwise.

Generate .d.ts files from TypeScript and JavaScript files in your project.

	
string

Specify the output directory for generated declaration files.

	
boolean

false

Create sourcemaps for d.ts files.

	
boolean

false

Output compiler performance information after building.

	
boolean

false

Reduce the number of projects loaded automatically by TypeScript.

	
boolean

false

Remove the 20mb cap on total source code size for JavaScript files in the TypeScript language server.

	
boolean

false

Opt a project out of multi-project reference checking when editing.

	
boolean

false

Disable preferring source files instead of declaration files when referencing composite projects.

	
boolean

false

Emit more compliant, but verbose and less performant JavaScript for iteration.

	
boolean

false

Emit a UTF-8 Byte Order Mark (BOM) in the beginning of output files.

	
boolean

false

Only output d.ts files and not JavaScript files.

	
boolean

false

Emit design-type metadata for decorated declarations in source files.

	
boolean

true if module is node16 or nodenext, false otherwise.

Emit additional JavaScript to ease support for importing CommonJS modules. This enables allowSyntheticDefaultImports for type compatibility.

	
boolean

false

Interpret optional property types as written, rather than adding undefined.

	
boolean

false

Enable experimental support for TC39 stage 2 draft decorators.

	
boolean

false

Print files read during the compilation including why it was included.

	
boolean

false

Output more detailed compiler performance information after building.

	
boolean

true

Ensure that casing is correct in imports.

	
string

profile.cpuprofile

Emit a v8 CPU profile of the compiler run for debugging.

	
boolean

false

Allow importing helper functions from tslib once per project, instead of including them per-file.

	
remove, preserve, or error

remove

Specify emit/checking behavior for imports that are only used for types.

	
boolean

true if composite, false otherwise.

Save .tsbuildinfo files to allow for incremental compilation of projects.

	
boolean

false

Include sourcemap files inside the emitted JavaScript.

	
boolean

false

Include source code in the sourcemaps inside the emitted JavaScript.

	
boolean

false

Ensure that each file can be safely transpiled without relying on other imports.

	
preserve, react, react-native, react-jsx, or react-jsxdev

Specify what JSX code is generated.

	
string

React.createElement

Specify the JSX factory function used when targeting React JSX emit, e.g. 'React.createElement' or 'h'.

	
string

React.Fragment

Specify the JSX Fragment reference used for fragments when targeting React JSX emit e.g. 'React.Fragment' or 'Fragment'.

	
string

react

Specify module specifier used to import the JSX factory functions when using jsx: react-jsx*.

	
boolean

false

Make keyof only return strings instead of string, numbers or symbols. Legacy option.

	
list

Specify a set of bundled library declaration files that describe the target runtime environment.

	
boolean

false

Print the names of emitted files after a compilation.

	
boolean

false

Print all of the files read during the compilation.

	
string

Specify the location where debugger should locate map files instead of generated locations.

	
number

0

Specify the maximum folder depth used for checking JavaScript files from node_modules. Only applicable with allowJs.

	
none, commonjs, amd, umd, system, es6/es2015, es2020, es2022, esnext, node16, or nodenext

CommonJS if target is ES3 or ES5, ES6/ES2015 otherwise.

Specify what module code is generated.

	
legacy, auto, or force

"auto": Treat files with imports, exports, import.meta, jsx (with jsx: react-jsx), or esm format (with module: node16+) as modules.

Control what method is used to detect the whether a JS file is a module.

	
classic, node10/node, node16, nodenext, or bundler

Classic if module is AMD, UMD, System or ES6/ES2015, Matches if module is node16 or nodenext, Node otherwise.

Specify how TypeScript looks up a file from a given module specifier.

	
list

List of file name suffixes to search when resolving a module.

	
crlf or lf

Platform specific.

Set the newline character for emitting files.

	
boolean

false

Disable emitting files from a compilation.

	
boolean

false

Disable generating custom helper functions like __extends in compiled output.

	
boolean

false

Disable emitting files if any type checking errors are reported.

	
boolean

false

Disable truncating types in error messages.

	
boolean

false

Enable error reporting for fallthrough cases in switch statements.

	
boolean

true if strict, false otherwise.

Enable error reporting for expressions and declarations with an implied any type.

	
boolean

false

Ensure overriding members in derived classes are marked with an override modifier.

	
boolean

false

Enable error reporting for codepaths that do not explicitly return in a function.

	
boolean

true if strict, false otherwise.

Enable error reporting when this is given the type any.

	
boolean

false

Disable adding 'use strict' directives in emitted JavaScript files.

	
boolean

false

Disable including any library files, including the default lib.d.ts.

	
boolean

false

Enforces using indexed accessors for keys declared using an indexed type.

	
boolean

false

Disallow imports, requires or <reference>s from expanding the number of files TypeScript should add to a project.

	
boolean

false

Disable strict checking of generic signatures in function types.

	
boolean

false

Add undefined to a type when accessed using an index.

	
boolean

false

Enable error reporting when local variables aren't read.

	
boolean

false

Raise an error when a function parameter isn't read.

	
string

Deprecated setting. Use outFile instead.

	
string

Specify an output folder for all emitted files.

	
string

Specify a file that bundles all outputs into one JavaScript file. If declaration is true, also designates a file that bundles all .d.ts output.

	
object

Specify a set of entries that re-map imports to additional lookup locations.

	
list

Specify a list of language service plugins to include.

	
boolean

true if isolatedModules, false otherwise.

Disable erasing const enum declarations in generated code.

	
boolean

false

Disable resolving symlinks to their realpath. This correlates to the same flag in node.

	
boolean

false

Preserve unused imported values in the JavaScript output that would otherwise be removed.

	
boolean

false

Disable wiping the console in watch mode.

	
boolean

true

Enable color and formatting in TypeScript's output to make compiler errors easier to read.

	
string

React

Specify the object invoked for createElement. This only applies when targeting react JSX emit.

	
boolean

false

Disable emitting comments.

	
boolean

false

Enable importing .json files.

	
boolean

true when 'moduleResolution' is 'node16', 'nodenext', or 'bundler'; otherwise false.

Use the package.json 'exports' field when resolving package imports.

	
boolean

true when 'moduleResolution' is 'node16', 'nodenext', or 'bundler'; otherwise false.

Use the package.json 'imports' field when resolving imports.

	
string

Computed from the list of input files.

Specify the root folder within your source files.

	
list

Computed from the list of input files.

Allow multiple folders to be treated as one when resolving modules.

	
boolean

false

Skip type checking .d.ts files that are included with TypeScript.

	
boolean

false

Skip type checking all .d.ts files.

	
boolean

false

Create source map files for emitted JavaScript files.

	
string

Specify the root path for debuggers to find the reference source code.

	
boolean

false

Enable all strict type-checking options.

	
boolean

true if strict, false otherwise.

Check that the arguments for bind, call, and apply methods match the original function.

	
boolean

true if strict, false otherwise.

When assigning functions, check to ensure parameters and the return values are subtype-compatible.

	
boolean

true if strict, false otherwise.

When type checking, take into account null and undefined.

	
boolean

true if strict, false otherwise.

Check for class properties that are declared but not set in the constructor.

	
boolean

false

Disable emitting declarations that have @internal in their JSDoc comments.

	
boolean

false

Disable reporting of excess property errors during the creation of object literals.

	
boolean

false

Suppress noImplicitAny errors when indexing objects that lack index signatures.

	
es3, es5, es6/es2015, es2016, es2017, es2018, es2019, es2020, es2021, es2022, or esnext

ES3

Set the JavaScript language version for emitted JavaScript and include compatible library declarations.

	
boolean

false

Log paths used during the moduleResolution process.

	
string

.tsbuildinfo

The file to store .tsbuildinfo incremental build information in.

	
list

Specify multiple folders that act like ./node_modules/@types.

	
list

Specify type package names to be included without being referenced in a source file.

	
boolean

true if target is ES2022 or higher, including ESNext, false otherwise.

Emit ECMAScript-standard-compliant class fields.

	
boolean

true if strict, false otherwise.

Default catch clause variables as unknown instead of any.

	
boolean

false

Do not transform or elide any imports or exports not marked as type-only, ensuring they are written in the output file's format based on the 'module' setting.

Related
Every option is fully explained in the TSConfig Reference.
Learn how to use a tsconfig.json files.
Learn how to work in an MSBuild project.
