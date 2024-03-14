
import UIKit

class FirstWeekViewController: UIViewController {
    
    var mondayButton = UIButton()
    var tuesdayButton = UIButton()
    var wednesdayButton = UIButton()
    var thursdayButton = UIButton()
    var fridayButton = UIButton()
    var saturdayButton = UIButton()
    var sundayButton = UIButton()
    var goalsButton = UIButton()
    var resultsButton = UIButton()
    var improvementButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.lightGray
        configure()
        
    }
    
    func configure() {
        configureMondayButton()
        configureTuesdayButton()
        configureWednesdayButton()
        configureThursdayButton()
        configureFridayButton()
        configureSaturdayButton()
        configureSundayButton()
        configureGoalsButton()
        configureResultsButton()
        configureImprovementButton()
    }
    
    func configureGoalsButton() {
        view.addSubview(goalsButton)
        goalsButton.setTitle("Main Week Goals", for: .normal)
        goalsButton.setTitleColor(.darkGray, for: .normal)
        goalsButton.titleLabel?.font = Constants.titleFont
        goalsButton.backgroundColor = Constants.goalsPink
        goalsButton.layer.cornerRadius = Constants.corners
        goalsButton.layer.borderColor = Constants.grape
        goalsButton.layer.borderWidth = Constants.borderWidth
        goalsButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                goalsButton.topAnchor.constraint(equalTo: mondayButton.bottomAnchor),
                goalsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                goalsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                goalsButton.heightAnchor.constraint(equalToConstant: Constants.goalsHeight)
            ])
        goalsButton.addTarget(self, action: #selector(goalsButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func goalsButtonPressed() {
        present(GoalsViewController(), animated: true)
    }
    
    func configureResultsButton() {
        view.addSubview(resultsButton)
        resultsButton.setTitle("Main Week Results", for: .normal)
        resultsButton.setTitleColor(.darkGray, for: .normal)
        resultsButton.titleLabel?.font = Constants.titleFont
        resultsButton.backgroundColor = Constants.resultsPink
        resultsButton.layer.cornerRadius = Constants.corners
        resultsButton.layer.borderColor = Constants.grape
        resultsButton.layer.borderWidth = Constants.borderWidth
        resultsButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                resultsButton.topAnchor.constraint(equalTo: goalsButton.bottomAnchor),
                resultsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                resultsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                resultsButton.heightAnchor.constraint(equalToConstant: Constants.goalsHeight)
            ])
        resultsButton.addTarget(self, action: #selector(resultsButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func resultsButtonPressed() {
        present(ResultsViewController(), animated: true)
    }
    
    func configureImprovementButton() {
        view.addSubview(improvementButton)
        improvementButton.setTitle("This Week Improvement", for: .normal)
        improvementButton.setTitleColor(.darkGray, for: .normal)
        improvementButton.titleLabel?.font = Constants.titleFont
        improvementButton.backgroundColor = Constants.improvementPink
        improvementButton.layer.cornerRadius = Constants.corners
        improvementButton.layer.borderColor = Constants.grape
        improvementButton.layer.borderWidth = Constants.borderWidth
        improvementButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                improvementButton.topAnchor.constraint(equalTo: resultsButton.bottomAnchor),
                improvementButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                improvementButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                improvementButton.heightAnchor.constraint(equalToConstant: Constants.goalsHeight)
            ])
        improvementButton.addTarget(self, action: #selector(improvementButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func improvementButtonPressed() {
        present(ImprovementViewController(), animated: true)
    }
    
    func configureMondayButton() {
        view.addSubview(mondayButton)
        mondayButton.setTitle("M", for: .normal)
        mondayButton.setTitleColor(.darkGray, for: .normal)
        mondayButton.titleLabel?.font = Constants.titleFont
        mondayButton.backgroundColor = Constants.mondayPink
        mondayButton.layer.cornerRadius = Constants.corners
        mondayButton.layer.borderColor = Constants.grape
        mondayButton.layer.borderWidth = Constants.borderWidth
        mondayButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                mondayButton.topAnchor.constraint(equalTo: view.topAnchor),
                mondayButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                mondayButton.heightAnchor.constraint(equalToConstant: Constants.height),
                mondayButton.widthAnchor.constraint(equalToConstant: Constants.height)
            ])
        mondayButton.addTarget(self, action: #selector(mondayButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func mondayButtonPressed() {
        present(MondayViewController(), animated: true)
    }
    
    func configureTuesdayButton() {
        view.addSubview(tuesdayButton)
        tuesdayButton.setTitle("T", for: .normal)
        tuesdayButton.setTitleColor(.darkGray, for: .normal)
        tuesdayButton.titleLabel?.font = Constants.titleFont
        tuesdayButton.backgroundColor = Constants.tuesdayPink
        tuesdayButton.layer.cornerRadius = Constants.corners
        tuesdayButton.layer.borderColor = Constants.grape
        tuesdayButton.layer.borderWidth = Constants.borderWidth
        tuesdayButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                tuesdayButton.topAnchor.constraint(equalTo: view.topAnchor),
                tuesdayButton.leadingAnchor.constraint(equalTo: mondayButton.trailingAnchor),
                tuesdayButton.heightAnchor.constraint(equalToConstant: Constants.height),
                tuesdayButton.widthAnchor.constraint(equalToConstant: Constants.height)
            ])
        tuesdayButton.addTarget(self, action: #selector(tuesdayButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func tuesdayButtonPressed() {
        present(TuesdayViewController(), animated: true)
    }
    
    func configureWednesdayButton() {
        view.addSubview(wednesdayButton)
        wednesdayButton.setTitle("W", for: .normal)
        wednesdayButton.setTitleColor(.darkGray, for: .normal)
        wednesdayButton.titleLabel?.font = Constants.titleFont
        wednesdayButton.backgroundColor = Constants.wednesdayPink
        wednesdayButton.layer.cornerRadius = Constants.corners
        wednesdayButton.layer.borderColor = Constants.grape
        wednesdayButton.layer.borderWidth = Constants.borderWidth
        wednesdayButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                wednesdayButton.topAnchor.constraint(equalTo: view.topAnchor),
                wednesdayButton.leadingAnchor.constraint(equalTo: tuesdayButton.trailingAnchor),
                wednesdayButton.heightAnchor.constraint(equalToConstant: Constants.height),
                wednesdayButton.widthAnchor.constraint(equalToConstant: Constants.height)
            ])
        wednesdayButton.addTarget(self, action: #selector(wednesdayButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func wednesdayButtonPressed() {
        present(WednesdayViewController(), animated: true)
    }
    
    func configureThursdayButton() {
        view.addSubview(thursdayButton)
        thursdayButton.setTitle("T", for: .normal)
        thursdayButton.setTitleColor(.darkGray, for: .normal)
        thursdayButton.titleLabel?.font = Constants.titleFont
        thursdayButton.backgroundColor = Constants.thursdayPink
        thursdayButton.layer.cornerRadius = Constants.corners
        thursdayButton.layer.borderColor = Constants.grape
        thursdayButton.layer.borderWidth = Constants.borderWidth
        thursdayButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                thursdayButton.topAnchor.constraint(equalTo: view.topAnchor),
                thursdayButton.leadingAnchor.constraint(equalTo: wednesdayButton.trailingAnchor),
                thursdayButton.heightAnchor.constraint(equalToConstant: Constants.height),
                thursdayButton.widthAnchor.constraint(equalToConstant: Constants.height)
            ])
        thursdayButton.addTarget(self, action: #selector(thursdayButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func thursdayButtonPressed() {
        present(ThursdayViewController(), animated: true)
    }
    
    func configureFridayButton() {
        view.addSubview(fridayButton)
        fridayButton.setTitle("F", for: .normal)
        fridayButton.setTitleColor(.darkGray, for: .normal)
        fridayButton.titleLabel?.font = Constants.titleFont
        fridayButton.backgroundColor = Constants.fridayPink
        fridayButton.layer.cornerRadius = Constants.corners
        fridayButton.layer.borderColor = Constants.grape
        fridayButton.layer.borderWidth = Constants.borderWidth
        fridayButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                fridayButton.topAnchor.constraint(equalTo: view.topAnchor),
                fridayButton.leadingAnchor.constraint(equalTo: thursdayButton.trailingAnchor),
                fridayButton.heightAnchor.constraint(equalToConstant: Constants.height),
                fridayButton.widthAnchor.constraint(equalToConstant: Constants.height)
            ])
        fridayButton.addTarget(self, action: #selector(fridayButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func fridayButtonPressed() {
        present(FridayViewController(), animated: true)
    }
    
    func configureSaturdayButton() {
        view.addSubview(saturdayButton)
        saturdayButton.setTitle("S", for: .normal)
        saturdayButton.setTitleColor(.darkGray, for: .normal)
        saturdayButton.titleLabel?.font = Constants.titleFont
        saturdayButton.backgroundColor = Constants.saturdayPink
        saturdayButton.layer.cornerRadius = Constants.corners
        saturdayButton.layer.borderColor = Constants.grape
        saturdayButton.layer.borderWidth = Constants.borderWidth
        saturdayButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                saturdayButton.topAnchor.constraint(equalTo: view.topAnchor),
                saturdayButton.leadingAnchor.constraint(equalTo: fridayButton.trailingAnchor),
                saturdayButton.heightAnchor.constraint(equalToConstant: Constants.height),
                saturdayButton.widthAnchor.constraint(equalToConstant: Constants.height)
            ])
        saturdayButton.addTarget(self, action: #selector(saturdayButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func saturdayButtonPressed() {
        present(SaturdayViewController(), animated: true)
    }
    
    func configureSundayButton() {
        view.addSubview(sundayButton)
        sundayButton.setTitle("S", for: .normal)
        sundayButton.setTitleColor(.darkGray, for: .normal)
        sundayButton.titleLabel?.font = Constants.titleFont
        sundayButton.backgroundColor = Constants.sundayPink
        sundayButton.layer.cornerRadius = Constants.corners
        sundayButton.layer.borderColor = Constants.grape
        sundayButton.layer.borderWidth = Constants.borderWidth
        sundayButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                sundayButton.topAnchor.constraint(equalTo: view.topAnchor),
                sundayButton.leadingAnchor.constraint(equalTo: saturdayButton.trailingAnchor),
                sundayButton.heightAnchor.constraint(equalToConstant: Constants.height),
                sundayButton.widthAnchor.constraint(equalToConstant: Constants.height)
            ])
        sundayButton.addTarget(self, action: #selector(sundayButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func sundayButtonPressed() {
        present(SundayViewController(), animated: true)
    }
    
    enum Constants {
        static let height: CGFloat = 53.57
        static let goalsHeight: CGFloat = 100
        static let lightGray = UIColor(red: 0xe0/255.0, green: 0xe1/255.0, blue: 0xe9/255.0, alpha: 1)
        static let titleFont = UIFont(name: "Didot", size: 30)
        static let corners: CGFloat = 20
        static let grape = CGColor(red: 79/255.0, green: 45/255.0, blue: 84/255.0, alpha: 0.1)
        static let borderWidth: CGFloat = 2
        static let mondayPink = UIColor(red: 0xfe/255.0, green: 0xe8/255.0, blue: 0xdd/255.0, alpha: 1)
        static let tuesdayPink = UIColor(red: 0xfd/255.0, green: 0xdc/255.0, blue: 0xe2/255.0, alpha: 1)
        static let wednesdayPink = UIColor(red: 0xf7/255.0, green: 0xd0/255.0, blue: 0xd3/255.0, alpha: 1)
        static let thursdayPink = UIColor(red: 0xfd/255.0, green: 0xc8/255.0, blue: 0xc0/255.0, alpha: 1)
        static let fridayPink = UIColor(red: 0xd7/255.0, green: 0xb7/255.0, blue: 0xbc/255.0, alpha: 1)
        static let saturdayPink = UIColor(red: 0xd0/255.0, green: 0x92/255.0, blue: 0xa1/255.0, alpha: 1)
        static let sundayPink = UIColor(red: 0xc1/255.0, green: 0x82/255.0, blue: 0xa1/255.0, alpha: 1)
        static let goalsPink = UIColor(red: 0xf7/255.0, green: 0xee/255.0, blue: 0xf3/255.0, alpha: 1)
        static let resultsPink = UIColor(red: 0xee/255.0, green: 0xe8/255.0, blue: 0xef/255.0, alpha: 1)
        static let improvementPink = UIColor(red: 0xec/255.0, green: 0xe9/255.0, blue: 0xf0/255.0, alpha: 1)
    }
    
}
