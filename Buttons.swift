import UIKit

class Button2: UIButton {
    
    init(title: String, font: UIFont, backgroundColor: UIColor, borderColor: CGColor, action buttonPressed: () -> Void) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = font
        self.backgroundColor = backgroundColor
        layer.borderColor = borderColor
        
        setTitleColor(.darkGray, for: .normal)
        layer.cornerRadius = 10
        layer.borderWidth = 2
        addTarget(self, action: #selector(action), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
