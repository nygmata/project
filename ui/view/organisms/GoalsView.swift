import UIKit

class ResultsViewController : UIViewController {
    
    var textView = UITextView()
    let cellManagement = CellManagement()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.lightGray
        configureTextView()
        NotificationCenter.default.addObserver(self, selector: #selector(textViewDidChange(_:)), name: UITextView.textDidChangeNotification, object: textView)
    }
    
    @objc func textViewDidChange(_ notification: Notification) {
        if let textView = notification.object as? UITextView {
//            cellManagement.saveTextData(text: textView.text, Results.self)
        }
    }
    
    func configureTextView() {
        view.addSubview(textView)
//        cellManagement.loadTextData(textView: textView, Results.self)
        textView.backgroundColor = Constants.resultsPink
        textView.font = Constants.titleFont
        textView.textColor = .black
        textView.layer.cornerRadius = Constants.corners
        textView.layer.borderColor = Constants.grape
        textView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                textView.topAnchor.constraint(equalTo: view.topAnchor),
                textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                textView.heightAnchor.constraint(equalToConstant: Constants.height)
            ])
    }
    
    enum Constants {
        static let height: CGFloat = 100
        static let lightGray = UIColor(red: 0xe0/255.0, green: 0xe1/255.0, blue: 0xe9/255.0, alpha: 1)
        static let titleFont = UIFont(name: "Didot", size: 30)
        static let corners: CGFloat = 20
        static let grape = CGColor(red: 79/255.0, green: 45/255.0, blue: 84/255.0, alpha: 0.1)
        static let resultsPink = UIColor(red: 0xee/255.0, green: 0xe8/255.0, blue: 0xef/255.0, alpha: 1)
    }
}

class GoalsViewController : UIViewController {
    
    var textView = UITextView()
    let cellManagement = CellManagement()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.lightGray
        configureTextView()
        NotificationCenter.default.addObserver(self, selector: #selector(textViewDidChange(_:)), name: UITextView.textDidChangeNotification, object: textView)
    }
    
    @objc func textViewDidChange(_ notification: Notification) {
        if let textView = notification.object as? UITextView {
//            cellManagement.saveTextData(text: textView.text, Goals.self)
        }
    }
    
    func configureTextView() {
        view.addSubview(textView)
//        cellManagement.loadTextData(textView: textView, Goals.self)
        textView.backgroundColor = Constants.goalsPink
        textView.font = Constants.titleFont
        textView.textColor = .black
        textView.layer.cornerRadius = Constants.corners
        textView.layer.borderColor = Constants.grape
        textView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                textView.topAnchor.constraint(equalTo: view.topAnchor),
                textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                textView.heightAnchor.constraint(equalToConstant: Constants.height)
            ])
        
    }
    
    enum Constants {
        static let height: CGFloat = 100
        static let lightGray = UIColor(red: 0xe0/255.0, green: 0xe1/255.0, blue: 0xe9/255.0, alpha: 1)
        static let titleFont = UIFont(name: "Didot", size: 30)
        static let corners: CGFloat = 20
        static let grape = CGColor(red: 79/255.0, green: 45/255.0, blue: 84/255.0, alpha: 0.1)
        static let goalsPink = UIColor(red: 0xf7/255.0, green: 0xee/255.0, blue: 0xf3/255.0, alpha: 1)
    }
}
class ImprovementViewController : UIViewController {
    
    var textView = UITextView()
    let cellManagement = CellManagement()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.lightGray
        configureTextView()
        NotificationCenter.default.addObserver(self, selector: #selector(textViewDidChange(_:)), name: UITextView.textDidChangeNotification, object: textView)
    }
    
    @objc func textViewDidChange(_ notification: Notification) {
        if let textView = notification.object as? UITextView {
//            cellManagement.saveTextData(text: textView.text, Improvement.self)
        }
    }
    
    func configureTextView() {
        view.addSubview(textView)
//        cellManagement.loadTextData(textView: textView, Improvement.self)
        textView.backgroundColor = Constants.goalsPink
        textView.font = Constants.titleFont
        textView.textColor = .black
        textView.layer.cornerRadius = Constants.corners
        textView.layer.borderColor = Constants.grape
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.heightAnchor.constraint(equalToConstant: Constants.height)
        ])
        
    }
    
    enum Constants {
        static let height: CGFloat = 100
        static let lightGray = UIColor(red: 0xe0/255.0, green: 0xe1/255.0, blue: 0xe9/255.0, alpha: 1)
        static let titleFont = UIFont(name: "Didot", size: 30)
        static let corners: CGFloat = 20
        static let grape = CGColor(red: 79/255.0, green: 45/255.0, blue: 84/255.0, alpha: 0.1)
        static let goalsPink = UIColor(red: 0xf7/255.0, green: 0xee/255.0, blue: 0xf3/255.0, alpha: 1)
    }
}
