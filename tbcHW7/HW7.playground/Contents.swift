import Foundation


// MARK: - task1
/*შექმენით FoodGroup Enum, რომელიც მოიცავს: fruit, vegetable, protein, dairy, grain ჩამონათვალს. */

enum FoodGroup {
    case fruit
    case vegetable
}

// MARK: - task2
/*შექმენით enum ProductStatus (გაყიდულია, ხელმისაწვდლომია ქეისებით) */

enum ProductStatus {
    case sale
    case available
}

// MARK: - task3
/* შექმენით სტრუქტურა Product რომელიც შეიცავს
 ცვლადებს: name, category(FoodGroup), price, info(რომელიც ფასის და სახელის ინფოს მოგვაწვდის), ფასდაკლება, მასა, კალორია100გრამზე, ProductStatus ცვლადი
 ფუნქციები: ფადაკლებული ფასის ჩვენება, ყიდვა, გამოითვალე კალორია მასაზე დაყრდნობით.*/


// ჩავთვალოთ რო ცალცალი პროდუქტი გვაქ ყიდვის შემთხვაში რო არარ იყიოს
// ჩავთვალოთ რო წონა ითვლება კილოგრამებში

struct Product {
    var name: String
    var category: FoodGroup
    var price: Double
    var info: String {
        return ("name: \(name), price: \(price)")
    }
    var discount: Double
    var mass: Double
    var calories100g: Double
    var ProductStatus: ProductStatus
    
    func discountPrice() -> Double{
         price - price * discount / 100
    }
    func countCalories() -> Double {
        mass * 10 * calories100g
    }
    mutating func buy() {
        if self.ProductStatus == .available {
            self.ProductStatus = .sale
            print("ბოლო ცალი შეიძინეთ")
        }
        else {
            print("მარაგი ამოიწურა")
        }
    }
}

// MARK: - task4
/*შექმენით მასივი პროდუქტებით სადაც მინიმუმ 15 პროდუქტი გექნებათ.*/


//პომიდორი ხილია

var products: [Product] = [
    Product(name: "ვაშლი", category: .fruit, price: 2.0, discount: 10, mass: 150, calories100g: 52, ProductStatus: .available),
    Product(name: "ფორთოხალი", category: .fruit, price: 3.0, discount: 5, mass: 200, calories100g: 47, ProductStatus: .available),
    Product(name: "ბანანი", category: .fruit, price: 4.0, discount: 0, mass: 120, calories100g: 89, ProductStatus: .sale),
    Product(name: "სტაფილო", category: .vegetable, price: 1.0, discount: 20, mass: 100, calories100g: 41, ProductStatus: .available),
    Product(name: "კიტრი", category: .vegetable, price: 1.5, discount: 15, mass: 250, calories100g: 16, ProductStatus: .available),
    Product(name: "პომიდორი", category: .fruit, price: 2.0, discount: 5, mass: 180, calories100g: 18, ProductStatus: .sale),
    Product(name: "ყურძენი", category: .fruit, price: 4.5, discount: 10, mass: 300, calories100g: 67, ProductStatus: .available),
    Product(name: "საზამთრო", category: .fruit, price: 7.0, discount: 0, mass: 5000, calories100g: 30, ProductStatus: .available),
    Product(name: "წიწაკა", category: .vegetable, price: 3.2, discount: 25, mass: 350, calories100g: 17, ProductStatus: .available),
    Product(name: "კარტოფილი", category: .vegetable, price: 2.1, discount: 10, mass: 220, calories100g: 77, ProductStatus: .available),
    Product(name: "მარწყვი", category: .fruit, price: 5.0, discount: 15, mass: 200, calories100g: 32, ProductStatus: .available),
    Product(name: "ატამი", category: .fruit, price: 3.5, discount: 20, mass: 150, calories100g: 39, ProductStatus: .sale),
    Product(name: "ბროკოლი", category: .vegetable, price: 4.0, discount: 0, mass: 300, calories100g: 34, ProductStatus: .available),
    Product(name: "ქინძი", category: .vegetable, price: 3.8, discount: 5, mass: 180, calories100g: 20, ProductStatus: .available),
    Product(name: "მანგო", category: .fruit, price: 6.0, discount: 10, mass: 250, calories100g: 60, ProductStatus: .sale)
]


// MARK: - task5
/*მიღებული მასივისგან შექმენით ახალი მასივი სადაც მხოლოდ პროდუქტის name იქნება ჩამოწერილი */

var nameArray = products.map { $0.name }

// MARK: - task6
/*თავდაპირველი მასივის ელემენტები დაალაგეთ ფასის ზრდადობის მიხედვით. */
// MARK: - task7
/* რენდომ (1)კატეგორიის ყველა პროდუქტის სტატუსი შეცვალეთ ხელმისაწვდომიდან გაყიდულზე.*/
// MARK: - task8
/* გაიგეთ ყველა იმ პროდუქტის ერთეულის ჯამური ღირებულება რომელიც ხელმისაწვდომია.*/



// MARK: - BOUNS
// MARK: - task9
/* შექმენით ფუნქცია რომელიც მიიღებს პროდუქტების მასივს და დააბრუნებს dictionary-ს სადაც key იქნება კატეგორიის სახელწოდება და value იქნება იმ პროდუქტების მასივი რომლებიც შეესაბამება მოცემულ კატეგორიას.*/

