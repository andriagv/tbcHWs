import Foundation


// MARK: - task1
/*შექმენით Genre ტიპის enum, რომელიც შეიცავს ფილმის ჟანრებს, მაგალითად: action, drama, comedy, thriller და სხვა. შექმენით ძირითადი კლასი Film, რომელსაც ექნება თვისებები:
 title - ფილმის სახელი,
 releaseYear— გამოშვების წელი,
 genre — ფილმის ჟანრი,

 revenue - შემოსავალი
 მეთოდი description(), რომელიც დაბეჭდავს ინფორმაციას ფილმზე. */


enum Genre {
    case action
    case drama
    case comedy
    case thriller
    case fantasy
}

final class Film {
    var title: String
    var releaseYear: UInt
    var genre: Genre
    var revenue: Double
    
    init(title: String, releaseYear: UInt, genre: Genre, revenue: Double) {
        self.title = title
        self.releaseYear = releaseYear
        self.genre = genre
        self.revenue = revenue
    }
    
    func description() {
        print("ფილმის სახელია \(title), რომელიც ეკუთვნის \(genre)ის ჟანრს, იგი გამოვიდა \(releaseYear) წელს და გამოიმუშავა \(revenue) ლარი ")
    }
//    static func removeFilm(from films: [Film], title: String) -> [Film] {
//        return films.reduce(into: [Film]()) { result, film in
//            if film.title != title {
//                result.append(film)
//            }
//        }
//    }
    
// MARK: - task3
/* Film კლასში შექმენით ფუნქცია removeFilm რომელიც პარამეტრად მიიღებს ფილმების მასივს და დასახელებას, ფუნქციამ უნდა წაშალოს მასივში თუ მოიძებნა მსგავსი დასახელების ფილმი.*/

    static func removeFilm(films: inout [Film], title: String) {
        films.removeAll { $0.title == title }
    }
}


// MARK: - task2
/*შექმენით კლასი Person, რომელსაც აქვს შემდეგი თვისებები:
 
 name — პიროვნების სახელი
 birthYear — დაბადების წელი.

 მეთოდი getAge რომელიც დაიანგარიშებს და დააბრუნებს ამ პიროვნების ასაკს მოცემულ წელს. */

class Person {
    var name: String
    var birthYear: UInt
    
    init(name: String, birthYear: UInt) {
        self.name = name
        self.birthYear = birthYear
    }
    
    func getAge() -> Int {
        Calendar.current.component(.year, from: Date()) - Int(birthYear)
    }
}



//ჩემი საყვარელი ფილმები (თავისუფალ დროს საყურებელი)
//var filmsArray: [Film] = [
//    Film(title: "მწვანე წიგნი", releaseYear: 2018, genre: .drama, revenue: 36900483),
//    Film(title: "ყველაფერი ხვალ იწყება", releaseYear: 2016, genre: .comedy, revenue: 2005632),
//    Film(title: "ველურ გარემოში", releaseYear: 2007, genre: .action, revenue: 56255142),
//    Film(title: "შუა ღამე პარიზში", releaseYear: 2011, genre: .comedy, revenue: 151119219),
//    Film(title: "იქ სადაც კიბორჩხალები მღერიან", releaseYear: 2022, genre: .drama, revenue: 1),
//    Film(title: "ღმერტის ქალაქი", releaseYear: 2002, genre: .thriller, revenue: 30641770),
//    Film(title: "საწყისი კოდი", releaseYear: 2011, genre: .thriller, revenue: 147332697),
//    Film(title: "მეფუტკრე", releaseYear: 2024, genre: .thriller, revenue: 1),
//]
//





// MARK: - task4
/*შექმენით კლასი Actor, რომელიც არიას Person კლასის მემკვიდრე კლასი
 
 Actor-ს უნდა ჰქონდეს actedFilms  მსახიობის მიერ ნათამაშები ფილმების სია და მეთოდი რომელიც მსახიობის მიერ ნათამაშებ ფილმებს დაამატებს სიაში.*/


