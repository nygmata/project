import UIKit

class ToolBar: UIView {
    
    var buttons: [UIBarButtonItem] = []
    
    init(selector: Selector) {
        super.init(frame: .zero)
        
        let days = ["M", "T", "W", "T", "F", "S", "S"]
        
        for i in 0...6 {
            buttons.append(getButton(title: days[i], index: i, selector: selector))
        }
    }
    
    func getButton(title: String, index: Int, selector: Selector) -> UIBarButtonItem {
        let btn1 = UIButton(type: .custom)
        btn1.tag = index
        btn1.backgroundColor = Constants.dark
        btn1.setTitleColor(.white, for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: Constants.width, height: Constants.height)
        btn1.addTarget(self, action: selector, for: .touchUpInside)
        btn1.setTitle(title, for: .normal)
        btn1.titleLabel?.font = Constants.titleFont
        btn1.layer.borderColor = Constants.grape
        btn1.layer.cornerRadius = Constants.corners
        btn1.layer.borderWidth = Constants.borderWidth
        
        return UIBarButtonItem(customView: btn1)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum Constants {
        static let height: CGFloat = 50
        static let width: CGFloat = 51.6
        static let lightGray = UIColor(red: 0xe0/255.0, green: 0xe1/255.0, blue: 0xe9/255.0, alpha: 1)
        static let titleFont = UIFont(name: "Didot", size: 15)
        static let corners: CGFloat = 20
        static let grape = CGColor(red: 79/255.0, green: 45/255.0, blue: 84/255.0, alpha: 0.1)
        static let dark = UIColor(red: 0x79/255.0, green: 0x80/255.0, blue: 0xA9/255.0, alpha: 1)
        static let borderWidth: CGFloat = 2
    }
}
