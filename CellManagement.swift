import UIKit
import CoreData

let times = ["6AM", "7AM", "8AM", "9AM", "10AM", "11AM", "12AM", "1PM", "2PM", "3PM", "4PM", "5PM", "6PM", "7PM", "8PM", "9PM", "10PM", "11PM"]

let timeToIndex: [String: Int] = Dictionary(uniqueKeysWithValues: zip(times, 0...17))

class CellManagement: UIViewController {
    
    func createCells(_ cells: inout [Cell]) {
        for time in times {
            cells.append(Cell(time: time, description: ""))
        }
    }
    /*
    public func loadCellData<T: NSManagedObject>(_ cells: inout [Cell], entity: T.Type) {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<T>(entityName: String(describing: entity))

        do {
            let cellEntities = try context.fetch(fetchRequest)
            for cellEntity in cellEntities {

                let cell = Cell(time: cellEntity.time ?? "", description: cellEntity.descriptionAtr ?? "" )

                if let index = timeToIndex[cell.time] {
                    cells[index] = cell
                }
            }
        } catch let error {
            print("Error fetching cell data: \(error.localizedDescription)")
        }
    }
    
    func saveCellData(time: String, description: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let cellEntity = CellEntityMonday(context: context)
        cellEntity.time = time
        cellEntity.descriptionAtr = description

        do {
            try context.save()
        } catch let error {
            print("Error saving cell data: \(error.localizedDescription)")
        }
    }*/
    
}
