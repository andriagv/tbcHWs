

import Foundation


// MARK: - task1
/* შექმენით "Genre" ტიპის enum, რომელიც შეიცავს წიგნის ჟანრებს (მაგ: fiction, nonFiction, mystery, sciFi, biography). დაამატეთ computed property "description", რომელიც დააბრუნებს ჟანრის აღწერას.  */
enum Genre {
    case fiction
    case nonFiction
    case mystery
    case sciFi
    case biography
    
    var description: String {
        switch self {
        case .fiction:
            "ჟანრი, რომელიც დაფუძნებულია წარმოსახვაზე."
        case .nonFiction:
            "ჟანრი, რომელიც ფაქტებსა და რეალურ მოვლენებზეა დაფუძნებული."
        case .mystery:
            "ჟანრი, რომელიც ორიენტირებულია დანაშაულის ან საიდუმლოების ამოხსნაზე."
        case .sciFi:
            "ჟანრი, რომელიც ეხება ფუტურისტულ ცნებებს, როგორიცაა მოწინავე მეცნიერება და ტექნოლოგია."
        case .biography:
            "ჟანრი რომელიც, დეტალურად აღწერს ვინმეს ცხოვრების."
        }
    }
}

// MARK: - task2
/* შექმენით enum "ReadingLevel" მნიშვნელობებით: beginner, intermediate, advanced. შემდეგ შექმენით პროტოკოლი "Readable" შემდეგი მოთხოვნებით:
 
 - "title: String" ფროფერთი

 - "author: String" ფროფერთი

 - "publicationYear: Int" ფროფერთი

 - "readingLevel: ReadingLevel" ფროფერთი

 - "read()" მეთოდი, რომელიც დაბეჭდავს ინფორმაციას წიგნის წაკითხვის შესახებ, მაგ: "გილოცავთ თქვენ ერთ კლიკში წაიკითხეთ წიგნი" ან რამე სხვა, მიეცით ფანტაზიას გასაქანი 🤘 */

enum ReadingLevel {
    case beginner
    case intermediate
    case advanced
}
protocol Readable {
    var title: String { get set }
    var author: String { get set }
    var publicationYear: Int { get set }
    var readingLevel: ReadingLevel { get set }
    
    func read()
}

extension Readable {
    func read() {
        print("გილოცავთ! თქვენ ჩაერთეთ აქციაში \"მიიღე განათლება ერთი კლიკის სიღრმეზე\" და თქვენ ერთი ამოსუნთქვით წაიკითხეთ \(title) ავტორი: \(author), გამოქვეყნების წელი: \(publicationYear).")
    }
}


// MARK: - task3
/* შექმენით სტრუქტურა "Book", რომელიც დააკმაყოფილებს "Readable" პროტოკოლს. დაამატეთ "genre: Genre" ფროფერთი და "description()" მეთოდი, რომელიც დაბეჭდავს სრულ ინფორმაციას წიგნზე. */

struct Book: Readable {
    var title: String
    var author: String
    var publicationYear: Int
    var readingLevel: ReadingLevel
    var genre: Genre
    
    func description() {
        print(" სათაური: \(title), ავტორი: \(author), გამოქვეყნების წელი: \(publicationYear), ჟანრი: \(genre.description),კითვის დონე: \(readingLevel)")
    }
}


// MARK: - task4
/* შექმენით "Library" კლასი შემდეგი ფროფერთებით:
 
 - "name: String" - ბიბლიოთეკის სახელი

 - "books: [Book]" - წიგნების მასივი

 დაამატეთ მეთოდები:

 - "add(book: Book)" - წიგნის დამატება

 - "removeBookWith(title: String)" - წიგნის წაშლა სათაურის მიხედვით

 - "listBooks()" - ყველა წიგნის ჩამონათვალის დაბეჭდვა


  გააფართოეთ “Library” კლასი “filterBooks” მეთოდით რომელიც არგუმენტად მიიღებს ქლოჟერს და დააბრუნებს ამ ქლოჟერის გამოყენებით გაფილტრულ წიგნთა მასივს. */




class Library {
    var name: String
    var books: [Book] = []
    
    init(name: String) {
        self.name = name
    }
    
    func add(book: Book) {
        books.append(book)
    }
    
    func removeBookWith(title: String) {
        books.removeAll { $0.title == title }
    }
    
    func listBooks() {
        books.forEach{ $0.description() }
    }
}

