import Foundation

//MARK: Простая фабрика (фабрика)
// Не полноценный шаблон
// Вся инициализация объектов происходит в фабрике, то есть вся ответственность за создание объектов переносится на фабрику

enum CarType {
    
    case huge, fast
}

protocol Car {
    
    func drive()
}

class HugeCar: Car {
    
    func drive() {
        print("you drive huge car")
    }
}

class FastCar: Car {
    
    func drive() {
        print("you drive fast car")
    }
}

let hugeCar = HugeCar()
hugeCar.drive()

let fastCar = FastCar()
fastCar.drive()

// Строим фабрику, чтобы создание объектов полностью перекладывалось на неё

// если у нас что-то изменится, единственное место, где мы обязаны будем поменять реализацию, это фабрика

class CarFactory {
    // static func используется для того, чтобы мы не создавали экземпляр Factory, а сразу могли создавать объекты
    static func reduceCar(type: CarType) -> Car {
        var car: Car
        
        switch type {
            case .fast: car = FastCar()
            case .huge: car = HugeCar()
        }
        return car
    }
}

let hugeCar1 = CarFactory.reduceCar(type: .huge)
let fasstCar1 = CarFactory.reduceCar(type: .fast)
