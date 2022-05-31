//
//  main.swift
//  helloworld
//
//  Created by Tuong-Minh Phan on 23/02/2022.
//

import Foundation

//hello world
print("Hello, World!")

//--------------------------------------------------------------------------------------------
//declaring variables and constants
var eleven = 9; //implicitly declaring an integer
var Twentyone = 9; //okay if not camelCase, but not recommended
//var 21_twentyFive = 9; //no number at the beginning

let ten = 10; //declaring a constant
var five: Int = -3; //declaring a signed integer

var minusThree: UInt = 892; //declaring an unsigned integer

var thisNumberIsDouble: Double; //declaring a double, float is similar
thisNumberIsDouble = 6.8; //assign value to the double
//thisNumberIsDouble = "hello"; //error - not matched data type

var trueFalse = true; //declaring a Boolean variable

var emptyIntArray: [Int] = []; //declaring an integer array - data type of the array should be declared in []
var notEmptyIntArry = [1, 2, 3, 4];


//characterOnly = "character"; //wrong datatype

var characterOnly: Character = "c";
var characterNotString = "c"; //okay but can be mistaken as a String

var name1: String? = "Bertie"; //this is an optional
var name2: String = "Bertie"; //this is a string



var Type = "hello"; //okay since there is no ambiguity
//var class = "hello"; //no, class is a keyword
var `class` = "hello"; //in backticks would be okay

var minusFive :UInt = 2;
var fiveTen: Int = -4;

var helloString = "Hello World";
print(type(of: characterNotString))
print(minusThree + minusFive);
//print(minusFive - fiveTen);
var fiveInt:String = "5";
//print(minusThree + UInt(fiveInt));

//-------------------------------------------------------------------------------------------

//selection control structure
var a: Int = 10
var b: Int = 20
var c: Int = 30
//if-else
if (a < b) {
    if (a < c) {
        if (b > c) {
            print("b is the biggest number")
        }
        else
        {
        print("c is the biggest number");
        }
    }}

//switch
let point = (1,0)
switch point {
case let (x,_) where x == 0:
    print("the point lies on x-axis");
case let (_,y) where y == 0:
    print("the point lies on y-axis");
default:
    print("a random point");
}

//guard
for i in 2...10 {
  // guard condition to check the even number
  guard i % 2 == 0 else {
      print(i)          // only print odd number
      continue          // continue the iteration
  }
}

//---------------------------------------------------------------------------------
//functions
func getName() -> String {
    return "Minh";
}

print(getName());


func setInfo(myName name: String, age: Int) {
    var personName: String;
    var personAge: Int;
    personName = name;
    personAge = age;

    print(personName, personAge);
}

setInfo(myName: "Minh", age: 21);

func sayHello() {
    print("Hello world");
}

sayHello()

func getMinhsInfo() -> (name:String, age:Int, isStudent:Bool) {
    return("Minh", 21, true);
}
print(getMinhsInfo()); //get all return values

let info = getMinhsInfo();
print(info.name);
print(info.age);

func count(numbers:Int...) {
    var total: Int = 0;
    for i in 1...numbers.count{
        total = total + 1;
    }
    print(total);

}
count(numbers: 1, 2, 3, 4, 51);

//function to multiply to numbers
func multiplication(num1: Int, num2: Int) -> Int {
    return num1*num2;
}
var multiply = multiplication(num1:2,num2:3);
print(multiply)

//function to split a string into 2 parts
func splitString(str:String, index:Int) -> (string1: String, string2: String) {
    if (index < 0 || index > str.count) {
        return ("", "")
    }
    let string1 = String(str.prefix(index));
    let string2 = String(str.suffix(str.count - index));
    return (string1, string2)
}
var splitStrings = splitString(str:"hello world",index:4);
print(splitStrings.string1, splitStrings.string2);

//recursive function to calculate factorial of a number
func factorial(number:Int) -> Int {
    if (number == 0) {
        return 1;
    }
    return number * factorial(number:number - 1);
}

var factorial_result = factorial(number:5);
print(factorial_result);

//loops
for i in 1...10{
    print(i);
}

var employees = ["Minh", "Anna", "Emma"];
for em in employees{
    print(em);
}

for em in employees where (em != "Minh") {
    print(em);
}

for i in stride(from:0, to: 11, by:1) {
    print(i)
}

var i = 0;
while (i <= 5) {
    print(i);
    i = i + 1;
}

var j = 0;
repeat {
    j = j + 1;
    print(j);
} while (j <= 5)

//--------------------------------------------------------------------
//reference and value types
//class is passed-by-reference
class Animal {
    var name:String = "";
    var wasFed: Bool = false;

}
let dog = Animal();
dog.name = "Pin";
dog.wasFed = true;

print(dog.wasFed)


let goldenTriever = dog;
goldenTriever.wasFed = false;

print(dog.wasFed);
print(goldenTriever.wasFed);

//Ints are passed-by-value
a = 20;
b = a;
b = b + 1;
print(a, b);


//-------------------------------------------------
//client side for classes

//putting comments here to avoid same name variables -- uncomment them to see the results
//let minh = Person(name:"Minh", age:21); //instantiate a Person object
//print(minh.age)
//minh.changeName(newName: "Lan")
//print(minh.name)


var nghi = Student(classOf:2020, major: "CS", gpa:3.6)
nghi.changeClass(classYear:2023)
print("Now nghi's class is \(nghi.classOf)")


let minh = Student(classOf: 2023, major: "CS", gpa: 4.0)
var giang = minh
giang.major = "arts"
print("minh's major is \(minh.major)")  //print CS
print("giang's major is \(giang.major)") //prints arts

let Hoang = Teacher(name:"Hoang", age: 30);
Hoang.worksAt(); //prints "teaching at Fulbright"
print(Hoang.introduction)
