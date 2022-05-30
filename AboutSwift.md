# About Swift
Get to know Swift - a programming language developed by Apple for Apple devices and Linux in this note.

### Table of Contents
- [Origin of Swift](#origin-of-swift)
- [Getting Started](#getting-started)
- [Names, Types and Binding](#names-types-and-binding)
- [Selection Control Structures](#selection-control-structures)
- [Loops and Subroutines](#loops-and-subroutines)
- [Objects and Classes](#objects-and-classes)
- [References](#references)

<h1>Origin of Swift</h1>
Swift was first introduced in Worldwide Developers Conference in 2014 of Apple. Prior to Swift, Apple mainly used Objective-C to develop their products. However, the Apple developers (including Bertrand Serlet) realized that Apple's applications needed to be developed by a safer language than C-based languages in terms of memory management and syntax. Swift was created as an alternative to Objective-C with simpler syntax and conventions for the purpose of easy, faster code that avoids common reasons for crashes during runtime.
<br>
<br>
Nowadays, Swift is widely used as a general-purpose, open-source programming language for Apple ecosystems (macOS, iOS, watchOS, tvOS...) and Linux. Swift are mainly used to develop applications across Apple devices, especially iOS apps on iPhones. 


<h1>Getting Started</h1>

<h2>Installation on Macbook</h2>
The first and foremost step to use Swift is to have a Mac device. After that, download and install Swift compiler and IDE - Xcode, as well as the       toolchain.
<br>

<h2>Hello, World!</h2>
Before being able to execute a Hello, World program, we have to choose a template to initialize a project. For runable program on a Macbook, choose     macOS multiplaform first. After that, it's your choice to execute the program on command line tool, or as an app, a game or a framework! Below are      examples of running Swift code using Command Line Tool and App for MacOS.

<h3>Command Line Tool</h3>
Continue on choosing a template, choose Command Line Tool and initialize the project as required. After creating the project, the command line            tool should appear at the half bottom of the working space.
<br>
<p align="center">
<img width="720" alt="image" src="https://user-images.githubusercontent.com/42914855/155888863-e6a273f5-6047-435d-b645-64f7aca19ce6.png">
</p>
Copy the Hello World code in its main file:
<br>

```swift
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

```swift
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
</ul>
<br>

```swift
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

```swift
var characterOnly: Character = "c";
var characterNotString = "c"; //okay but can be mistaken as a String
```

Once declaring a variable and constant, you cannot initialize it with the same name or change the variable's value to a different data type. You cannot also change the value of the constant. Therefore, variables can be mutable while constants are immutable in Swift.



<h2>Basic operators</h2>
Swift supports many common operators that any programming language has. In addition, the language also has some more operators of its own. Swift's operators include:
<ul>
<li>Assignment operator <code>=</code> and compound assignment operators <code>+= </code>,...</li>
<li>Arithmetic operators</li>
<li>Comparision operators <code> <, >, <=, >= </code></li>
<li>Ternary Conditional operator: <code>question ? answer1 : answer2</code> - It’s a shortcut for evaluating one of two expressions based on whether question is true or false.</li>
<li>Nil-Coalescing operator <code>a != nil ? a! : b</code> - it unwraps an optional a if it contains a value, or returns a default value b if a is nil.</li>
<li>Range operators</li>
<li>Logical operators</li></ul>

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

```swift
minusThree = 90;
var minusFive :UInt = 2;
var fiveTen: Int = -4;

print(minusThree + minusFive); //yes!!
print(minusThree + "5"); //error, mismatch data type
print(minusFive - fiveTen); //even UInt and Int cannot be together :( 
```

As we can see, with very strict rules of types, mixed types operations are not allowed in Swift.


<h1>Selection control structures</h1>
The Boolean values of Swift consists of <code>true</code> and <code>false</code>. Let's see how they are used in the conditional statements.<br>
Note that in Swift, each code block with conditional statements are delimited with open parentheses after the condition and close parentheses at the end of the statement of that condition.

<h2>Conditional statements</h2>
    
<h3>If statement</h3>
Swift's if statement has the following protocols: <br>

```swift
if condition {
    //statement
} else if condition {
    //statement
} else {
    //statement
}
```
<br>

<code>else if</code> responds as an alternative <code>if</code> statement. So instead of using <code>else if</code>, multiple <code>if</code> code blocks are okay. The <code>else</code> clause is optional, and can be exclude if the set of conditions does not need to be complete.
    
<h3>Dangling else</h2>
    Since Swift requires to delimit code block clearly, dangling else can be easily avoided if we explicitly delimit code blocks. The use of the structure <code>if - else if - else</code> is recommended to delimit code blocks clearly.

<h3>Guard statement</h3>
    Guard is the opposite of <code>if</code> statement. This means that <code>guard</code> only executes else statements. However, we will go back to <code>guard</code> after learning about Swift's functions and repetition structures.
    
<h3>Switch statement</h3>
As mentioned in Swift's documentation, <code>switch</code> statement considers a value and compares it against several possible matching patterns. Swift accepts all values of the same type for switch - case. All switch statements will be considered, and there must be one case that matches with the switch statement. This is called the exhaustive characteristics of Swift switch-case. Consquently, Swift does not accept an empty case. Lastly, switch statement can contain multiple cases (called compound cases) <br>
The structure of Swift is: 
<br>

```swift
switch someValueToConsider {
case value1:
    //do something
case value2, value3: //compound case: if any of this pattern matches, the case is considered to match
    //do something
default:
    //otherwise, do something else
}

```    

Switch statements in Swift don’t execute the cases after the first matching case - it stops right after finishing executing that matching case without being forced to. So there is no need for a <code>break</code> here to stop the statement! However, if you want to continue evaluate all other cases, the keyword <code>fallthrough</code> can help you with that. <code>break</code> can also be used in here, but be careful! It causes the code to exit from the switch - case and transfer to the code right after the switch - case's closing parenthesis.<br>

Other than single values, switch statements in Swift allow intervals for matching cases, called interval matching. For example:

```swift
let approximateCount = 62 
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount { 
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12: 
    naturalCount = "several" 
case 12..<100:
    naturalCount = "dozens of"
default:
    naturalCount = "many"
} 
print("There are \(naturalCount) \(countedThings).") 
// Prints "There are dozens of moons orbiting Saturn".

```

Swift allows using `integer`, `float`, `double`, and `string` datatypes for interval matching cases. Although `range` is quite similar to Interval, switch statements do not allow using them in their matching cases.<br>

Another type that Swift allows to use in cases is `tuple`. Values in tuples used in cases do not need to have similar data types, and can have  `_` values to denote that it can match any value at that `_` value.<br>
The keyword <code>where</code> can be used as a way to add conditions to the values in the tuple. For example:<br>

```swift
let point = (1,0)
switch point {
case let (x,_) where x == 0:
    print("the point lies on x-axis");
case let (_,y) where y == 0:
    print("the point lies on y-axis");
default:
    print("a random point");
}
```

<h2>Short-circuit evaluation</h2>
Swift does support short-circuit evaluations with the use of Optional datatype, Ternary Conditional operator and Nil-Coalescing operator.<br>
For example:

```swift
let defaultColorName = "red"
var userDefinedColorName : String? //an Optional that holds a nil-valued String

var colorNameToUse = userDefinedColorName ?? defaultColorName;

//if userDefinedColorName has nil value, colorNameToUse will be "red", else it will hold the value that userDefinedColorName has
```

<h1>Loops and subroutines</h1>
    
<h2>Loops</h2>
 Swift has 3 types of loops: for-in loops, while loops and a special one called repeat-while loops
    
<h3>For-in loops</h3>
 The syntax of for-in loop in Swift is as follow:<br>
    
 ```swift
 for variableName in [range] {
    //Do something
 }
 ```
The range used in for-in loops can be various as shown in this example:<br>
```swift
 //prints numbers range from 0 to 10 
 for i in 0...10{ //0...10 denotes the range 0 <= i <= 10
    print(i);
}
//or we can use stride(from:to:by) to create a range
for i in stride(from:0, to: 11, by:1) { //the range created by stride is 0 <= i < 11
//by is used to specify the interval of each iteration
    print(i)
}
//for-in loop can also iterate array
var employees = ["Minh", "Anna", "Emma"];
for em in employees{
    print(em);
}
//where (condition) is a way to set condition for the for-in loop. 
//The condition must return true so that the iteration can be executed
for em in employees where (em != "Minh") {
    print(em);
}
```
<h3>While loop</h3>
In Swift, while loop evaluates its condition at the start of each pass through the loop<br>
The syntax of while loop is:<br>

```swift
while condtion {
   //do something
}
//example
var i = 0;
while (i <= 5) {
    print(i);
    i = i + 1;
}
```
<h3>Repeat-while loop</h3>
Apparently, repeat-while is similar to do-while structure in other languages in same aspects. Compared with Swift's while loop, repeat-while evaluates its condition at the end of each pass through the loop.<br>

```swift
repeat {
    //do something
} while condition

//example
var i = 0;
repeat {
    print(j);
    i = i + 1;
} while (i <= 5)
```


<h2>Functions</h2>

<h3>Defining a function</h3>
The syntax to define a function in Swift is:<br>

```swift
func functionName(parameterName: datatype) -> returnType {
    //do something
 }
```
Swift functions provide flexibility in declaring multiple parameters and return types, specifically:<br>
- A function in Swift can have no parameter, or many parameters of different types. Parameters follow the syntax <code>parameterName: datatype</code>, each is separated by a comma. For example:<br>

```swift
//a function with no parameter
func getName() -> String {
    return "Minh";
}
print(getName()); //call the function

//a function with multiple parameters
func setInfo(name: String, age: Int) {
    var personName: String;
    var personAge: Int;
    personName = name;
    personAge = age;
}
setInfo(name: "Minh", age: 21); //call the function - argument names must be included and in correct order in function declaration

```  
From the given syntax, we can refer to a function by the syntax <code>functionName(param1:param2:..paramN:)</code><br>
Other than typical parameters, Swift provides the use of variadic parameters, which allows to pass in the function an undeclared number of arguments of same type! (I think it's a nice function for take in user's input in function call :P ). All inputs will be put into an array for the function to use. For example:<br>

```swift
//a function to count the number of values input by the user 
func count(numbers:Int...) { //unknown number of inputs is declared by ...
    var total: Int = 0;
    for i in 1...numbers.count{
        total = total + 1;
    }
    print(total);
                
}
count(numbers: 1, 2, 3, 4, 51); //prints 5
```
    
- A function can also return multiple values. If a function does not need to return any value, the part <code> -> returnType </code> will not be included in the function declaration. If a function needs to return multiple values, all return values should be put into a tuple:<br>
   
```swift
func functionName(parameterName: datatype) -> (value1Name: returnType, value2Name: returnType) //return tuple containing all return values {
    //do something
 }

 //a function with no return values 
func sayHello() {
    print("Hello world");
}
sayHello()

//a function returning a value
func multiplication(num1: Int, num2: Int) -> Int { //no need label for return value when there is only 1 return value
    return num1*num2;
}
print(multiplication(num1:2,num2:3));
    
//a function with multiple return values
func getMinhsInfo() -> (name:String, age:Int, isStudent:Bool) {
    return("Minh", 21, true); //return values should be provided as declared in the function header
}
print(getMinhsInfo()); //get all return values in a tuple
//we can use tuple index or argument label to get a particular value from the tuple
let info = getMinhsInfo();
print(info.age);
print(info.0);
```

From the examples above, we can see Swift requires very strict parameter and argument declarations in both function declaration and function calls. They are called parameter names and argument labels.<br>
According to Swift guide:<br>
- By default, "parameters use their parameter name as their argument label". For example, in the function <code>setInfo(name:age:)</code>, the parameters are <code>name</code> and <code>age</code>, hence the argument labels are also <code>name</code> and <code>age</code><br>
- However, for the purpose of a more readable, sentence-like code, we can also declare a argument label for the parameter in the function declaration:<br>

```swift
func setInfo(myName name: String, age: Int) { 
    //name is the parameter used inside the function, while myName is the argument label
    var personName: String;
    var personAge: Int;
    personName = name;
    personAge = age;
    
    print(personName, personAge);
}

setInfo(myName: "Minh", age: 21); //correct way of using argument label
setInfo(name: "Minh", age: 21); //incorrect label, name is a parameter name so it does not exist outside the function's scope
```
<h3>Recursion</h3>
Swift does allow recursive function with typical structure: a base-case to stop, and the function call. For example:<br>

<h2>Swift's reference and value types</h2>
Swift is passed-by-reference for reference types and is passed-by-value for value types.<br>
An example that shows Swift is passed-by-reference is:

```swift
class Animal {
    var name:String = "";
    var wasFed: Bool = false;
    
}
let dog = Animal();
dog.name = "Pin";
dog.wasFed = true;

print(dog.wasFed) //prints true

let goldenTriever = dog;
goldenTriever.wasFed = false;

print(dog.wasFed); //prints false
print(goldenTriever.wasFed); //prints false
```
Apparently, dog and goldenTriever changes when one is changed. This means that both dog and goldenTriever point to the same instance of class, and hence instances of classes are passed by references. Other reference types in Swift include functions and closures. <br>

The value types in Swift include Int, Double, Array, Dictionary, Set, Tuple, Struct and enum. An example with Int can be:<br>
```swift
a = 20;
b = a;
b = b + 1;
print(a, b); //prints 20, 21
```
At the point ```b=a```, Swift generates a copy of ```a``` for ```b```, and hence, both variables have no relations to each other. Therefore, ```a``` does not change when ```b``` changes.

<h1>Objects and Classes</h1>
<h2>Classes and Structs</h2>
Of course, an object-oriented programming language supports objects! Swift does have objects, and something called struct that we will look into here:
<h3>Classes</h3>
The definition of class in Swift is:<br>
```swift
class Person {
    //properties of Person goes here
    var name;
    var age;
}
let minh = Person(); //instantiate a Person object
print(minh.age) //access Person's properties/attributes
```
<h3>Structs</h3>
Structs -- short for Structures, is also another way to store different data types that relate to each other. The syntax of Structs is:<br>
```swift
struct Student {
    var class;
    var major;
    var gpa;
 }
let minh = Student(); //instantiate a struct is similar to a class
print(minh.class); //getting the properties/attributes is also similar
```
<h2>Inheritance</h2>
As an Object Oriented Programming language, Swift does support inheritance. However, Swift does not allow a class to have multiple base classes, so there is no multiple inheritance support for this language. 
<h3>Base classes and subclasses</h3>
Inside the base classes, there are properties and methods for the objects created by that classes. The methods are not necessarily be declared inside the base class, but must be implemented by the subclasses. The syntax to declare a base class is:<br>
```swift
class Person{
    var age = 0
    var description: String {
        return "Person on earth"
    }
    var introduction: String {
        return "a human being"
    }
    func worksAt() {
        // do nothing - an arbitary person may or may not have a job
    }
}
```
And for the subclass:<br>
```swift
class Student: Person { //inheritance from Person is shows at the semicolon :
    var school
}
let Nhi = Student(); //instantiatie a Student
print(Nhi.school); //access Nhi's school property
print(Nhi.age); //access Nhi's age property, which is inherited from Person
```
The class Student now inherits the properties of Person, and has its own properties (```school```) too! ```school``` property may not neccessary for all People, so it should not be implemented inside Person class.<br>
A subclass can also be other class' inheritance. By applying the syntax above, you have successfully implemented inheritance for the subclasses of Student. For example:<br>
```swift
class HighSchoolStudent : Student {
    var testScore
}
```
<h2>Standard methods of objects</h2>
<h3>Overriding</h3>
Overriding means that a subclass can provide its own implementation of an instance method that it would otherwise inherit from the superclass. Swift uses the prefix ```override``` in the function declaration header to implement overriding methods. But there's more to come! Swift allows using the superclass' method inside your overriding implementations. To access the superclass' methods, use the prefix ```super```. Below is an example for overriding:<br>
```swift
class Teacher: Person {
    var subject = "math"
    override func worksAt() { //initialize an override method with prefix override
        print("teaching at Fulbright")
    }
        override var introduction: String { //using properties of the base class' description 
            return super.description + " that teaches " + subject
    }
}
let Hoang = Teacher();
Hoang.worksAt(); //prints "teaching at Fulbright"
print(Hoang.introduction) // prints "a human being that teaches math
```

    
<h2>References</h2>
educative, History of Swift. Retrieved at https://www.educative.io/courses/swift-programming-mobile-app/q282KZA1N33<br>
Apple, Swift Documentation. Retrieved at https://www.swift.org/<br>
exyte, Introduction to Swift. Retrieved at https://exyte.com/blog/introduciton-to-swift<br>
programiz, Swift guard Statement. Retrieved at https://www.programiz.com/swift-programming/guard-statement

