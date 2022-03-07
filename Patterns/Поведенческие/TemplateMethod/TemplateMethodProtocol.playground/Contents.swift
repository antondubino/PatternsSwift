//MARK: Шаблонный метод

// Позволяет определить алгоритм, который определяет скелет алгоритма в методе
// Если есть общая реализация, мы можем ее менять только в каждой из реализаций

protocol DriveVehicle {
    func startVehicle()
    func closeTheDoor()
    func haveASit()
    func useProtection()
    func lookAtTheMirror()
    func turnSignal()
    func driveForward()
}

// создаем расширение

extension DriveVehicle {
    
    func startVehicle() { // final позволит не переопределять этот метод
        haveASit()
        useProtection()
        lookAtTheMirror()
        turnSignal()
        driveForward()
    }
    
    func haveASit() {
        preconditionFailure("this method should be overriden") // когда у нас вызывается этот метод, будет ошибка
    }
    func closeTheDoor() {
        
    }
    func useProtection() {
        preconditionFailure("this method should be overriden")
    }
    func lookAtTheMirror() {
        preconditionFailure("this method should be overriden")
    }
    func turnSignal() {
        preconditionFailure("this method should be overriden")
    }
    func driveForward() {
        preconditionFailure("this method should be overriden")
    }
}

class Bicycle: DriveVehicle {
    
    func haveASit() {
        print("1) sit down on a bicycle seat")
    }
    func useProtection() {
        print("2) wear a hemlet")
    }
    func lookAtTheMirror() {
        print("3) look at the little mirror")
    }
    func turnSignal() {
        print("4) show left hand")
    }
    func driveForward() {
        print("5) pedal")
    }
}

class Car: DriveVehicle {
    
    func haveASit() {
        print("1) sit down on a car seat")
        closeTheDoor()
    }
    func closeTheDoor() {
        print("2) close the door")
    }
    func useProtection() {
        print("3) fasten seat belt")
    }
    func lookAtTheMirror() {
        print("4) look at the rearview mirror")
    }
    func turnSignal() {
        print("5) turn on left turn light")
    }
    func driveForward() {
        print("6) push pedal")
    }
}

let car = Car()
let bicycle = Bicycle()
print("car:")
car.startVehicle()
print("")
print("vehicle:")
bicycle.startVehicle()
