import Foundation


print("-------------1")
//task1 - შექმენით ორი მუდმივა (let) და ორი ცვლადი (var) სხვადასხვა ტიპის (Int, Double, String, Bool). მიანიჭეთ მათ მნიშვნელობები და დაბეჭდეთ.

let age: Int = 18
let price: Double = 3.14
var status = true
var userName: String = "apple"

print(age)
print(status)
print(price)
print(userName)

// print("-------------2")
// //task2 - შექმენით Int ტიპის ცვლადი და გამოიყენეთ არითმეტიკული ოპერატორები (+, -, *, /) სხვადასხვა ოპერაციების შესასრულებლად. დაბეჭდეთ შედეგები.

// var x: Int = 4

// print(x + x)
// print(x - x)
// print(x * x)
// print(x / x)

// print("-------------3")
// //task3 - შექმენით ორი Double ტიპის ცვლადი და გამოიყენეთ შედარების ოპერატორები (==, !=, >, <, >=, <=) მათ შესადარებლად. დაბეჭდეთ შედარების შედეგები.

// var a:Double = 3.14     // სფეისინგს მივაქციოთ ყურადღება (a: Double)
// var b:Double = 5.26

// print(a == b)
// print(a != b)
// print(a > b)
// print(a < b)
// print(a >= b)
// print(a <= b)

// print("-------------4")
// //task4 შექმენით String ტიპის ცვლადი თქვენი სახელით და Character ტიპის მუდმივა თქვენი სახელის პირველი ასოთი. გამოიყენეთ სტრინგის ინტერპოლაცია ორივე მნიშვნელობის დასაბეჭდად ერთ წინადადებაში.

// var myName: String = "Andria"
// let firstLetterMyName: Character = "A"

// print( "my name is \(myName) and first letter is \(firstLetterMyName)")

// print("-------------5")
// //task5 შექმენით Optional String ტიპის ცვლადი. გამოიყენეთ optional binding (if let), რომ უსაფრთხოდ ამოიღოთ მნიშვნელობა და დაბეჭდოთ ის.

// var test: String? = "congret"

// if let droebiti = test {
//     print(droebiti)
// } else {
//     print("test is empty")
// }

// print("-------------6")
// //task6 6. დაწერეთ for-in ციკლი, რომელიც დაბეჭდავს რიცხვებს 1-დან 10-მდე.

// for number1 in 1..<10 {
//     print(number1)
// }


// print("-------------7")
// //task7 შექმენით Int ტიპის ცვლადი და გამოიყენეთ while ციკლი, რომ დაბეჭდოთ მისი მნიშვნელობა 0-მდე (ყოველ იტერაციაზე აკლებთ 1-ს).

// var randomNumber: Int = 5
// while randomNumber > -1 {
//     print(randomNumber)
//     randomNumber -= 1
// }

// print("-------------8")
// //task8 დაწერეთ if-else if-else სტრუქტურა, რომელიც შეამოწმებს Int ტიპის ცვლადის მნიშვნელობას და დაბეჭდავს შესაბამის შეტყობინებას (მაგალითად, დადებითია, უარყოფითია თუ ნულის ტოლი).

// var num = 5

// if num < 0 {
//     print("უარყოფითია")
// } else if num > 0 {
//     print("დადებიტია")
// } else {
//     print("ნულის ტოლია")
// }
// print("-------Gradable assignments completed-------")

// //task9 შექმენით ორი Int ტიპის ცვლადი: number და sum. გამოიყენეთ while ციკლი number-ის ციფრების ჯამის გამოსათვლელად და შედეგი შეინახეთ sum-ში. მაგალითად, თუ number არის 1234, sum უნდა იყოს 10 (1+2+3+4). დაბეჭდეთ საწყისი რიცხვი და მიღებული ჯამი.

// var number: Int = 1234
// var sum: Int = 0

// while number > 0 {
//     sum += number % 10
//     number = (number - (number % 10))/10
// }
// print(sum)

// print("-------------10")
// //task10 შექმენით String ტიპის ცვლადი სიტყვით და Int ტიპის ცვლადი სახელით count ნულის მნიშვნელობით. გამოიყენეთ for-in ციკლი სიტყვაში ხმოვნების (a, e, i, o, u) დასათვლელად. ყოველი ხმოვნის შემთხვევაში გაზარდეთ count ერთით. ციკლის დასრულების შემდეგ დაბეჭდეთ საწყისი სიტყვა და მასში ნაპოვნი ხმოვნების რაოდენობა.


// var word: String = "saqartvelo"
// var count: Int = 0

// for i in word {
//     if i == "a" || i == "e" || i == "i" || i == "o" || i == "u" {
//         count += 1
//     }
// }
// print(count)

// print("-------------11")
// //task11 შექმენით სტრინგ ტიპის ცვლადი და მიანიჭეთ მნიშვნელობა, დაბეჭდეთ მისი შებრუნებული მნიშვნელობა, მაგ: “xCode” -> “”edoCx”

// var alo: String = "hola"
// var reversedAlo = ""
// for i in alo {
//     reversedAlo = "\(i)" + reversedAlo
// }
// print(reversedAlo)


// print("-------------12")

// //task12 შქმენით Int ტიპის ცვლადი და მიანიჭეთ მას ორნიშნა მნიშვნელობა, შეამოწმეთ შედგება თუ არა ეს რიცხვი ერთი და იგივე ციფრებისგან.


// var num1:Int = 33   // სფეისინგი აქაც
// if num1 % 10 ==  (num1 - (num1 % 10)) / 10 {
//     print("ეს რიცხვი ერთი და იგივე ციფრებისგან შედგება")
// } else { print("ეს რიცხვი სხვადასხვა ციფრებისგან შედგება")  // print ბრძანება ახალ ხაზზე, ისე როგორც სხვა შემთხვევებში გაქვს.
// }

// print("happy end")
