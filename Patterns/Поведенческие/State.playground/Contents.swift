//MARK: Состояние

// избавляемся от if-else
// отличается от Стратегии тем, что принтер не знает о состояниях, и его не надо редактировать (он закрыт для изменений)

protocol State {
    
    func on(printer: Printer)
    func off(printer: Printer)
    func printDocument(printer: Printer)
}

// определяем состояния

class On: State {
    
    func on(printer: Printer) {
        print("it is on")
    }
    func off(printer: Printer) {
        print("turning printer off")
        printer.set(state: Off())
    }
    func printDocument(printer: Printer) {
        print("printing")
        printer.set(state: Print())
    }
}

class Off: State {
    
    func on(printer: Printer) {
        print("turninh on")
        printer.set(state: On())
    }
    func off(printer: Printer) {
        print("it is already off")
    }
    func printDocument(printer: Printer) {
        print("it is off, we can't print")
    }
}

class Print: State {
    
    func on(printer: Printer) {
        print("it is on already")
    }
    func off(printer: Printer) {
        print("printer off")
        printer.set(state: Off())
    }
    func printDocument(printer: Printer) {
        print("it is already printing")
    }
}

class Printer {
    
    var state: State // включает в себя все возможные состояния(ключевое звено в паттерне)
    
    func turnOn() {
        state.on(printer: self)
    }
    func turnOff() {
        state.off(printer: self)
    }
    func printDoucment() {
        state.printDocument(printer: self)
    }
    
    init() {
        self.state = On() // принтер изначально в состоянии On
    }
    
    func set(state: State) {
        self.state = state
    }
}

let printer = Printer()
printer.printDoucment()
printer.turnOff()
printer.turnOn()
printer.turnOn()
printer.turnOff()
printer.turnOff()
