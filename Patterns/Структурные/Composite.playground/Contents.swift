//MARK: Компановщик

// позволяет создавать древовидные структуры

import CoreGraphics

protocol Coworker {
    
    func hire(coworker: Coworker)
    func getInfo()
    var lvl: Int { get }
}

class Manager: Coworker {
    
    private var coworkers = [Coworker]()
    var lvl: Int
    
    init(lvl: Int) {
        self.lvl = lvl
    }
    
    func hire(coworker: Coworker) {
        self.coworkers.append(coworker)
    }
    func getInfo() {
        print(self.lvl.description + " lvl manager")
        for c in coworkers {
            c.getInfo()
        }
    }
}

class LowManager: Coworker {
    
    var lvl: Int
    
    init(lvl: Int) {
        self.lvl = lvl
    }
    
    func hire(coworker: Coworker) {
        print("can't hire")
    }
    func getInfo() {
        print(self.lvl.description + " lvl manager")
    }
}

let topManager = Manager(lvl: 1)
let managerLvl2 = Manager(lvl: 2)
let managerLvl3_1 = Manager(lvl: 3)
let managerLvl3_2 = Manager(lvl: 3)
let managerLvl10 = LowManager(lvl: 10)
let managerLvl11 = LowManager(lvl: 11)

topManager.hire(coworker: managerLvl2)
managerLvl2.hire(coworker: managerLvl3_1)
managerLvl2.hire(coworker: managerLvl3_2)
managerLvl3_1.hire(coworker: managerLvl10)
managerLvl10.hire(coworker: managerLvl11)
topManager.getInfo()
