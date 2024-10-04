import Foundation


// MARK: - task1
/* შექმენით CreatureType enum-ი სხვადასხვა ტიპის არსებებით (მაგ: fire, water, earth, air, electric …). გამოიყენეთ associated value, რომ თითოეულ ტიპს ჰქონდეს rarity: Double მნიშვნელობა 0-დან 1-მდე. დაამატეთ computed property description, რომელიც დააბრუნებს არსების ტიპის აღწერას.   */

enum CreatureType {
    case fire(rarity: Double)
    case water(rarity: Double)
    case earth(rarity: Double)
    case air(rarity: Double)
    case electric(rarity: Double)
    
    var description: String {
        switch self {
        case .fire(let rarity):
            return "ცეცხლი \(rarity)."
        case .water(let rarity):
            return "წყალი \(rarity)."
        case .earth(let rarity):
            return "მიწა \(rarity)."
        case .air(let rarity):
            return "ჰაერი \(rarity)."
        case .electric(let rarity):
            return "ავატარს დენის ძალა არააქ სამწუხაროდ \(rarity)."
        }
    }
}



// MARK: - task2
/* შექმენით პროტოკოლი CreatureStats შემდეგი მოთხოვნებით:
 * var health: Double
 * var attack: Double
 * var defense: Double
 * func updateStats(health: Double, attack: Double, defense: Double) მეთოდი, რომელიც განაახლებს ამ მონაცემებს (შეგიძლიათ ფუნქციის პარამეტრები სურვილისამებრ შეცვალოთ, მაგ: დეფოლტ მნიშვნელობები გაუწეროთ 😌)  */

protocol CreatureStats {
    var health: Double { get set}
    var attack: Double { get set}
    var defense: Double { get set}
    
    mutating func updateStats(health: Double, attack: Double, defense: Double)
}

extension CreatureStats {
    mutating func updateStats(health: Double = 100.0, attack: Double = 100.0, defense: Double = 100.0) {
        self.health = health
        self.attack = attack
        self.defense = defense
    }
}


// MARK: - task3
/* შექმენით კლასი Trainer შემდეგი ფროფერთებით:
 * public let name: String
 * private var creatures: [DigitalCreature]
 * დაამატეთ public მეთოდი add(creature: DigitalCreature) რომლითაც შეძლებთ ახალი არსების დამატებას მასივში, ასევე არსებას საკუთარ თავს (self) დაუსეტავს ტრენერად. */

class Trainer {
    public let name: String
    private var creatures: [DigitalCreature]

    init(name: String, creatures: [DigitalCreature]) {
        self.name = name
        self.creatures = creatures
    }
    
    init(name: String) {
        self.name = name
        self.creatures = []
    }

    public func add(creature: DigitalCreature) {
        creatures.append(creature)
        creature.trainer = self
    }
}

// MARK: - task4
/* შექმენით კლასი DigitalCreature, რომელიც დააკმაყოფილებს CreatureStats პროტოკოლს. დაამატეთ:
 * public let name: String
 * public let type: CreatureType
 * public var level: Int
 * public var experience: Double
 * weak public var trainer: Trainer?
 * დაამატეთ deinit მეთოდი, რომელიც დაბეჭდავს შეტყობინებას არსების წაშლისას.  */

class DigitalCreature: CreatureStats {
    public let name: String
    public let type: CreatureType
    public var level: Int
    public var experience: Double
    weak public var trainer: Trainer?
    
    var health: Double
    var attack: Double
    var defense: Double
    
    init(name: String, type: CreatureType, level: Int, experience: Double, health: Double, attack: Double, defense: Double) {
        self.name = name
        self.type = type
        self.level = level
        self.experience = experience
        self.health = health
        self.attack = attack
        self.defense = defense
    }
    
    deinit {
        print(" არსება წაიშალა ")
    }
}


// MARK: - task5
/*  შექმენით CreatureManager კლასი შემდეგი ფუნქციონალით:
 * private var creatures: [DigitalCreature] - არსებების მასივი
 * public func adoptCreature(_ creature: DigitalCreature) - არსების დამატება
 * public func trainCreature(named name: String) - კონკრეტული არსების წვრთნა (გაითვალისწინეთ რომ წვრთნა მოხდება მხოლოდ მაშინ თუ არჩეულ არსებას ყავს მწვრთნელი!)
 * public func listCreatures() -> [DigitalCreature] - ყველა არსების სიის დაბრუნება  გააფართოვეთ CreatureManage კლასი მეთოდით func trainAllCreatures(), რომელიც გაწვრთნის ყველა არსებას.  */

class CreatureManager {
    private var creatures: [DigitalCreature]
    
    init(creatures: [DigitalCreature]) {
        self.creatures = []
    }
    
    public func adoptCreature(_ creature: DigitalCreature) {
        creatures.append(creature)
    }
    
