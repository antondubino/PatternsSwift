//MARK: Адаптер

// Создаем adaptee, класс под который мы адаптируемся

class SimpleCar {
    
    func sound() -> String {
        return "tr-tr-tr-tr"
    }
}

// target, объект, под который мы ориентируемся

protocol SuperCarProtocol {
    
    func makeNoise() -> String
}

class SuperCar: SuperCarProtocol {
    
    func makeNoise() -> String {
        return "wroom-wroom"
    }
}

// adaptor, принимает тот объект, который мы хотим адаптировать и адаптирует его под наш таргет, в частности, реализует метод makeNoise()

class SuperCarAdaptor: SuperCarProtocol {
    
    var simpleCar: SimpleCar
    
    init(simpleCar: SimpleCar) {
        self.simpleCar = simpleCar
    }
    func makeNoise() -> String {
        return simpleCar.sound()
    }
}

// мы используем адаптер, чтобы SimpleCar не подписываться под протокол, а использовать адаптер [можем использовать метод makeNoise()]

// когда мы подписываемся под dataSource и delegate -> мы пользуемся паттерном адаптер
