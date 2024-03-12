import UIKit

class Button2: UIButton {
    
    init(title: String, font: UIFont, backgroundColor: UIColor, borderColor: CGColor, action buttonPressed: () -> Void) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = font
        self.backgroundColor = backgroundColor
        layer.borderColor = borderColor
        
        setTitleColor(.darkGray, for: .normal)
        layer.cornerRadius = Constants.corners
        layer.borderWidth = Constants.borderWidth
        addTarget(self, action: #selector(action), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum Constants {
        static let corners: CGFloat = 20
        static let borderWidth: CGFloat = 2
    }
}
