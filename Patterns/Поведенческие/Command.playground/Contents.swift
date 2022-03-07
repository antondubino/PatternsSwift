//MARK: Комманда

// Команды нужны нам для того, чтобы мы инкапсулировали наш код в виде команд

class Account { // нужен для того, чтобы мы могли идентифицировать аккаунт, с которым мы работаем
    
    var accountName: String
    var balance: Int
    
    init(accountName: String, balance: Int) {
        self.accountName = accountName
        self.balance = balance
    }
}

protocol Command {
    
    func execute()
    var isComplete: Bool { get set }
}

class Deposit: Command { // подписываемся под комманду, чтобы потом объединиться с другими классам, подписанными на команду
    
    private var _account: Account
    private var _amount: Int
    
    func execute() {
        _account.balance += _amount
        isComplete = true
    }
    
    var isComplete = false
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
}

class WithDraw: Command {
    
    private var _account: Account
    private var _amount: Int
    
    func execute() {
        if _account.balance >= _amount {
            _account.balance -= _amount
            isComplete = true
        } else {
            print("not enough money")
        }
    }
    
    var isComplete = false
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
}

class TransactionManager { // менеджер, отвечающий за все транзакции
    
    static let shared = TransactionManager()
    
    private init() {}
    
    private var _transactions: [Command] = [] // здесь менеджер знает, какие команды ему нужно выполнять
    
    var pendingTransactions: [Command] { // проверяем все незаконченные транзакции
        get {
            return self._transactions.filter { $0.isComplete == false }
        }
    }
    
    func addTransactions(command: Command) {
        self._transactions.append(command)
    }
    func processingTransactions() { // проверяем все транзакции и заканчиваем их
        _transactions.filter { $0.isComplete == false }.forEach { $0.execute() }
    } // мы фильтруем транзакции, получается массив незаконченных транзакций и для каждого элемента этого массива просим выполнить execute()
}

let account = Account(accountName: "Anton Dubino", balance: 1000)
let transactionManager = TransactionManager.shared
transactionManager.addTransactions(command: Deposit(account: account, amount: 100))
transactionManager.addTransactions(command: WithDraw(account: account, amount: 500))
transactionManager.pendingTransactions
account.balance
transactionManager.processingTransactions()
account.balance
