import UIKit

// MARK: - task1

/*შექმენით მასივი `fruits`, რომელიც შეიცავს 5 ხილის სახელს. გამოიყენეთ `forEach` მეთოდი, რომ დაბეჭდოთ თითოეული ხილის სახელი ცალ-ცალკე ხაზზე.*/

let fruits = ["ვაშლი", "მსხალი", "ატამი", "ბანანი", "პომიდორი"]

fruits.forEach {
    print($0)
}


// MARK: - task2

/*დაწერეთ ფუნქცია `filterEvenNumbers`, რომელიც იღებს Int-ების მასივს და იყენებს `filter` მეთოდს, რომ დააბრუნოს ახალი მასივი მხოლოდ ლუწი რიცხვებით. გამოიძახეთ ეს ფუნქცია სხვადასხვა მასივებზე და დაბეჭდეთ შედეგები.*/

func filterEvenNumbers ( ArrayOfNumbers: [Int] ) -> [Int] {
    ArrayOfNumbers.filter{ $0 % 2 == 0 }
}

print(filterEvenNumbers(ArrayOfNumbers: [1, 2, 3, 4, 5]))
print(filterEvenNumbers(ArrayOfNumbers: [3, 21, 32]))



// MARK: - task3
/*დაწერეთ ფუნქცია sumOfUniqueSquares, რომელიც იღებს Int-ების მასივს, გადააქცევს მას Set-ად (რომ მოაშოროს დუბლიკატები), შემდეგ იყენებს map მეთოდს ყველა ელემენტის კვადრატში ასაყვანად, და ბოლოს reduce მეთოდს ჯამის გამოსათვლელად. გამოიძახეთ ეს ფუნქცია სხვადასხვა მასივებზე და დაბეჭდეთ შედეგები.*/


func sumOfUniqueSquares (array: [Int]) -> Int {
    Set(array)
        .map{ $0 * $0 }
        .reduce(0) { $0 + $1 }
}

print(sumOfUniqueSquares(array: [1, 2, 3]))
print(sumOfUniqueSquares(array: [7, 5, 6, 9]))
// MARK: - task4
/*შექმენით ორი Set fruitsA და fruitsB, რომელებიც შეიცავენ ხილების სახელებს (ზოგიერთი ხილი შეიძლება გვქონდეს ორივე სეტში). გამოიყენეთ Set-ის ოპერაციები (union, intersection, symmetricDifference) და forEach მეთოდი, რომ დაბეჭდოთ: 1) ყველა უნიკალური ხილი ორივე სეტიდან 2) ხილები, რომლებიც ორივე სეტში გვხვდება 3) ხილები, რომლებიც მხოლოდ ერთ სეტშია*/

let fruitsA: Set = ["მსხალი", "ვაშლი", "ბანანი", "ანანასი"]
let fruitsB: Set = ["ატამი", "ვაშლი", "ქლიავი", "ქოქოსი"]

print("ყველა უნიკალური ხილი ორივე სეტიდან")
let union = fruitsA.union(fruitsB)
union.forEach{ print($0) }

print("ხილები, რომლებიც ორივე სეტში გვხვდება")
let intersection = fruitsA.intersection(fruitsB)
intersection.forEach{ print($0) }

print("ხილები, რომლებიც მხოლოდ ერთ სეტშია")
let symmetricDifference = fruitsA.symmetricDifference(fruitsB)
symmetricDifference.forEach{ print($0) }

// MARK: - task5
/* შექმენით ორგანზომილებიანი მასივი `matrix`, რომელიც შეიცავს რამდენიმე Int მასივს. გამოიყენეთ `flatMap` მეთოდი, რომ გადააქციოთ ის ერთგანზომილებიან მასივად. დაბეჭდეთ ორიგინალი მატრიცა და მიღებული ბრტყელი მასივი.*/
let matrix:[[Int]] = [[1, 2, 5], [6, 8, 9]]

let flatNumbers = matrix.flatMap{ $0 }

print(matrix)
print(flatNumbers)

// MARK: - task6
/* დაწერეთ ფუნქცია `processOptionalNumbers`, რომელიც იღებს `[Int?]` ტიპის მასივს (ოფციონალური Int-ების მასივი). გამოიყენეთ `compactMap`, რომ მიიღოთ ახალი მასივი, სადაც ყველა nil მნიშვნელობა მოშორებულია და დანარჩენი რიცხვები გაორმაგებულია. გამოიძახეთ ფუნქცია და დაბეჭდეთ შედეგი.*/



func processOptionalNumbers(_ numbers: [Int?]) -> [Int] {
    numbers.compactMap { $0 }
        .map { $0 * 2 }
}

print(processOptionalNumbers([1, nil, 3, 4, nil, 6]))

// MARK: - task7
/*
 შექმენით ორი სხვადასხვა ტიპის მასივი: `names` (String-ების მასივი) და `ages` (Int-ების მასივი). გამოიყენეთ `zip` ფუნქცია ამ ორი მასივის გასაერთიანებლად, შემდეგ კი `sorted` მეთოდი, რომ დაალაგოთ მიღებული კოლექცია ასაკის მიხედვით. დაბეჭდეთ შედეგი.
 */

let names: [String] = ["Andria", "Nana", "Giorgi"]
let ages: [Int] = [21, 20, 18]

let sortedCombinedArrays = zip(names, ages)
    .sorted { first, second in
    first.1 < second.1
}

for (name, age) in sortedCombinedArrays {
    print(" \(name): \(age)")
}


