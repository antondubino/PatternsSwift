//MARK: Итератор

// Итератор - это такой элемент, который определяет, как перебирать вашу коллекцию, он нужен для предоставления стандартного интерфейса для перебора коллекций, причем эта коллекция находится в каком-то общем объекте и перебирая эту коллекцию, мы при помощи итератора не вникаем в то, как хранятся эти элементы и вообще во всю структуру этого объекта.

let array = [1, 2, 3, 4, 5]
var iterator = array.makeIterator()

while let item = iterator.next() {
    print(item)
}
print("")
for i in array {
    print(i)
}

class Driver {
    let isGoodDriver: Bool
    let name: String
    
    init(isGood: Bool, name: String) {
        self.isGoodDriver = isGood
        self.name = name
    }
}

class Car {
    
    var goodDriverIterator: GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
    var badDriverIterator: BadDriverIterator {
        return BadDriverIterator(drivers: drivers)
    }
    private let drivers = [Driver(isGood: true, name: "Mark"),
                           Driver(isGood: false, name: "Ivan"),
                           Driver(isGood: true, name: "Maria"),
                           Driver(isGood: false, name: "Morgan")]
}

extension Car: Sequence {
    
    func makeIterator() -> GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
    func makeBadIterator() -> BadDriverIterator {
        return BadDriverIterator(drivers: drivers)
    }
}

protocol BasicIterator: IteratorProtocol {
    
    init(drivers: [Driver])
    func allDrivers() -> [Driver]
}

class GoodDriverIterator: BasicIterator {
    
    private let drivers: [Driver]
    private var current = 0
    
    required init(drivers: [Driver]) {
        self.drivers = drivers.filter { $0.isGoodDriver }
    }
    
    func next() -> Driver? {
        // defer - это оператор, который выпoлняет свое действие в самом конце
        defer { current += 1 } // когда мы возвращаем след элемент, мы вернули, но мы хотим, чтобы этот след элемент стал текущим, раз мы вернули
        return drivers.count > current ? drivers[current] : nil
        }
    func allDrivers() -> [Driver] {
        return drivers
    }
}

class BadDriverIterator: BasicIterator {
    
    private let drivers: [Driver]
    private var current = 0
    
    required init(drivers: [Driver]) {
        self.drivers = drivers.filter { !$0.isGoodDriver }
    }
    
    func next() -> Driver? {
        defer { current += 1 }
        return drivers.count > current ? drivers[current] : nil
        }
    func allDrivers() -> [Driver] {
        return drivers
    }
}

let car = Car()
let goodDriverIterator = car.goodDriverIterator.next()
let goodDriverIteratorViaSequance = car.makeIterator().next()
let allgoodDriverIteratorViaSequance = car.makeIterator().allDrivers()

let badDriverIterator = car.badDriverIterator.next()
let badDriverIteratorViaSequance = car.makeBadIterator().next()
let allbadDriverIteratorViaSequance = car.makeBadIterator().allDrivers()
