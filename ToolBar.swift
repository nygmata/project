import UIKit

class ToolBar: UIToolbar {
    
    init(action buttonPressed: () -> Void) {
        super.init(frame: .zero)
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let mondayButton = UIBarButtonItem(title: "M", style: .plain, target: self, action: #selector(action))
        
        let tuesdayButton = UIBarButtonItem(title: "T", style: .plain, target: self, action: #selector(action))
        let wednesdayButton = UIBarButtonItem(title: "W", style: .plain, target: self, action: #selector(action))
        let thursdayButton = UIBarButtonItem(title: "T", style: .plain, target: self, action: #selector(action))
        let fridayButton = UIBarButtonItem(title: "F", style: .plain, target: self, action: #selector(action))
        let saturdayButton = UIBarButtonItem(title: "S", style: .plain, target: self, action: #selector(action))
        let sundayButton = UIBarButtonItem(title: "S", style: .plain, target: self, action: #selector(action))
        setItems([mondayButton, tuesdayButton, wednesdayButton, thursdayButton, fridayButton, saturdayButton, sundayButton], animated: false)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
