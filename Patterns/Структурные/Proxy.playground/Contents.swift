//MARK: Прокси(заместитель)

// некий промежуточный сервер, который является некой перегородкой, в которую мы обращаемся, прежде чем попасть на какой-то конечный сервер (решает некоторые задачи, чтобы снять с сервера нагрузку)

// виртуальный прокси

class User {
    
    let id = "123"
}

protocol ServerProtocol {
    
    func grandAccess(user: User)
    func denyAccess(user: User)
}

class ServerSide: ServerProtocol {
    
    func grandAccess(user: User) {
        print("access granted to user ID = \(user.id)")
    }
    func denyAccess(user: User) {
        print("access denied to user ID = \(user.id)")
    }
}

class ServerProxy: ServerProtocol {
    
    lazy private var server: ServerSide = ServerSide() // lazy - тяжелые свойства
    
    func grandAccess(user: User) {
        server.grandAccess(user: user)
    }
    func denyAccess(user: User) {
        server.denyAccess(user: user)
    }
}

let user = User()
let proxy = ServerProxy()
proxy.grandAccess(user: user)
proxy.denyAccess(user: user)

// защитный прокси

class User1 {
    
    let name = "Petr"
    let password = "123"
}

protocol ServerProtocol1 {
    
    func grandAccess(user: User1)
}

class ServerSide1: ServerProtocol1 {
    
    func grandAccess(user: User1) {
        print("access granted to user name = \(user.name)")
    }
}

class ServerProxy1: ServerProtocol1 {
    
    private var server: ServerSide1! // по умолчанию nil, значит lazy тоже нил
    
    func grandAccess(user: User1) {
        guard server != nil else {
            print("access can't be granted")
            return
        }
        server.grandAccess(user: user)
    }
    func authenticate(user: User1) {
        guard user.password == "123" else { return }
        print("user authenticated")
        server = ServerSide1()
    }
}

let user1 = User1()
let proxy1 = ServerProxy1()

proxy1.grandAccess(user: user1)
proxy1.authenticate(user: user1)
proxy1.grandAccess(user: user1)
