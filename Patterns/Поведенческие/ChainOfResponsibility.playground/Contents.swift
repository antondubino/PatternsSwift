//MARK: Цепочка обязанностей

// Создается цепочка объектов, следовательно анализирующих поступающих в них запрос
// есть несколько объектов, они между собой схожи (структурно) и этот объект, который поступает, он идет по цепочке. И пока этот объект не будет обработан в каком-то из звеньев этой цепочки, он будет продолжать передаваться этим звеньям.

class Enemy {
    
    let strenght = 600
}

protocol MilitaryChain { // что мы должны реализовать, чтобы быть в цепочке
    
    var strenght: Int { get }
    var nextRank: MilitaryChain? { get set } // обращение к след звену
    
    func shouldDefeatWithStrenght(amount: Int)
}

class Soldier: MilitaryChain {
    
    var strenght = 100
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrenght(amount: Int) {
        if amount < strenght {
            print("soldier got it")
        } else {
            nextRank?.shouldDefeatWithStrenght(amount: amount)
        }
    }
}

class Officer: MilitaryChain {
    
    var strenght = 500
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrenght(amount: Int) {
        if amount < strenght {
            print("officer got it")
        } else {
            nextRank?.shouldDefeatWithStrenght(amount: amount)
        }
    }
}

class General: MilitaryChain {
    
    var strenght = 1000
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrenght(amount: Int) {
        if amount < strenght {
            print("general got it")
        } else {
            print("we can't defeat this enemy")
        }
    }
}

let enemy = Enemy()
let soldier = Soldier()
let officer = Officer()
let general = General()

soldier.nextRank = officer
officer.nextRank = general

soldier.shouldDefeatWithStrenght(amount: enemy.strenght)
