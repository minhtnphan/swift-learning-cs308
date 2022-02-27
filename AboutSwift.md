# About Swift
Get to know Swift a compiled programming language developed by Apple for Apple devices and Linux in this note.
<h1> Origin of Swift</h1>
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
<br>
<ul>
    <li>For single line comment: use ```//```</li>
    <li> For multiline comment: use ```/*...*/```</li>
 </ul>
 <h2>References</h2>
 educative, History of Swift. Retrieved at https://www.educative.io/courses/swift-programming-mobile-app/q282KZA1N33<br>
 Apple, Swift Documentation. Retrieved at https://www.swift.org/<br>
 exyte, Introduction to Swift. Retrieved at https://exyte.com/blog/introduciton-to-swift

