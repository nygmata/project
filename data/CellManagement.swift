import UIKit
import CoreData

//let times = ["6AM", "7AM", "8AM", "9AM", "10AM", "11AM", "12AM", "1PM", "2PM", "3PM", "4PM", "5PM", "6PM", "7PM", "8PM", "9PM", "10PM", "11PM"]
//
//let timeToIndex: [String: Int] = Dictionary(uniqueKeysWithValues: zip(times, 0...17))

class CellManagement {
    
    func createCells(_ cells: inout [Cell]) {
        for time in times {
            cells.append(Cell(time: time, description: ""))
        }
    }
    
    public func loadCellData<T: NSManagedObject>(_ cells: inout [Cell], _ entity: T.Type) {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<T> = NSFetchRequest<T>(entityName: String(describing: T.self))

        do {
            let cellEntities = try context.fetch(fetchRequest)
            for cellEntity in cellEntities {
                
                guard let time = cellEntity.value(forKey: "time") as? String,
                              let descriptionAtr = cellEntity.value(forKey: "descriptionAtr") as? String else {
                            throw NSError(domain: "com.example", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch entity properties"])
                        }
                let cell = Cell(time: time, description: descriptionAtr)
            
                if let index = timeToIndex[cell.time] {
                    cells[index] = cell
                }
            }
        } catch let error {
            print("Error fetching cell data: \(error.localizedDescription)")
        }
    }
    
    func saveCellData<T: NSManagedObject>(time: String, description: String, _ entity: T.Type) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        guard let entityDescription = NSEntityDescription.entity(forEntityName: String(describing: T.self), in: context) else {
            fatalError("Entity description not found for \(T.self)")
        }

        let cellEntity = T(entity: entityDescription, insertInto: context)
        cellEntity.setValue(time, forKey: "time")
        cellEntity.setValue(description, forKey: "descriptionAtr")

        do {
            try context.save()
            print("Cell data saved successfully")
        } catch let error {
            print("Error saving cell data: \(error.localizedDescription)")
        }
    }
    
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
