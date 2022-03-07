//MARK: Фасад

class FruitShop {
    
    func buyFruits() -> String {
        return "fruits"
    }
}

class MeatShop {
    
    func buyMeat() -> String {
        return "meat"
    }
}

class MilkShop {
    
    func buyMilk() -> String {
        return "milk"
    }
}

class SweetShop {
    
    func buySweets() -> String {
        return "sweets"
    }
}

class BreadShop {
    
    func buyBread() -> String {
        return "bread"
    }
}

// Создаем фасад (супермаркет)

class SuperMarket {
    
    private let fruitShop = FruitShop()
    private let meatShop = MeatShop()
    private let milkShop = MilkShop()
    private let sweetShop = SweetShop()
    private let breadShop = BreadShop()
    
    func buyProduct() -> String {
        var products = ""
        products += fruitShop.buyFruits() + ", "
        products += meatShop.buyMeat() + ", "
        products += milkShop.buyMilk() + ", "
        products += sweetShop.buySweets() + ", "
        products += breadShop.buyBread()
        return "i bought: " + products
    }
}

let sm = SuperMarket()
sm.buyProduct()
