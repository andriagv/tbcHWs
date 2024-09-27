import Foundation


// MARK: - task1
/*შექმენით FoodGroup Enum, რომელიც მოიცავს: fruit, vegetable, protein, dairy, grain ჩამონათვალს. */

//enum FoodGroup {
//    case fruit
//    case vegetable
//    case protein
//    case dairy
//    case grain
//}

// MARK: - task2
/*შექმენით enum ProductStatus (გაყიდულია, ხელმისაწვდლომია ქეისებით) */

//enum ProductStatus: String {
//    case sold = "გაყიდულია"
//    case available = "ხელმისაწვდლომია"
//}

// MARK: - task3
/* შექმენით სტრუქტურა Product რომელიც შეიცავს
 ცვლადებს: name, category(FoodGroup), price, info(რომელიც ფასის და სახელის ინფოს მოგვაწვდის), ფასდაკლება, მასა, კალორია100გრამზე, ProductStatus ცვლადი
 ფუნქციები: ფადაკლებული ფასის ჩვენება, ყიდვა, გამოითვალე კალორია მასაზე დაყრდნობით.*/


// ჩავთვალოთ რო ცალცალი პროდუქტი გვაქ ყიდვის შემთხვაში რო არარ იყიოს
// ჩავთვალოთ რო წონა ითვლება კილოგრამებში

enum FoodGroup {
    case fruit
    case vegetable
}
enum Status {
    case sale
    case available
}
 
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
    var ProductStatus: Status
    
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

var apple = Product(name: "Apple", category: .fruit, price: 4, discount: 25.0, mass: 0.2, calories100g: 50.0, ProductStatus: .available)

apple.info
apple.discountPrice()
apple.category
apple.ProductStatus
apple.countCalories()
apple.buy()
apple.buy()



// MARK: - task4
/*შექმენით მასივი პროდუქტებით სადაც მინიმუმ 15 პროდუქტი გექნებათ.*/
// MARK: - task5
/*მიღებული მასივისგან შექმენით ახალი მასივი სადაც მხოლოდ პროდუქტის name იქნება ჩამოწერილი */
// MARK: - task6
/*თავდაპირველი მასივის ელემენტები დაალაგეთ ფასის ზრდადობის მიხედვით. */
// MARK: - task7
/* რენდომ (1)კატეგორიის ყველა პროდუქტის სტატუსი შეცვალეთ ხელმისაწვდომიდან გაყიდულზე.*/
// MARK: - task8
/* გაიგეთ ყველა იმ პროდუქტის ერთეულის ჯამური ღირებულება რომელიც ხელმისაწვდომია.*/



// MARK: - BOUNS
// MARK: - task9
/* შექმენით ფუნქცია რომელიც მიიღებს პროდუქტების მასივს და დააბრუნებს dictionary-ს სადაც key იქნება კატეგორიის სახელწოდება და value იქნება იმ პროდუქტების მასივი რომლებიც შეესაბამება მოცემულ კატეგორიას.*/

