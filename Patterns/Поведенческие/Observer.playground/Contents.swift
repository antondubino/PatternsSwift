import Foundation

//MARK: Наблюдатель

// Паттерн позволяет подписываться и реагировать на изменения

protocol Subject {
    
    func add(observer: PropertyObserver) // В этот метод мы хотим добавить всех из PropertyObsserver
    func remove(observer: PropertyObserver)
    func notify(withString string: String) // Позволяет уведомить наших наблюдателей о каких-то изменениях
}

class Teacher: Subject {
    
    var observerCollection = NSMutableSet() // нам нужна коллекция, где все объекты мы можем изменять и они находятся в одном экземпляре
    var homeTask = "" { // новое значение берем из homeTask и помещаем в notify, который вызывает у каждого нашего наблюдателя didGet
        didSet {
            notify(withString: homeTask)
        }
    }
    
    func add(observer: PropertyObserver) { // когда мы кого-то добавляем, мы должны куда-то добавлять нашего наблюдателя, поэтому создаем коллекцию выше
        observerCollection.add(observer)
    }
    
    func remove(observer: PropertyObserver) {
        observerCollection.remove(observer)
    }
    
    func notify(withString string: String) {
        for observer in observerCollection {
            (observer as! PropertyObserver).didGet(newTask: string) // для того, чтобы обратиться к методу, который у нас реализован в PropertyObserver
        }
    }
    
    
    
}

protocol PropertyObserver { // Протокол, который будут использовать все наши наблюдатели
    
    func didGet(newTask task: String) // Получено новое задание
}


class Pupil: NSObject, PropertyObserver {
    
    var homeTask = ""
    
    func didGet(newTask task: String) {
        homeTask = task
        print("new homework to be done")
    }
}

let teacher = Teacher()
let pupil = Pupil()

teacher.add(observer: pupil)
teacher.homeTask = "задача №3 на странице 21"
pupil.homeTask
teacher.homeTask = "выходной"
pupil.homeTask
