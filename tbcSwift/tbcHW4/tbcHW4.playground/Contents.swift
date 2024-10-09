import Foundation

// MARK: - task1
//შექმენით ფუნქცია სახელად `greet`, რომელიც იღებს String ტიპის პარამეტრს `name` და ბეჭდავს მისალმებას. მაგალითად, თუ გადავცემთ "გიორგი", უნდა დაიბეჭდოს "გამარჯობა, გიორგი!".


func greet(name: String) {
    print("გამარჯობა, \(name)!")
}
//greet(name: "andria")

// MARK: - task2
/*დაწერეთ ფუნქცია printMultiplicationTable, რომელიც იღებს ერთ Int ტიპის პარამეტრს number და ბეჭდავს ამ რიცხვის გამრავლების ტაბულას 1-დან 10-მდე. მაგალითად, თუ გადავცემთ 5-ს, ფუნქციამ უნდა დაბეჭდოს:
5 x 1 = 5

5 x 2 = 10

5 x 3 = 15

...

5 x 10 = 50

გამოიძახეთ ეს ფუნქცია რამდენიმე სხვადასხვა რიცხვისთვის.*/

func printMultiplicationTable(number: Int) {
    var multiplier = 1
    while multiplier < 11 {
        print("\(number) x \(multiplier) = \(number * multiplier) \n")
        multiplier += 1
    }
    
}
printMultiplicationTable(number: 5)
printMultiplicationTable(number: 6)


// MARK: - task3
/*შექმენით ფუნქცია `isEven`, რომელიც იღებს Int ტიპის პარამეტრს და აბრუნებს Bool-ს - true თუ რიცხვი ლუწია, false თუ კენტი. გამოიყენეთ ეს ფუნქცია რამდენიმე რიცხვის შესამოწმებლად და დაბეჭდეთ შედეგები.*/

func isEven(number: Int) -> Bool {
    number % 2 == 0
}
print(isEven(number: 4))
print(isEven(number: 3))

//MARK: - task4
/*დაწერეთ ფუნქცია `repeatString`, რომელსაც აქვს ორი პარამეტრი: String ტიპის `text` და Int ტიპის `count`. ფუნქციამ უნდა დააბრუნოს ახალი სტრინგი, სადაც `text` გამეორებულია `count`-ჯერ. მაგალითად, `repeatString("ჰა", 3)` უნდა დააბრუნოს "ჰაჰაჰა".*/

func repeatString(text: String, count: Int) -> String {
    var coun = count
    var txt = text
    while coun > 1 {
        txt += text
        coun -= 1
    }
    return txt
}
//print(repeatString(text: "ჰა", count: 3))

//MARK: -task5
/*შექმენით ფუნქცია `calculateTax`, რომელსაც აქვს ორი პარამეტრი: Double ტიპის `price` და Double ტიპის `taxRate` (პროცენტებში). ფუნქციამ უნდა დააბრუნოს გადასახადის თანხა. გამოიძახეთ ეს ფუნქცია სხვადასხვა ფასისთვის და დაბეჭდეთ შედეგები.*/

func calculateTax(price: Double, taxRate: Double) -> Double {
    price * taxRate / 100
}
print(calculateTax(price: 100.0, taxRate: 12.0))
print(calculateTax(price: 80.0, taxRate: 12.0))

//MARK: -task6
/*დაწერეთ ფუნქცია `printNumbers`, რომელსაც აქვს ვარიადული Int ტიპის პარამეტრი `numbers`. ფუნქციამ უნდა დაბეჭდოს ყველა გადაცემული რიცხვი. გამოიძახეთ ეს ფუნქცია სხვადასხვა რაოდენობის არგუმენტებით.*/

func printNumbers(_ numbers: Int...) {
    print(numbers)
}
printNumbers(1, 2, 4)
printNumbers(3, 7)

//MARK: -task7
/*ფუნქციის გარეთ შექმენით მუდმივა ‘pi’ და მიანიჭეთ შესაბამისი მნიშვნელობა. შექმენით ფუნქცია ‘calculateCircleArea’ რომელსაც აქვს Double ტიპის პარამეტრი `radius`. Pi-ს და radius-ის გამოყენებით დაბეჭდეთ წრის ფართობი.*/

