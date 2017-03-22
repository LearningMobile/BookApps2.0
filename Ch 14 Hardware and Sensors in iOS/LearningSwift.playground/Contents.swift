//: Playground - noun: a place where people can play

import UIKit
import CoreLocation

var str = "Hello, playground"
print("Hello World")

var name = "Jane Austen"
var age = 42
var price = 19.95
var salePrice: Double = 25
let lastName: String
let title: String?

lastName = "jie"

var colors = ["blue", "green", "red"] //Declare an array and assign three values to it
let green = colors[1] //Retrieve the value from the second element and assign it to a constant
colors[2] = "white" //Change the value of the 3rd element
colors.append("yellow") //Add a new element. Have to append to expand the array
let numColors = colors.count //Returns the number of elements in the array
let yellow = colors.last //Retrieve the last element in the array
var empty:[Int] = [] //Declare an empty array set to hold only Int values

var productColor = [String:String]() //Create a new empty dictionary
productColor = [ //Assign values to the dictionary
    "X12": "blue",
    "C45": colors[1],
    "B32": "purple"
]
let blue = productColor["X12"] //Retrieve value from one of the dictionary entries
productColor["C45"] = "black" //Set value for dictionary entry
var emptyDict: [String:Float] = [:] //Create an empty dictionary where type information can be inferred

if salePrice < 20 {
    print("What a find!")
} else {
    print("That's expensive!")
}

var description = ""
switch age {
case 0...4:
    description = "toddler"
case 5, 6:
    description = "ready for school"
case 7...12:
    description = "tweenager"
case 13...19:
    description = "teenager"
case 20..<130:
    description = "adult"
case Int.min..<0:
    description = "Undefined age"
default:
    description = "Undefined age"
}


let prices = [12.34, 34.56, 32.43]
var sum:Double = 0
for price in prices {
    sum += price
}

for i in 1...10 {
    print(i)
}

var length:Int?
let len:Int? = length
length = 6

if length! > 9 {
    print ("long")
} else {
    print("short")
}

class Book{
    var author: String
    var title: String
    var lender: String?
    var isOut: Bool
    
    init(title: String, by author: String) {
        self.title = title
        self.author = author
        isOut = false
    }
    
    func lendOut(lender: String){
        if !isOut {
            self.lender = lender
            isOut = true
        }
        
    }
    
    func returnBook() {
        isOut = false
        lender = nil
    }
    
    
}
func findBooks(author: String) -> [Book]
{
    return []
}

private func add(number1: Int, number2: Int) -> Int
{
    return number1 + number2
}

var result = add(number1: 12, number2: 3)
add(number1: 5, number2: 6)

func subtract(_ number1:Int, from number2:Int) -> Int{
    return number1 - number2
}

result = subtract(10, from: 12)

func enroll(name: String, in major: String) -> String {
    return "Hello \(name)! Welcome to \(major)?"
}

print(enroll(name: "Jim", in: "Information Systems"))

var math: (Int, Int) -> Int
math = add
var n = math(2, 3)
math = subtract
n =  math(2, 3)

func calculate(symbol: Character) -> (Int, Int) -> Int {
    
    func doNothing(n1: Int, n2: Int) -> Int { return 0 } //Nested function
    
    switch symbol {
    case "+":
        return add
    case "-":
        return subtract
    default:
        return doNothing
    }
}

math = calculate(symbol: "+")
n = math(2, 4)

let geoCoder = CLGeocoder()
let address = "100 Main St"
geoCoder.geocodeAddressString(address, completionHandler: { (placemarks: [CLPlacemark]?, error: Error?) in
    processAddressResponse(contact, withPlacemarks: placemarks, error: error)
}

func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler)
typealias CLGeocodeCompletionHandler = ([CLPlacemark]?, Error?) -> Void

//Method body omitted