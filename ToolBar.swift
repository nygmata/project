import UIKit

class ToolBar: UIView {
    
    var mondayButton = UIBarButtonItem()
    var tuesdayButton = UIBarButtonItem()
    var wednesdayButton = UIBarButtonItem()
    var thursdayButton = UIBarButtonItem()
    var fridayButton = UIBarButtonItem()
    var saturdayButton = UIBarButtonItem()
    var sundayButton = UIBarButtonItem()
    
    init(action buttonPressed: () -> Void) {
        super.init(frame: .zero)
        mondayButton = UIBarButtonItem(customView: getButton(title: "M"))
        tuesdayButton = UIBarButtonItem(customView: getButton(title: "T"))
        wednesdayButton = UIBarButtonItem(customView: getButton(title: "W"))
        thursdayButton = UIBarButtonItem(customView: getButton(title: "T"))
        fridayButton = UIBarButtonItem(customView: getButton(title: "F"))
        saturdayButton = UIBarButtonItem(customView: getButton(title: "S"))
        sundayButton = UIBarButtonItem(customView: getButton(title: "S"))
    }
    
    func getButton(title: String) -> UIButton {
        let btn1 = UIButton(type: .custom)
        
        btn1.backgroundColor = .lightGray
        btn1.frame = CGRect(x: 0, y: 0, width: Constants.width, height: Constants.height)
        btn1.addTarget(self, action: #selector(action), for: .touchUpInside)
        btn1.setTitle(title, for: .normal)
        btn1.titleLabel?.font = Constants.titleFont
        btn1.layer.borderColor = Constants.grape
        btn1.layer.cornerRadius = Constants.corners
        btn1.layer.borderWidth = Constants.borderWidth
        
        return btn1
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
        static let goalsPink = UIColor(red: 0xf7/255.0, green: 0xee/255.0, blue: 0xf3/255.0, alpha: 1)
        static let borderWidth: CGFloat = 2
    }
}