extension Library {
    func filterBooks(using filter: (Book) -> Bool) -> [Book] {
        books.filter(filter)
    }
}


// MARK: - task5
/* შექმენით generic ფუნქცია groupBooksByLevel<T: Readable>(_ books: [T]) -> [ReadingLevel: [T]], რომელიც დააჯგუფებს წიგნებს კითხვის დონის მიხედვით. გამოიყენეთ ეს ფუნქცია ბიბლიოთეკის წიგნებზე და დაბეჭდეთ შედეგი.
 
 */

func groupBooksByLevel<T: Readable>(_ books: [T]) -> [ReadingLevel: [T]] {
    return books.reduce(into: [ReadingLevel: [T]]()) { result, book in
        result[book.readingLevel, default: []].append(book)
    }
}


// MARK: - task6
/* შექმენით "LibraryMember" კლასი შემდეგი ფროფერთებით:
 
 - "id: Int"

 - "name: String"

 - "borrowedBooks: [Book]"



 დაამატეთ მეთოდები:

 - "borrowBook(_ book: Book, from library: Library)" - წიგნის გამოწერა ბიბლიოთეკიდან

 - "returnBook(_ book: Book, to library: Library)" - წიგნის დაბრუნება ბიბლიოთეკაში  */

class LibraryMember {
    var id: Int
    var name: String
    var borrowedBooks: [Book]
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
        self.borrowedBooks = []
    }
    
    func borrowBook(_ book: Book, from library: Library) {
        if let index = library.books.firstIndex(where: { $0.title == book.title }) {
            borrowedBooks.append(library.books.remove(at: index))
            print("\(name)-მ აიღო \(book.title).")
        } else {
            print("\(book.title) ეს წიგნი აღარ არი ხელმისაწვდომი.")
        }
    }
    
    func returnBook(_ book: Book, to library: Library) {
        if let index = borrowedBooks.firstIndex(where: { $0.title == book.title }) {
            library.books.append(borrowedBooks.remove(at: index))
            print("\(name)-მ დააბრუნა \(book.title) .")
        } else {
            print("\(name)-მ დააბრუნა \(book.title) .")
        }
    }
}


// MARK: - task7
/* შექმენით მინიმუმ 5 "Book" ობიექტი და 1 "Library" ობიექტი. დაამატეთ წიგნები ბიბლიოთეკაში "add(book:)" მეთოდის გამოყენებით. შემდეგ:
 
 - გამოიყენეთ "listBooks()" მეთოდი ყველა წიგნის ჩამოსათვლელად

 - წაშალეთ ერთი წიგნი "removeBookWith(title:)" მეთოდის გამოყენებით

 - გამოიყენეთ "filterBooks" მეთოდი და დაბეჭდეთ მხოლოდ ის წიგნები, რომლებიც გამოცემულია 2000 წლის შემდეგ  */

let book1 = Book(
    title: "ვეფხისტყაოსანი",
    author: "შოთა რუსთაველი",
    publicationYear: 1712,
    readingLevel: .advanced,
    genre: .fiction
)
let book2 = Book(
    title: "დათა თუთაშხია",
    author: "ჭაბუა ამირეჯიბი",
    publicationYear: 1972,
    readingLevel: .advanced,
    genre: .fiction
)
let book3 = Book(
    title: "ნუ გეშინია დედა!",
    author: "ნოდარ დუმბაძე",
    publicationYear: 1971,
    readingLevel: .beginner,
    genre: .fiction
)
let book4 = Book(
    title: "ბაში-აჩუკი",
    author: "აკაკი წერეთელი",
    publicationYear: 1895,
    readingLevel: .intermediate,
    genre: .fiction
)
let book5 = Book(
    title: "კაცია-ადამიანი?!",
    author: "ილია ჭავჭავაძე",
    publicationYear: 1863,
    readingLevel: .advanced,
    genre: .fiction
)

let library = Library(name: "თბილისის ეროვნული ბიბლიოთეკა")

library.add(book: book1)
library.add(book: book2)
library.add(book: book3)
library.add(book: book4)
library.add(book: book5)

library.listBooks()

library.removeBookWith(title: "ნუ გეშინია დედა!")

library.filterBooks { $0.publicationYear > 2000 }
    .forEach { $0.description() }

