import UIKit

var greeting = "Hello, playground"

class SuperEnemy {
    var name: String
    var hitPoints: Int
    
    init(name: String, hitPoints: Int) {
        self.name = name
        self.hitPoints = hitPoints
    }
}

protocol Superhero {
    var name: String {get}
    var alias: String {get}
    var isEvil: Bool {get}
    var superPowers: [String: Int] {get}
    
    func attack (on: SuperEnemy) -> Int
    func performSuperPower(on: SuperEnemy) -> Int
    
}

extension Superhero {
    func superheroInfo() {
        print("Superhero Info:")
        print("Name: \(name)")
        print("Alias: \(alias)")
        print("Evil? \(isEvil)")
        
        if superPowers.isEmpty {
            print("Superpowers: 0")
        } else {
            for (remained, lost) in superPowers {
                print("- \(remained): Damage \(lost)")
            }
        }
    }
    
    func remainingSuperpowers() {
        if superPowers.isEmpty {
            print("\(alias) has no superpowers.")
        } else {
            print("\(alias)'s remaining superpowers:")
            for (remained, lost) in superPowers {
                print("- \(remained): Damage \(lost)")
            }
        }
    }
}



struct SpiderMan: Superhero { // dont know why it gives me error
    var name: String
    var alias: String
    var isEvil: Bool
    var superPowers: [String: Int]
    
    func attack(on: SuperEnemy) -> Int {
        let lost = Int.random(in: 20...40)
        on.hitPoints -= lost
        return on.hitPoints
    }
    
    mutating func performSuperPower(on: SuperEnemy) -> Int {
            guard let (remained, lost) = superPowers.first else {
                return on.hitPoints
            }
            
            on.hitPoints -= lost
            _ = superPowers.removeValue(forKey: remained)
            return on.hitPoints
    }
}

class SuperheroSquad<T: Superhero> {
    var superheroes: [T]
    
    init(superheroes: [T]) {
        self.superheroes = superheroes
    }
    
    func listOfSuperheroes() {
        print("Superhero Squad:")
        for superhero in superheroes {
            print("- \(superhero.alias)")
        }
    }
}



func simulateShowdown(superheroSquad: SuperheroSquad<SpiderMan>, enemy: SuperEnemy) {
    print("Simulating Showdown")
    
    var enemyIsDefeated = false
}
