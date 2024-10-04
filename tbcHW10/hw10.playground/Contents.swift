import Foundation


// MARK: - task1
/* შექმენით CreatureType enum-ი სხვადასხვა ტიპის არსებებით (მაგ: fire, water, earth, air, electric …). გამოიყენეთ associated value, რომ თითოეულ ტიპს ჰქონდეს rarity: Double მნიშვნელობა 0-დან 1-მდე. დაამატეთ computed property description, რომელიც დააბრუნებს არსების ტიპის აღწერას.   */


// MARK: - task2
/* შექმენით პროტოკოლი CreatureStats შემდეგი მოთხოვნებით:
 * var health: Double
 * var attack: Double
 * var defense: Double
 * func updateStats(health: Double, attack: Double, defense: Double) მეთოდი, რომელიც განაახლებს ამ მონაცემებს (შეგიძლიათ ფუნქციის პარამეტრები სურვილისამებრ შეცვალოთ, მაგ: დეფოლტ მნიშვნელობები გაუწეროთ 😌)  */


// MARK: - task3
/* შექმენით კლასი Trainer შემდეგი ფროფერთებით:
 * public let name: String
 * private var creatures: [DigitalCreature]
 * დაამატეთ public მეთოდი add(creature: DigitalCreature) რომლითაც შეძლებთ ახალი არსების დამატებას მასივში, ასევე არსებას საკუთარ თავს (self) დაუსეტავს ტრენერად. */


// MARK: - task4
/* შექმენით კლასი DigitalCreature, რომელიც დააკმაყოფილებს CreatureStats პროტოკოლს. დაამატეთ:
 * public let name: String
 * public let type: CreatureType
 * public var level: Int
 * public var experience: Double
 * weak public var trainer: Trainer?
 * დაამატეთ deinit მეთოდი, რომელიც დაბეჭდავს შეტყობინებას არსების წაშლისას.  */

// MARK: - task5
/*  შექმენით CreatureManager კლასი შემდეგი ფუნქციონალით:
 * private var creatures: [DigitalCreature] - არსებების მასივი
 * public func adoptCreature(_ creature: DigitalCreature) - არსების დამატება
 * public func trainCreature(named name: String) - კონკრეტული არსების წვრთნა (გაითვალისწინეთ რომ წვრთნა მოხდება მხოლოდ მაშინ თუ არჩეულ არსებას ყავს მწვრთნელი!)
 * public func listCreatures() -> [DigitalCreature] - ყველა არსების სიის დაბრუნება  გააფართოვეთ CreatureManage კლასი მეთოდით func trainAllCreatures(), რომელიც გაწვრთნის ყველა არსებას.  */

// MARK: - task6
/* შექმენით CreatureShop კლასი მეთოდით purchaseRandomCreature() -> DigitalCreature. ეს მეთოდი დააბრუნებს რანდომიზირებულად დაგენერირებულ არსებას.   */

// MARK: - task7
/* შექმენით გლობალური ფუნქცია updateLeaderboard(players: [PlayerProfile]) -> [PlayerProfile], რომელიც დაალაგებს მოთამაშეებს მათი არსებების ჯამური ძალის მიხედვით.  
  */

// MARK: - task8
/*  გამოვიყენოთ წინა ტასკებში შექმნილი ყველა ფუნქციონალი:
 * შექმენით რამდენიმე Trainer ობიექტი
 * შექმენით რამდენიმე CreatureManager ობიექტი
 * შექმენით ერთი ან ორი CreatureShop
 * თითოეული მენეჯერისთვის:
     * შეიძინეთ რამდენიმე შემთხვევითი არსება CreatureShop-იდან
     * მიაბარეთ რამდენიმე არსება რომელიმე ტრენერს.
     * სცადეთ არსებების წვრთნა CreatureManager-ის trainCreature(named:) მეთოდით
 * გამოიყენეთ CreatureManager-ის trainAllCreatures() მეთოდი ყველა მოთამაშის არსებების საწვრთნელად (თუ ყავს მწვრთნელი, რა თქმა უნდა)
 * განაახლეთ ლიდერბორდი updateLeaderboard() ფუნქციის გამოყენებით
 * დაბეჭდეთ თითოეული მოთამაშის არსებების სია და მათი სტატისტიკა
 * წაშალეთ ერთი არსება რომელიმე Trainer-იდან და აჩვენეთ, რომ weak reference მუშაობს სწორად (დაბეჭდეთ არსების trainer property-ს მნიშვნელობა წაშლამდე და წაშლის შემდეგ)
 * დააკვირდით deinit მეთოდის გამოძახებას არსების წაშლისას  */


// MARK: - BOUNS

// MARK: - task9
/* შექმენით BattleSimulator კლასი, რომელიც მართავს ორ DigitalCreature-ს შორის ბრძოლას.
 * გამოიყენეთ weak/unowned მიმთითებლები სათანადოდ, რათა თავიდან აიცილოთ ე.წ memory leak.
 * დაამატეთ მეთოდი simulateBattle(between creature1: DigitalCreature, and creature2: DigitalCreature) -> DigitalCreature, რომელიც დააბრუნებს გამარჯვებულს. მეთოდის ლოგიკას როგორს გააკეთებთ თქვენს ფანტაზიაზეა დამოკიდებული 🙌
 * გამართეთ რამდენიმე ბრძოლა და დაბეჭდეთ შედეგები. 🤺 */

