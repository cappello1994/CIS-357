//: Playground - noun: a place where people can play

import UIKit
//: problem 1
let myString = "hello"
var cost = 3.14
let cnt: Int = 2
var shouldWe: Bool = true
let hexCst: Int = 0x11
let decCst: Int = 0b1010

//: problem 2
let fltNum: Float = 7.89
var mixMsg = "I like numbers"
let msg = mixMsg +  " and \(fltNum) is my favorite"

//: problem 3
var random: [String] = ["queen", "worker", "drone"]
print(random[0])
random.append("honey")
random += ["are","us"]

//: problem 4
for item in random{
    print(item)
}
for (item, value) in random.enumerated() {
    print("Item \(item) is \(value)")
}

//:problem 5
var authorRating: Dictionary<String, Float> = ["Mark Twain":8.9, "Nathaniel Hawthorne":5.1, "John Steinbeck":2.3, "C.S. Lewis":9.9, "Jon Krakaur":6.1]

//:problem 6
print(authorRating["John Steinbeck"]!)
authorRating["Erik Larson"] = 9.2


 if(authorRating["Mark Twain"]! > authorRating["Jon Krakaur"]!){
    print("Mark Twain")
}else{
    print("Jon Krakaur")
}
 

//:problem 7
for(author, rating) in authorRating{
    print("\(author): \(rating)")
}

//:problem 8
for index in 1...10 {
    print(index)
}

//:problem 9
for index in 0...9 {
    print(10-index)
}

//:problem 10
let x: Int = 2
let y: Int = 9
var product: Int = 0
for _ in 1...x{
    product+=y
}
print(product)
