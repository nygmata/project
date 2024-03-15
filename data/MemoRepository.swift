//
//  MemoRepository.swift
//  project
//
//  Created by Paul Nikulshin on 15.03.2024.
//

import UIKit
import CoreData

protocol MemoRepositoryProtocol {
    func loadTextData<T: NSManagedObject>(textView: UITextView, _ entity: T.Type)
    func saveTextData<T: NSManagedObject>(text: String, _ entity: T.Type)
}

class MemoRepository: MemoRepositoryProtocol {
    
    public func loadTextData<T: NSManagedObject>(textView: UITextView, _ entity: T.Type) {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<T> = NSFetchRequest<T>(entityName: String(describing: T.self))

        do {
            let textEntities = try context.fetch(fetchRequest)
            var newText = ""
            for textEntity in textEntities {
                guard let text = textEntity.value(forKey: "text") as? String else {
                    throw NSError(domain: "com.example", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch entity properties"])
                }
                newText = text
            }
            
            textView.text = newText
        } catch let error {
            print("Error fetching cell data: \(error.localizedDescription)")
        }
    }
    
    func saveTextData<T: NSManagedObject>(text: String, _ entity: T.Type) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        guard let entityDescription = NSEntityDescription.entity(forEntityName: String(describing: T.self), in: context) else {
            fatalError("Entity description not found for \(T.self)")
        }

        let cellEntity = T(entity: entityDescription, insertInto: context)
        cellEntity.setValue(text, forKey: "text")

        do {
            try context.save()
            print("Text data saved successfully")
        } catch let error {
            print("Error saving text data: \(error.localizedDescription)")
        }
    }
}