// MARK: - task8
/* შექმენით მინიმუმ 2 "LibraryMember" ობიექტი. თითოეული წევრისთვის:
 
 - გამოიწერეთ 2 წიგნი "borrowBook(_:from:)" მეთოდის გამოყენებით

 - დააბრუნეთ 1 წიგნი "returnBook(_:to:)" მეთოდის გამოყენებით

 დაბეჭდეთ თითოეული წევრის გამოწერილი წიგნების სია  */


let member1 = LibraryMember(id: 1, name: "Andria")
let member2 = LibraryMember(id: 2, name: "Nana")

member1.borrowBook(book1, from: library)
member1.borrowBook(book3, from: library)

member2.borrowBook(book2, from: library)
member2.borrowBook(book4, from: library)


member1.returnBook(book1, to: library)
member2.returnBook(book2, to: library)


member1.borrowedBooks.forEach { $0.description() }
member2.borrowedBooks.forEach { $0.description() }

// MARK: - BOUNS

// MARK: - task9
/* გააფართოვეთ "Array" ტიპი, სადაც ელემენტი აკმაყოფილებს "Readable" პროტოკოლს (ანუ ამ ექსთენშენი მოცემული მეთოდები ხელმსიაწვდომი იქნება მხოლოდ [Readable] მასივისთვის), შემდეგი მეთოდებით:
 
 - "findByAuthor(_ author: String) -> [Readable]" - აბრუნებს ავტორის მიხედვით ნაპოვნ წიგნებს

 - "oldestBook() -> Readable?" - აბრუნებს ყველაზე ძველ წიგნს */

extension Array where Element: Readable {
    
    func findByAuthor(_ author: String) -> [Readable] {
        self.filter{ $0.author == author }
    }
    
    func oldestBook() -> Readable? {
        self.min { $0.publicationYear < $1.publicationYear }
    }
}

// MARK: - task10
/* შექმენით "EBook" სტრუქტურა, რომელიც დააკმაყოფილებს "Readable" პროტოკოლს და დაამატეთ "fileSize: Double" ფროფერთი.
 
   გამოიყენეთ "extension", რომ დაამატოთ "printDetails()" მეთოდი, რომელიც დაბეჭდავს ელექტრონული წიგნის დეტალებს.

   შექმენით მინიმუმ 2 "EBook" ობიექტი და გამოიძახეთ "printDetails()" მეთოდი თითოეულისთვის. */

struct EBook: Readable {
    var fileSize: Double
    var title: String
    var author: String
    var publicationYear: Int
    var readingLevel: ReadingLevel
    
    init(fileSize: Double, title: String, author: String, publicationYear: Int, readingLevel: ReadingLevel) {
        self.fileSize = fileSize
        self.title = title
        self.author = author
        self.publicationYear = publicationYear
        self.readingLevel = readingLevel
    }
}

extension EBook {
    func printDetails() {
        print("title: \(title), author: \(author), publicationYear: \(publicationYear)")
    }
}
let EBook1 = EBook(fileSize: 2, title: "გენიოსი სახელად ანდრია", author: "self", publicationYear: 2001, readingLevel: .advanced)
let EBook2 = EBook(fileSize: 1, title: "ჰაუ თუ მეიქ მისთეიქ", author: "self.lead", publicationYear: 1959, readingLevel: .beginner)

EBook1.printDetails()
EBook2.printDetails()

// MARK: - task11
/* შექმენით ჯენერიკ ფუნქცია "findMostFrequent<T: Hashable>(_ array: [T]) -> T?", რომელიც იპოვის და დააბრუნებს მასივში ყველაზე ხშირად გამეორებულ ელემენტს. თუ რამდენიმე ელემენტი თანაბრად ხშირად მეორდება, დააბრუნეთ პირველი მათგანი. */

//FIXME: - idk
//func findMostFrequent<T: Hashable>(_ array: [T]) -> T? {
//    array.reduce(into: [Int: [T]]()){result, element in
//        result[element,]
//    }
//}



// MARK: - task12
/* შექმენით მასივი, რომელიც შეიცავს ყველა წიგნის ავტორს მე-7 დავალებაში შექმნილი ბიბლიოთეკიდან.
 
 გამოიძახეთ "findMostFrequent" ფუნქცია ამ მასივზე, რათა იპოვოთ ყველაზე პოპულარული ავტორი.
 დაბეჭდეთ შედეგი: "ბიბლიოთეკაში ყველაზე პოპულარული ავტორი არის: [ავტორის სახელი]". */

let autorsArray = library.books.map{ $0.author }

findMostFrequent(autorsArray)