let pi: Double = 3.14

func calculateCircleArea(radius: Double) {
    let area = pi * radius * radius
    print(area)
    
}
calculateCircleArea(radius: 1)

//MARK: -task8
/*
 შექმენით ფუნქცია printEvenNumbers, რომელიც იღებს ვარიადულ Int ტიპის პარამეტრს numbers. ფუნქციამ უნდა დაბეჭდოს მხოლოდ ლუწი რიცხვები გადმოცემული არგუმენტებიდან. გამოიძახეთ ეს ფუნქცია სხვადასხვა რაოდენობის არგუმენტებით და დაბეჭდეთ შედეგები.*/
 
 
func printEvenNumbers(numbers: Int...) {
    for number in numbers {
        if number % 2 == 0 {
            print(number)
        }
    }
    
}
printEvenNumbers(numbers: 1, 2, 3, 4)
printEvenNumbers(numbers: 6, 7, 9)

//MARK: - Bonus tasks
//MARK: - 9
/*დაწერეთ ფუნქცია `applyOperation`, რომელსაც აქვს სამი პარამეტრი: ორი Int ტიპის რიცხვი და ერთი closure, რომელიც იღებს ორ Int-ს და აბრუნებს Int-ს. ფუნქციამ უნდა გამოიყენოს ეს closure ორ რიცხვზე და დააბრუნოს შედეგი. გამოიძახეთ ეს ფუნქცია სხვადასხვა არითმეტიკული ოპერაციებისთვის (მიმატება, გამოკლება, გამრავლება) და დაბეჭდეთ შედეგები.*/
print("-------------------------------------")

func applyOperation( number1: Int, number2: Int, acction: (Int, Int) -> Int ) -> Int {
    return acction(number1, number2)
}
let sumClosure: (Int, Int) -> Int = { num1, num2 in
    num1 + num2
}
let divClosure: (Int, Int) -> Int = { num1, num2 in
    num1 / num2
}
let mulClosure: (Int, Int) -> Int = { num1, num2 in
    num1 * num2
}

print(applyOperation(number1: 12, number2: 2, acction: sumClosure))
print(applyOperation(number1: 12, number2: 2, acction: divClosure))
print(applyOperation(number1: 12, number2: 2, acction: mulClosure))

//MARK: - 10
/*შექმენით ფუნქცია `repeatOperation`, რომელსაც აქვს ორი პარამეტრი: Int ტიპის `count` და @autoclosure ტიპის closure `operation`. ფუნქციამ უნდა გამოიძახოს ეს operation `count`-ჯერ. გამოიყენეთ ეს ფუნქცია, რომ დაბეჭდოთ "გამარჯობა" 5-ჯერ.*/

func repeatOperation(count: Int, operation: @autoclosure () -> String) {
    var num = 0
    while num < count {
        num += 1
        print(operation())
    }
}
repeatOperation(count: 5, operation: "გამარჯობა")


//MARK: - 11
/*დაწერეთ ფუნქცია createCounter, რომელიც აბრუნებს closure-ს. ეს ფუნქცია უნდა შეიცავდეს ლოკალურ ცვლადს count, რომელიც ინიციალიზდება 0-ით. დაბრუნებულმა closure-მ უნდა გაზარდოს ეს count ცვლადი ყოველ გამოძახებაზე და დააბრუნოს მისი ახალი მნიშვნელობა.*/

func createCounter() -> () -> Int {
    var count = 0
    return {
        count += 1
        return count
    }
}
let counter = createCounter()
print(counter())
print(counter())


//MARK: - 12
/*შექმენით ფუნქცია performOperation, რომელსაც აქვს ერთი closure ტიპის პარამეტრი operation. ფუნქციამ უნდა დაბეჭდოს “ოპერაცია დაიწყო” და შემდეგ გამოიძახოს operation. გამოიძახეთ ეს ფუნქცია და closure-ს შიგნით დაბეჭდეთ “ოპერაცია დასრულდა”.*/

func performOperation(_ operation: () -> Void) {
    print("ოპერაცია დაიწყო")
    operation()
}

let operationClosure = {
    print("ოპერაცია დასრულდა")
}

performOperation(operationClosure)