final class Actor: Person {
    var actedFilms: [Film] = []
        
        func addFilm(_ film: Film) {
            actedFilms.append(film)
        }
}




// MARK: - task5
/*შექმენი Director კლასი, რომელიც ასევე Person-ის მემკვიდრეა და ექნება directedFilms რეჟისორის მიერ გადაღებული ფილმების სია და totalRevenue რეჟისორის ჯამური შემოსავალი.
 
 დაამატე მეთოდი რომელიც რეჟისორის მიერ გადაღებულ ფილმებს დაამატებს და დაითვლის თითოეული ფილმისთვის ჯამურ შემოსავალს.*/

final class Director: Person {
    var directedFilms: [Film] = []
    var totalRevenue: Double = 0.0
    
    func addFilm(film: Film) {
        directedFilms.append(film)
        totalRevenue += film.revenue
    }
}



// MARK: - task6
/*შექმენით 5 ფილმის ობიექტი და Dictionary, რომელშიც key იქნება მსახიობის სახელი, ხოლო მნიშვნელობებად მიიღებს იმ ფილმების სიას, რომლებშიც მონაწილეობს ეს მსახიობი. */

let film1 = Film(title: "მწვანე წიგნი", releaseYear: 2018, genre: .drama, revenue: 36900483)
let film2 = Film(title: "ყველაფერი ხვალ იწყება", releaseYear: 2016, genre: .comedy, revenue: 2005632)
let film3 = Film(title: "ველურ გარემოში", releaseYear: 2007, genre: .action, revenue: 56255142)
let film4 = Film(title: "შუა ღამე პარიზში", releaseYear: 2011, genre: .comedy, revenue: 151119219)
let film5 = Film(title: "იქ სადაც კიბორჩხალები მღერიან", releaseYear: 2022, genre: .drama, revenue: 1)

let actorFilms: [String: [Film]] = [
    "me": [film1, film2],
    "shen": [film3]
]
var filmsArray: [Film] = [film1, film2, film3, film4, film5]
// MARK: - task7
/* გამოიყენეთ map, იმისთვის რომ დაბეჭდოთ ყველა ფილმის სათაურების სია ამავე ფილმების მასივიდან */

print(filmsArray.map{ $0.title })


// MARK: - task8
/* reduce ფუნქციის გამოყენებით დაიანგარიშეთ ამ ყველა ფილმების გამოშვების საშუალო წელი.*/

(filmsArray.reduce(0){ $0 + $1.releaseYear }) / UInt(filmsArray.count)



// MARK: - BOUNS


// MARK: - task9
/* შექმენით კლასი SuperHero, რომელიც შეიცავს შემდეგ ველებს:
 name სუპერ გმირის სახელი
 superPower  სუპერ ძალა
 level - PowerLevel enum-ის ტიპის,
 და allies ამავე ტიპის მოკავშირეების ჩამონათვალი,
 დაამატეთ ინიციალიზაციის და დეინიციალიზაციის მეთოდები.*/

//enum PowerLevel {
//    case level
//    case allies
//}
//
//class SuperHero {
//    var name: String
//    var superPower:
//    var level: PowerLevel
//    var allies: PowerLevel
//    
//    init(name: String, superPower: <#type#>, level: PowerLevel, allies: PowerLevel) {
//        self.name = name
//        self.superPower = superPower
//        self.level = level
//        self.allies = allies
//    }
//    
//}

// MARK: - task10
/* შექმენით Enum PowerLevel, რომელიც მოიცავს შემდეგ დონეებს: weak, average, strong, super და დაამატეთ აღწერის მეთოდი რომელიც დააბრუნებს level-ს ტექსტური ფორმით.*/

// MARK: - task11
/* uniquePowers ყველა გმირისათვის და დააბრუნებს  უნიკალური ძალების სიას */

// MARK: - task12
/* მეთოდი addAlly დაამატებს მოკავშირეების სიას, შექმენით 2 SuperHero ობიექტი და გახადეთ ისინი მოკავშირეები.*/