// MARK: - task8
// FIXME: - reduce
/*დაწერეთ ფუნქცია `groupWordsByLength`, რომელიც იღებს String-ების მასივს და იყენებს `reduce` მეთოდს, რომ დააჯგუფოს სიტყვები მათი სიგრძის მიხედვით Dictionary-ში. გამოიძახეთ ეს ფუნქცია სხვადასხვა სიტყვების მასივზე და დაბეჭდეთ შედეგი.
 
 მაგალითად: input: ["apple", "banana", "kiwi", "grape", "strawberry"]

       output: [4: ["kiwi"], 5: ["apple", "grape"], 6: ["banana"], 10: ["strawberry"]]*/


func groupWordsByLength(wordsArray: [String]) -> [Int: [String]] {
    var groupedDict = [Int: [String]]()
    
    return wordsArray.reduce(into: groupedDict) { result, word in
            let length = word.count
            result[length, default: []].append(word)
        }
}


let wordsArray1 = ["apple", "banana", "kiwi", "grape", "strawberry"]
let wordsArray2 = ["dog", "cat", "horse", "rabbit", "mouse"]
print(groupWordsByLength(wordsArray: wordsArray1).sorted { $0.key < $1.key })
print(groupWordsByLength(wordsArray: wordsArray2).sorted { $0.key < $1.key })

//რედიუს გამოყენებულ
 
// MARK: - bonus tasks

// MARK: -task9
/* შექმენით ფუნქცია processNumbers, რომელიც იღებს Int-ების მასივს და ასრულებს შემდეგ ოპერაციებს: 1) იყენებს filter მეთოდს, რომ დატოვოს მხოლოდ დადებითი რიცხვები 2) იყენებს map მეთოდს, რომ ყველა დარჩენილი რიცხვი აიყვანოს კვადრატში 3) იყენებს sorted მეთოდს, რომ დაალაგოს შედეგი კლებადობით 4) იყენებს prefix მეთოდს, რომ დააბრუნოს პირველი 5 ელემენტი (ან ნაკლები, თუ 5-ზე ნაკლები ელემენტია)
 
 მაგალითად: input: [3, -1, 7, 0, 5, -4, 2, 9, 11]

       output: [121, 81, 49, 25, 9]*/


func processNumbers(intArray: [Int]) {
    let NumbersArray = intArray.filter{ $0 > 0 }
        .map { $0 * $0 }
        .sorted(by: > )
    
    print(NumbersArray.prefix(5))
}

processNumbers (intArray: [1, 2, -3, 4, 6, 3, 10, -7, 30])


// MARK: -task10
/*დაწერეთ ფუნქცია `applyOperations`, რომელიც იღებს Int-ების მასივს და closure-ების მასივს, სადაც თითოეული closure იღებს Int-ს და აბრუნებს Int-ს. ფუნქციამ უნდა გამოიყენოს `map` მეთოდი, რომ ყველა ოპერაცია ჩაატაროს ყველა რიცხვზე და დააბრუნოს შედეგების მასივი. გამოიძახეთ ეს ფუნქცია სხვადასხვა რიცხვებისა და ოპერაციების კომბინაციებით.
 */

func applyOperations(intArray: [Int], operations: [(Int) -> Int]) -> [Int] {
    intArray.flatMap { num in
        operations.map { closure in
            closure(num)
        }
    }
}


let closure1: (Int) -> Int = { num in
    num * num
}
let closure2: (Int) -> Int = { num in
    num + num
}



print(applyOperations(intArray: [1, 2, 3], operations: [closure1, closure2]))




// MARK: -task11
/* შექმენით ფუნქცია ‘filterAndTransform’, რომელიც იღებს Int-ების მასივს და ასრულებს შემდეგ ოპერაციებს: 1) იყენებს filter მეთოდს, რომ დატოვოს მხოლოდ 10-ზე მეტი რიცხვები 2) იყენებს map მეთოდს, რომ გამოაკლოს 10 ყველა დარჩენილ რიცხვს 3) იყენებს sorted მეთოდს, რომ დაალაგოს შედეგი ზრდადობით.*/


func filterAndTransform(_ array: [Int] ) -> [Int] {
     array.filter{ $0 > 10 }
        .map { $0 - 10 }
        .sorted()
}
    
print(filterAndTransform([1, 2, 3, 10, 22, 21, 34]))

 

// MARK: -task12
/* დაწერეთ ფუნქცია `executeInOrder`, რომელიც იღებს ვარიადულ closure პარამეტრს (ყველა closure-ს აქვს ტიპი `() -> Void`). ფუნქციამ უნდა შეასრულოს ეს closure-ები მიმდევრობით, ყოველი შესრულების წინ და შემდეგ კი დაბეჭდოს შესაბამისი შეტყობინება. გამოიძახეთ ეს ფუნქცია რამდენიმე სხვადასხვა ოპერაციით და დააკვირდით შესრულების თანმიმდევრობას.*/

func executeInOrder (closureParametre: (() -> Void) ...) {
    
    for closure in closureParametre {
        print("გული ზღვას ეძახის")
        closure()
        print("გულით ტკივილს ისმენს,")
    }
}
 
let closureOne = {
    print("ტალღა ღრმა და მღელვარე")
}
 
let closureTwo = {
    print("მზე რომ ნისლებს ებრძვის")
}
 
let closureThree = {
    print("გზა კვლავ დაკარგული")
}
 
executeInOrder (closureParametre: closureOne, closureTwo, closureThree)

