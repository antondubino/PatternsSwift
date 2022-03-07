//MARK: Декоратор

// Позволяет не плодить кучу классов и обертывать каждый класс

protocol Porshe {
    
    func getPrice() -> Double
    func getDescription() -> String
}

class Boxster: Porshe { // класс, для которого используем разные опции
    
    func getPrice() -> Double {
        return 120
    }
    func getDescription() -> String {
        return "Porshe Boxster"
    }
}

class PorsheDecorator: Porshe { // абстрактный класс, никакого смысла в себе не несет, используется как промежуточный
    
    private let decoratedPorshe: Porshe
    
    required init(dp: Porshe) { // он обязателен для подклассов
        self.decoratedPorshe = dp
    }
    
    func getPrice() -> Double {
        return decoratedPorshe.getPrice()
    }
    func getDescription() -> String {
        return decoratedPorshe.getDescription()
    }
}

class PremiumAudioSystem : PorsheDecorator {
    
    required init(dp: Porshe) {
        super.init(dp: dp)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 30
    }
    
    override func getDescription() -> String {
        return super.getDescription() + " with premium audio system"
    }
}

class PanoramicSunroof: PorsheDecorator {
    
    required init(dp: Porshe) {
        super.init(dp: dp)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 20
    }
    
    override func getDescription() -> String {
        return super.getDescription() + " with panoramic sunroof"
    }
}

var porsheBoxter: Porshe = Boxster()

porsheBoxter.getDescription()
porsheBoxter.getPrice()

porsheBoxter = PremiumAudioSystem(dp: porsheBoxter)
porsheBoxter.getDescription()
porsheBoxter.getPrice()

porsheBoxter = PanoramicSunroof(dp: porsheBoxter)
porsheBoxter.getDescription()
porsheBoxter.getPrice()