    public func trainCreature(named name: String) {
        if creatures.contains(where: { $0.name == name }) {
            creatures.reduce(into: ()) { (result, creature) in
                if creature.name == name {
                    if creature.trainer != nil {
                        creature.level += 1
                        creature.experience += 1
                        print("გიცოცავ, გაიწვრთვნა: \(creature.name) მისი ამჟამინდელი მონაცემები: Level: \(creature.level), Experience: \(creature.experience)")
                    } else {
                        print("\(creature.name)-ს არ ყავს ტრენერი და ვერ გაიწვრთნება")
                    }
                    print("\n")
                }
            }
        } else {
            print("\(name): ასეთი არსება ვერ მოიძებნა.")
        }
    }
    
    public func listCreatures() -> [DigitalCreature] {
        creatures
    }
}

extension CreatureManager {
    public func trainAllCreatures() {
        for creature in creatures {
            if creature.trainer != nil {
                creature.level += 1
                creature.experience += 1
            } else {
                continue
            }
        }
    }
}



// MARK: - task6
/* შექმენით CreatureShop კლასი მეთოდით purchaseRandomCreature() -> DigitalCreature. ეს მეთოდი დააბრუნებს რანდომიზირებულად დაგენერირებულ არსებას.   */

class CreatureShop {
    private func generateRandomName() -> String {
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
        let nameLength = Int.random(in: 2...10)
        var randomName = ""
        
        while randomName.count < nameLength {
            randomName.append(alphabet.randomElement() ?? "a")
        }
        
        return randomName
    }

    public func purchaseRandomCreature() -> DigitalCreature {
        let Name = generateRandomName()
        let creatureTypes: [CreatureType] = [
            .fire(rarity: Double.random(in: 0...1)),
            .water(rarity: Double.random(in: 0...1)),
            .earth(rarity: Double.random(in: 0...1)),
            .air(rarity: Double.random(in: 0...1)),
            .electric(rarity: Double.random(in: 0...1))
        ]
        let Type = creatureTypes.randomElement()!
        let Level = Int.random(in: 1...100)
        let Experience = Double.random(in: 1...100)
        let Health = Double.random(in: 1...100)
        let Attack = Double.random(in: 1...100)
        let Defense = Double.random(in: 1...100)
        
        return DigitalCreature(name: Name, type: Type, level: Level, experience: Experience, health: Health, attack: Attack, defense: Defense)
    }
}


// MARK: - task7
/*
შექმენით გლობალური ფუნქცია updateLeaderboard(players: [CreatureManager]) -> [CreatureManager], რომელიც დაალაგებს მოთამაშეებს მათი არსებების ჯამური ძალის მიხედვით.  
 */

func updateLeaderboard(players: [CreatureManager]) -> [CreatureManager] {
    func totalPower(of manager: CreatureManager) -> Double {
        manager.listCreatures().reduce(0) { $0 + $1.attack + $1.defense + $1.health }
    }
    
    return players.sorted { totalPower(of: $0) > totalPower(of: $1) }
}



// MARK: - task8
// გამოვიყენოთ წინა ტასკებში შექმნილი ყველა ფუნქციონალი:
// 1* შექმენით რამდენიმე Trainer ობიექტი
// 2* შექმენით რამდენიმე CreatureManager ობიექტი
// 3* შექმენით ერთი ან ორი CreatureShop
// 4* თითოეული მენეჯერისთვის:
//     41* შეიძინეთ რამდენიმე შემთხვევითი არსება CreatureShop-იდან
//     42* მიაბარეთ რამდენიმე არსება რომელიმე ტრენერს.
//     43* სცადეთ არსებების წვრთნა CreatureManager-ის trainCreature(named:) მეთოდით
// 5* გამოიყენეთ CreatureManager-ის trainAllCreatures() მეთოდი ყველა მოთამაშის არსებების საწვრთნელად (თუ ყავს მწვრთნელი, რა თქმა უნდა)
// 6* განაახლეთ ლიდერბორდი updateLeaderboard() ფუნქციის გამოყენებით
// 7* დაბეჭდეთ თითოეული მოთამაშის არსებების სია და მათი სტატისტიკა
// 8* წაშალეთ ერთი არსება რომელიმე Trainer-იდან და აჩვენეთ, რომ weak reference მუშაობს სწორად (დაბეჭდეთ არსების trainer property-ს მნიშვნელობა წაშლამდე და წაშლის შემდეგ)
// 9* დააკვირდით deinit მეთოდის გამოძახებას არსების წაშლისას 

// 1შექმენით რამდენიმე Trainer ობიექტი
var trainer1: Trainer? = Trainer(name: "trainer1")
var trainer2: Trainer? = Trainer(name: "trainer2")

