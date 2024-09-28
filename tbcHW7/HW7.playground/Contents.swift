import Foundation


// MARK: - task1
/*შექმენით FoodGroup Enum, რომელიც მოიცავს: fruit, vegetable, protein, dairy, grain ჩამონათვალს. */

enum FoodGroup: CaseIterable {
    case fruit
    case vegetable
    case protein
    case dairy
    case grain
}

// MARK: - task2
/*შექმენით enum productStatus (გაყიდულია, ხელმისაწვდლომია ქეისებით) */

enum productStatus {
    case soldOut
    case available
}

// MARK: - task3
/* შექმენით სტრუქტურა Product რომელიც შეიცავს
 ცვლადებს: name, category(FoodGroup), price, info(რომელიც ფასის და სახელის ინფოს მოგვაწვდის), ფასდაკლება, მასა, კალორია100გრამზე, productStatus ცვლადი
 ფუნქციები: ფადაკლებული ფასის ჩვენება, ყიდვა, გამოითვალე კალორია მასაზე დაყრდნობით.*/


// ჩავთვალოთ რო ცალცალი პროდუქტი გვაქ ყიდვის შემთხვაში რო არარ იყიოს
// ჩავთვალოთ რო წონა ითვლება კილოგრამებში

struct Product {
    var name: String
    var category: FoodGroup
    var price: Double
    var info: String {
        "name: \(name), price: \(price)"
    }
    var discount: Double
    var mass: Double
    var calories100g: Double
    var productStatus: productStatus
    
    func discountPrice() -> Double {
         price - price * discount / 100
    }
    func countCalories() -> Double {
        mass * 10 * calories100g
    }
    mutating func buy() {
        if self.productStatus == .available {
            self.productStatus = .soldOut
            print("ბოლო ცალი შეიძინეთ")
        }else {
            print("მარაგი ამოიწურა")
        }
    }
}

// MARK: - task4
/*შექმენით მასივი პროდუქტებით სადაც მინიმუმ 15 პროდუქტი გექნებათ.*/


//პომიდორი ხილია

var products: [Product] = [
    Product(name: "ვაშლი", category: .fruit, price: 2.0, discount: 10, mass: 150, calories100g: 52, productStatus: .available),
    Product(name: "ფორთოხალი", category: .fruit, price: 3.0, discount: 5, mass: 200, calories100g: 47, productStatus: .available),
    Product(name: "ბანანი", category: .fruit, price: 4.0, discount: 0, mass: 120, calories100g: 89, productStatus: .soldOut),
    Product(name: "სტაფილო", category: .vegetable, price: 1.0, discount: 20, mass: 100, calories100g: 41, productStatus: .available),
    Product(name: "კიტრი", category: .vegetable, price: 1.5, discount: 15, mass: 250, calories100g: 16, productStatus: .available),
    Product(name: "პომიდორი", category: .fruit, price: 2.0, discount: 5, mass: 180, calories100g: 18, productStatus: .soldOut),
    Product(name: "ყურძენი", category: .fruit, price: 4.5, discount: 10, mass: 300, calories100g: 67, productStatus: .available),
    Product(name: "საზამთრო", category: .fruit, price: 7.0, discount: 0, mass: 5000, calories100g: 30, productStatus: .available),
    Product(name: "წიწაკა", category: .vegetable, price: 3.2, discount: 25, mass: 350, calories100g: 17, productStatus: .available),
    Product(name: "კარტოფილი", category: .vegetable, price: 2.1, discount: 10, mass: 220, calories100g: 77, productStatus: .available),
    Product(name: "მარწყვი", category: .fruit, price: 5.0, discount: 15, mass: 200, calories100g: 32, productStatus: .available),
    Product(name: "პური", category: .grain, price: 2.0, discount: 10, mass: 0.5, calories100g: 37, productStatus: .soldOut),
    Product(name: "ქათმის ფილე", category: .protein, price: 5.0, discount: 10, mass: 1.0, calories100g: 30, productStatus: .available),
    Product(name: "რძე", category: .dairy, price: 1.2, discount: 10, mass: 1.6, calories100g: 3, productStatus: .available),
    Product(name: "ბრინჯი", category: .grain, price: 1.0, discount: 10, mass: 1.0, calories100g: 30, productStatus: .soldOut)
]




// MARK: - task5
/*მიღებული მასივისგან შექმენით ახალი მასივი სადაც მხოლოდ პროდუქტის name იქნება ჩამოწერილი */

var nameArray = products.map { $0.name }

// MARK: - task6
/*თავდაპირველი მასივის ელემენტები დაალაგეთ ფასის ზრდადობის მიხედვით. */

var sortedArray = products.sorted{ $0.price < $1.price }

// MARK: - task7
/* რენდომ (1)კატეგორიის ყველა პროდუქტის სტატუსი შეცვალეთ ხელმისაწვდომიდან გაყიდულზე.*/


let randomCategory = FoodGroup.allCases.randomElement()!


for product in 0..<products.count {
    if products[product].category == randomCategory {
        products[product].productStatus = .soldOut
    }
}

// MARK: - task8
/* გაიგეთ ყველა იმ პროდუქტის ერთეულის ჯამური ღირებულება რომელიც ხელმისაწვდომია.*/
var count: Double = 0
for index in products.indices {
    if products[index].productStatus == .available {
        count += products[index].price * products[index].mass
    }
}
print(count)


// MARK: - BOUNS
// MARK: - task9



/* შექმენით ფუნქცია რომელიც მიიღებს პროდუქტების მასივს და დააბრუნებს dictionary-ს სადაც key იქნება კატეგორიის სახელწოდება და value იქნება იმ პროდუქტების მასივი რომლებიც შეესაბამება მოცემულ კატეგორიას.*/

func productDictionary(products: [Product]) -> [FoodGroup: [String]] {
    return products.reduce(into: [FoodGroup: [String]]()) { dictionary, product in
        dictionary[product.category, default: []].append(product.name)
    }
}

