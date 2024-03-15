//
//  AboutViewController.swift
//  project
//
//  Created by Paul Nikulshin on 15.03.2024.
//

import UIKit
import MapKit

class AboutViewController: UIViewController {
    var text: UITextView!
    var map: MKMapView!
    
    override func viewDidLoad() {
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        configureText()
        configureMap()
    }
    
    func configureText() {
        text = UITextView()
        view.addSubview(text)
        text.translatesAutoresizingMaskIntoConstraints = false
        
        text.isEditable = false
        text.isUserInteractionEnabled = true
        text.addHyperLinksToText(
            originalText: Constants.text,
            hyperLinks: [
                "@p_nikulshin": "https://t.me/p_nikulshin",
                "@who_is_ed_nygma": "https://t.me/who_is_ed_nygma"
            ]
        )
        
        text.font = UIFont(name: "Didot", size: 20)
        
        NSLayoutConstraint.activate([
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            text.heightAnchor.constraint(equalToConstant: Constants.textHeight)
        ])
    }
    
    func configureMap() {
        map = MKMapView()
        
        view.addSubview(map)
        map.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            map.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            map.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.padding),
            map.topAnchor.constraint(equalTo: text.bottomAnchor, constant: Constants.padding),
            map.heightAnchor.constraint(equalToConstant: 2*Constants.textHeight)
        ])
        
        let office = MKPointAnnotation()
        office.title = Constants.officeName
        office.coordinate = Constants.officeCoords
        map.addAnnotation(office)
        map.centerCoordinate = office.coordinate
        map.showAnnotations(map.annotations, animated: true)
    }
    
    enum Constants {
        static let padding: CGFloat = CGFloat(10)
        static let textHeight: CGFloat = CGFloat(250)
        static let text: String  = "Developers:\n Pavel Nikulshin - @p_nikulshin \n Anna Fedotova - @who_is_ed_nygma \nStudents of HSE university"
        static let officeName: String = "HSE"
        static let officeCoords: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 55.754196,longitude: 37.649103)
    }
}

extension UITextView {

  func addHyperLinksToText(originalText: String, hyperLinks: [String: String]) {
    let style = NSMutableParagraphStyle()
    style.alignment = .left
    let attributedOriginalText = NSMutableAttributedString(string: originalText)
    for (hyperLink, urlString) in hyperLinks {
        let linkRange = attributedOriginalText.mutableString.range(of: hyperLink)
        let fullRange = NSRange(location: 0, length: attributedOriginalText.length)
        attributedOriginalText.addAttribute(NSAttributedString.Key.link, value: urlString, range: linkRange)
        attributedOriginalText.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: fullRange)
    }
    
    self.linkTextAttributes = [
        NSAttributedString.Key.foregroundColor: UIColor.blue,
        NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
    ]
    self.attributedText = attributedOriginalText
  }
}