// 2შექმენით რამდენიმე CreatureManager ობიექტი
var manager1 = CreatureManager(creatures: [])
var manager2 = CreatureManager(creatures: [])

// 3შექმენით ერთი ან ორი CreatureShop
var shop1 = CreatureShop()
var shop2 = CreatureShop()

// 41შეიძინეთ რამდენიმე შემთხვევითი არსება CreatureShop-იდან
var creature1 = shop1.purchaseRandomCreature()
var creature2 = shop1.purchaseRandomCreature()
var creature3 = shop2.purchaseRandomCreature()
var creature4 = shop2.purchaseRandomCreature()
var creature5 = shop2.purchaseRandomCreature()

// მენეჯერებისთვის არსებების მიბმა
manager1.adoptCreature(creature1)
manager1.adoptCreature(creature2)
manager2.adoptCreature(creature3)
manager2.adoptCreature(creature4)
manager2.adoptCreature(creature5)


//42 მიაბარეთ რამდენიმე არსება რომელიმე ტრენერს
trainer1?.add(creature: creature1)
trainer2?.add(creature: creature3)
trainer2?.add(creature: creature5)

// 43 სცადეთ არსებების წვრთნა CreatureManager-ის trainCreature(named:) მეთოდით
manager1.trainCreature(named: creature1.name)
manager1.trainCreature(named: creature2.name)
manager2.trainCreature(named: creature3.name)
manager2.trainCreature(named: creature4.name)
manager2.trainCreature(named: creature5.name)

// 5 გამოიყენეთ CreatureManager-ის trainAllCreatures() მეთოდი ყველა მოთამაშის არსებების საწვრთნელად
manager1.trainAllCreatures()
manager2.trainAllCreatures()

// 6 განაახლეთ ლიდერბორდი updateLeaderboard() ფუნქციის გამოყენებით
let leaderboard = updateLeaderboard(players: [manager1, manager2])

// 7 დაბეჭდეთ თითოეული მოთამაშის არსებების სია და მათი სტატისტიკა
print("\n")
print("Leaderboard: \n")
for (index, manager) in leaderboard.enumerated() {
    print("Player \(index + 1): \(manager.listCreatures().count) creatures \n")
    manager.listCreatures().forEach { creature in
        print("\(creature.name) - Type: \(creature.type.description), Level: \(creature.level), Stats: (Health: \(creature.health), Attack: \(creature.attack), Defense: \(creature.defense)) ")
    }
    print("\n")
}


// 8 წაშალეთ ერთი არსება რომელიმე Trainer-იდან და აჩვენეთ, რომ weak reference მუშაობს სწორად (დაბეჭდეთ არსების trainer property-ს მნიშვნელობა წაშლამდე და წაშლის შემდეგ)

print("\(String(describing: creature1.trainer?.name))")

trainer1 = nil
trainer2 = nil


print("\(String(describing: creature1.trainer?.name))")

// 9 deinit მეთოდის გამოძახება არსებების წაშლისას
manager1.adoptCreature(creature1)  // This will trigger deinit when the creature is removed


// MARK: - BOUNS

// MARK: - task9
/* შექმენით BattleSimulator კლასი, რომელიც მართავს ორ DigitalCreature-ს შორის ბრძოლას.
 * გამოიყენეთ weak/unowned მიმთითებლები სათანადოდ, რათა თავიდან აიცილოთ ე.წ memory leak.
 * დაამატეთ მეთოდი simulateBattle(between creature1: DigitalCreature, and creature2: DigitalCreature) -> DigitalCreature, რომელიც დააბრუნებს გამარჯვებულს. მეთოდის ლოგიკას როგორს გააკეთებთ თქვენს ფანტაზიაზეა დამოკიდებული 🙌
 * გამართეთ რამდენიმე ბრძოლა და დაბეჭდეთ შედეგები. 🤺 */

class BattleSimulator {
    weak var creature1: DigitalCreature?
    weak var creature2: DigitalCreature?
    
    init(creature1: DigitalCreature? = nil, creature2: DigitalCreature? = nil) {
        self.creature1 = creature1
        self.creature2 = creature2
    }
    
    deinit {
        print("BattleSimulator deinited")
    }
    
    func simulateBattle(between creature1: DigitalCreature, and creature2: DigitalCreature) -> DigitalCreature {
        
        while creature1.health > 0 && creature2.health > 0 {
            
            if creature1.attack > creature2.defense {
                creature2.health -= creature1.attack - creature2.defense
            } else {
                continue
            }
            
            if creature2.attack > creature1.defense {
                creature1.health -= creature2.attack - creature1.defense
            } else {
                continue
            }
        }
        return creature1.health > 0 ? creature1 : creature2
    }
}



let creature11 = shop1.purchaseRandomCreature()
let creature22 = shop2.purchaseRandomCreature()
print(BattleSimulator().simulateBattle(between: creature11, and: creature22))






