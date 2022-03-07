import UIKit

//MARK: Строитель

// строитель погогает инициализировать объекты, то есть помогает создавать экземпляры, сокращая код

protocol ThemeProtocol {
    
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
}

class Theme: ThemeProtocol {
    
    var backgroundColor: UIColor
    var textColor: UIColor
    
    init(backgroundColor: UIColor, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
}

protocol ThemebuilderProtocol {
    
    func setBackground(color: UIColor)
    func settext(color: UIColor)
    func createTheme() -> ThemeProtocol?
}

class ThemeBuilder: ThemebuilderProtocol {
    
    private var backgroundColor: UIColor?
    private var textColor: UIColor?
    
    func setBackground(color: UIColor) {
        self.backgroundColor = color
    }
    func settext(color: UIColor) {
        self.textColor = color
    }
    func createTheme() -> ThemeProtocol? {
        guard let backgroundColor = backgroundColor, let textColor = textColor
        else {
            return nil
        }
        return Theme(backgroundColor: backgroundColor, textColor: textColor)
    }
}

let builder = ThemeBuilder()
builder.settext(color: .white)
builder.setBackground(color: .black)
let theme = builder.createTheme()
print(theme!)
