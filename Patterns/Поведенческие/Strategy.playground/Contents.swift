import UIKit

//MARK: Стратегия

// Паттерн позволяет избавиться от лишнего кода и не создавать множество подклассов

// 1) Создаем протоколы

protocol SwimBehavior {
    
    func swim()
}

class ProfessionalSwimmer: SwimBehavior {
    
    func swim() {
        print("professional swimming")
    }
}

// 2) Пишем под них классы

class NonSwimmer: SwimBehavior {
    
    func swim() {
        print("non swimming")
    }
}

protocol DiveBehavior {
    
    func dive()
}

class ProfessionalDiver: DiveBehavior {
    
    func dive() {
        print("professional diving")
    }
}

class NewbieDiver: DiveBehavior {
    
    func dive() {
        print("newbie diving")
    }
}

class NonDiver: DiveBehavior {
    
    func dive() {
        print("non diving")
    }
}

class Human {
    
    private var diveBehavior: DiveBehavior!
    private var swimBehavior: SwimBehavior!
    
    func performSwim() {
        swimBehavior.swim() // здесь мы добираемся до каждого метода swim(), который реализован в классах
    }
    
    func performDive() {
        diveBehavior.dive()
    }
    
    func setSwimBehavior(sb: SwimBehavior) {
        self.swimBehavior = sb
    }
    
    func setDiveBehavior(db: DiveBehavior) {
        self.diveBehavior = db
    }
    
    func run() {
        print("runninh")
    }
    
    init(swimBehavior: SwimBehavior, diveBehavior: DiveBehavior) {
        self.swimBehavior = swimBehavior
        self.diveBehavior = diveBehavior
    }
}

let human = Human(swimBehavior: ProfessionalSwimmer(), diveBehavior: ProfessionalDiver())
human.setSwimBehavior(sb: NonSwimmer())
human.performDive()
human.performSwim()

// Паттерн помогает динамически менять наши методы
