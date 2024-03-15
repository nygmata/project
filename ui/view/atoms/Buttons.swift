import UIKit

class Button: UIButton {
    var id: Int = 0
    
    init(title: String, font: UIFont, backgroundColor: UIColor, borderColor: CGColor) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = font
        self.backgroundColor = backgroundColor
        layer.borderColor = borderColor
        
        setTitleColor(.darkGray, for: .normal)
        layer.cornerRadius = Constants.corners
        layer.borderWidth = Constants.borderWidth
    }
    
    init(title: String, id: Int, font: UIFont, backgroundColor: UIColor, borderColor: CGColor) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = font
        self.backgroundColor = backgroundColor
        self.id = id
        layer.borderColor = borderColor
        
        setTitleColor(.darkGray, for: .normal)
        layer.cornerRadius = Constants.corners
        layer.borderWidth = Constants.borderWidth
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    enum Constants {
        static let corners: CGFloat = 20
        static let borderWidth: CGFloat = 2
    }
}
