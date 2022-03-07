//MARK: Шаблонный метод

// Позволяет определить алгоритм, который определяет скелет алгоритма в методе
// Если есть общая реализация, мы можем ее менять только в каждой из реализаций

// создаем абстрактный класс
class DriveVehicle {
    
    final func startVehicle() { // final позволит не переопределять этот метод
        haveASit()
        useProtection()
        lookAtTheMirror()
        turnSignal()
        driveForward()
    }
    
    func haveASit() {
        preconditionFailure("this method should be overriden") // когда у нас вызывается этот метод, будет ошибка
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
    
    override func haveASit() {
        print("1) sit down on a bicycle seat")
    }
    override func useProtection() {
        print("2) wear a hemlet")
    }
    override func lookAtTheMirror() {
        print("3) look at the little mirror")
    }
    override func turnSignal() {
        print("4) show left hand")
    }
    override func driveForward() {
        print("5) pedal")
    }
}

class Car: DriveVehicle {
    
    override func haveASit() {
        print("1) sit down on a car seat")
        closeTheDoor()
    }
    func closeTheDoor() {
        print("2) close the door")
    }
    override func useProtection() {
        print("3) fasten seat belt")
    }
    override func lookAtTheMirror() {
        print("4) look at the rearview mirror")
    }
    override func turnSignal() {
        print("5) turn on left turn light")
    }
    override func driveForward() {
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
