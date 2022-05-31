//
//  classAndObjects.swift
//  helloworld
//
//  Created by Tuong-Minh Phan on 31/05/2022.
//

import Foundation
//Client code is in main
class Person {
    //properties of Person goes here
    var name:String
    var age: Int
    var introduction: String {
        return "a human being"
    }
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
    func worksAt() {
        
    }
    
    func ageAge() {
        age = age + 1
    }
    func changeName() {
        name = "New Person"
    }
    func changeName(newName: String) {
        name = newName
    }
}

struct Student {
    var classOf: Int
    var major: String
    var gpa: Double
    init(classOf:Int, major:String, gpa:Double) {
        self.classOf = classOf
        self.major = major
        self.gpa = gpa
    }
    mutating func changeClass(classYear:Int) {
        classOf = 2023
    }
 }

//sub-class of Person
class Teacher: Person {
    var subject = "math"
    //overriding function
    override func worksAt() { //initialize an override method with prefix override
        print("teaching at Fulbright")
    }
    //overiding property
    override var introduction: String { //using properties of the base class' description
            return super.introduction + " that teaches " + subject
    }
}

