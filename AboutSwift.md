# About Swift
Get to know Swift - a programming language developed by Apple for Apple devices and Linux in this note.

### Table of Contents
- [Origin of Swift](#origin-of-swift)
- [Getting Started](#getting-started)
- [Names, Types and Binding](#names-types-and-binding)
- [References](#references)

<h1>Origin of Swift</h1>
Swift was first introduced in Worldwide Developers Conference in 2014 of Apple. Prior to Swift, Apple mainly used Objective-C to develop their products. However, the Apple developers (including Bertrand Serlet) realized that Apple's applications needed to be developed by a safer language than C-based languages in terms of memory management and syntax. Swift was created as an alternative to Objective-C with simpler syntax and conventions for the purpose of easy, faster code that avoids common reasons for crashes during runtime.
<br>
<br>
Nowadays, Swift is widely used as a general-purpose, open-source programming language for Apple ecosystems (macOS, iOS, watchOS, tvOS...) and Linux. Swift are mainly used to develop applications across Apple devices, especially iOS apps on iPhones. 
<h1>Getting Started</h1>
<h2>Installation on Macbook</h2>
The first and foremost step to use Swift is to have a Mac device. After that, download and install Swift compiler and IDE - Xcode, as well as the toolchain at https://www.swift.org/download/
<br>

<h2>Hello, World!</h2>
Before being able to execute a Hello, World program, we have to choose a template to initialize a project. For runable program on a Macbook, choose macOS multiplaform first. After that, it's your choice to execute the program on command line tool, or as an app, a game or a framework! Below are examples of running Swift code using Command Line Tool and App for MacOS.
<h3>Command Line Tool</h3>
Continue on choosing a template, choose Command Line Tool and initialize the project as required. After creating the project, the command line tool should appear at the half bottom of the working space.
<br><br>
<p align="center">
<img width="720" alt="image" src="https://user-images.githubusercontent.com/42914855/155888863-e6a273f5-6047-435d-b645-64f7aca19ce6.png">
</p>

Copy the Hello World code in its main file:
```
import Foundation

print("Hello, World!") 
```
The code can be executed by clicking the run button on the top left of Xcode window. 
Hello World can also be executed using terminal. On terminal, access your project and find ```main.swift```, then execute the following code:
<br>
```
swift main.swift
```
<h3>App</h3>
Running a Hello, World using an app template follows similar steps like using Command Line Tool, but instead of choosing Command Line Tool when initializing the project, choose App instead.
Put the below code in ContentView file of the project:
<br><br>

```
import SwiftUI

struct ContentView: View {
var body: some View {
Text("Hello, world!")
.padding()
}
}

struct ContentView_Previews: PreviewProvider {
static var previews: some View {
ContentView()
}
}
```
Run the program by clicking the run button on the top left of the Xcode window.

<h2>Commenting on Swift code</h2>
There are 2 ways to comment on Swift code, specifically:

<ul>
<li>For single line comment: use //</li>
<li> For multiline comment: use /*...*/</li>
</ul>

<h1>Names, Types and Binding</h1>

<h2>Primitive data types</h2>
Swift's built-in data types include Int, UInt, Float, Double, Bool, String, Character, Tuple and Optional.
<ul>
<li>UInt is used to represent unsigned integers while Int represents sign integers</li>
<li>Optional stores variables that can either hold a value or not</li>
</ul>
Examples will be provide in the next section.

<h2>Naming conventions for variables</h2>
Variables in Swift should be named by the following convention:
<ul>
<li>Variable name should be written with camelCase format, in which the variables should start with a lower case letter, followed up by any Unicode characters.</li>
<li>The variables cannot start with a number and cannot contain whitespace character, mathematical symbols, arrows, private-use Unicode scalar values, or linie- and box-drawing characters.</li>
</ul>

```
var twentyFive = 9; //correct name
var Twentyone = 9; //okay if not camelCase, but not recommended
var 21_twentyFive = 9; //no number at the beginning
```
These conventions are very similar to Objective-C - Swift's ancestor, and other object-oriented programming languages too!

<h2>Declaring variables and constants</h2>
Swift is neither implicitly-typed nor explicitly-typed language. It depends on the coders whether to declare the variable's data type or not, and it is okay if they do not.
<br>
<ul>
<li>The syntax for declaring a variable in Swift is <code> var variableName: Datatype = expression;</code> or  <code> var variableName = expression;</code></li>
<li>The syntax for declaring a constant in Swift is <code>let constantName: Datatype = expression; </code></li>
<br>

```
let ten = 10; //declaring a constant
var five: Int = 3; //declaring a signed integer

var minusThree: UInt = 892; //declaring an unsigned integer

var thisNumberIsDouble: Double; //declaring a double, float is similar
thisNumberIsDouble = 6.8; //assign value to the double
thisNumberIsDouble = "hello"; //error - not matched data type

var trueFalse = true; //declaring a Boolean variable

var emptyIntArray: [Int] = []; //declaring an integer array - data type of the array should be declared in []
var notEmptyIntArry = [1, 2, 3, 4];

var name1: String? = "Bertie"; //this is an optional
var name2: String = "Bertie"; //this is a string

```

However, there are some cases that Swift can mistaken your variable's datatype if you do not declare it while initializing the variable. One example could be:

```
var characterOnly: Character = "c";
var characterNotString = "c"; //okay but can be mistaken as a String
```

Once declaring a variable and constant, you cannot initialize it with the same name or change the variable's value to a different data type. You cannot also change the value of the constant. Therefore, variables can be mutable while constants are immutable in Swift.

<h2>Basic operators</h2>
Swift supports many common operators that any programming language has. In addition, the language also has some more operators of its own. Swift's operators include:
<ul>
<li>Assignment operator <code>=</code> and compound assignment operators <code>+= </code>,...</li>
<li>Arithmetic operators</li>
<li>Comparision operators <code> <, > </code>,...</li>
<li>Ternary Conditional Operator: <code>question ? answer1 : answer2</code> - It’s a shortcut for evaluating one of two expressions based on whether question is true or false.</li>
<li>Nil-Coalescing Operator <code>a != nil ? a! : b</code> - it unwraps an optional a if it contains a value, or returns a default value b if a is nil.</li>
<li>Range operators</li>
<li>Logical operators</li>

<h2>Keywords and reserved words</h2>
Swift has a list of keywords that cannot be used as identifiers. According to Swift guide, keywords other than `inout`, `var`, and `let` can be used as parameter names in a function declaration or function call without being escaped with backticks. Unless there is ambiguituity between refering to the member and the keyword, the member must be escaped with backticks.

- Keywords used in declarations: `associatedtype, class, deinit, enum, extension, fileprivate, func, import, init, inout, internal, let, open, operator, private, precedencegroup, protocol, public, rethrows, static, struct, subscript, typealias`, and `var`.
- Keywords used in statements: `break, case, catch, continue, default, defer, do, else, fallthrough, for, guard, if, in, repeat, return, throw, switch, where`, and `while`.
- Keywords used in expressions and types: `Any, as, catch, false, is, nil, rethrows, self, Self, super, throw, throws, true`, and `try`.
- Keywords used in patterns: ` _. `
- Keywords that begin with a number sign (#): `#available, #colorLiteral, #column, #dsohandle, #elseif, #else, #endif, #error, #fileID, #fileLiteral, #filePath, #file, #function, #if, #imageLiteral, #keyPath, #line, #selector, #sourceLocation,` and `#warning`.

Swift also has a list of reserved words, including: `associativity, convenience, didSet, dynamic, final, get, indirect, infix, lazy, left, mutating, none, nonmutating, optional, override, postfix, precedence, prefix, Protocol, required, right, set, some, Type, unowned, weak`, and `willSet`. Outside the context in which they appear in the grammar, they can be used as identifiers.

    <h2>Swift - a strong statically-typed language</h2>
Inherited by Objective-C, Swift is created to be a statically-typed language. Being introduced as a type-safe language, Swift recommends users to be clear about variables so that it can check for type errors before running the program (at compile time). It also binds variables at compile time, as you can see - Swift determines a datatype for variables with no prior datatype in this process. <br>
Swift is a strong-typed language too. It is very strict in terms of types. Here is an example:
<br>

```
minusThree = 90;
var minusFive :UInt = 2;
var fiveTen: Int = -4;

print(minusThree + minusFive); //yes!!
print(minusThree + "5"); //error, mismatch data type
print(minusFive - fiveTen); //even UInt and Int cannot be together :( - still figuring out how to convert the operand into the same datatype!
                    //This is too strict! There are integers!
```
As we can see, with very strict rules of types, mixed types operations are not allowed in Swift.
<h2>References</h2>
educative, History of Swift. Retrieved at https://www.educative.io/courses/swift-programming-mobile-app/q282KZA1N33<br>
Apple, Swift Documentation. Retrieved at https://www.swift.org/<br>
exyte, Introduction to Swift. Retrieved at https://exyte.com/blog/introduciton-to-swift

