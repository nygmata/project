import UIKit
import CoreData

var managedObjectContext: NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer.viewContext
}

class CellManagement: UIViewController {
    
    public func createCells(_ cells: inout [Cell]) {
        cells.append(Cell(time: "6AM", description: ""))
        cells.append(Cell(time: "7AM", description: ""))
        cells.append(Cell(time: "8AM", description: ""))
        cells.append(Cell(time: "9AM", description: ""))
        cells.append(Cell(time: "10AM", description: ""))
        cells.append(Cell(time: "11AM", description: ""))
        cells.append(Cell(time: "12AM", description: ""))
        cells.append(Cell(time: "1PM", description: ""))
        cells.append(Cell(time: "2PM", description: ""))
        cells.append(Cell(time: "3PM", description: ""))
        cells.append(Cell(time: "4PM", description: ""))
        cells.append(Cell(time: "5PM", description: ""))
        cells.append(Cell(time: "6PM", description: ""))
        cells.append(Cell(time: "7PM", description: ""))
        cells.append(Cell(time: "8PM", description: ""))
        cells.append(Cell(time: "9PM", description: ""))
        cells.append(Cell(time: "10PM", description: ""))
        cells.append(Cell(time: "11PM", description: ""))
    }
    
    public func loadCellData(_ cells: inout [Cell]) {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<CellEntity> = CellEntity.fetchRequest()

        do {
            let cellEntities = try context.fetch(fetchRequest)
            for cellEntity in cellEntities {
                
                let cell = Cell(time: cellEntity.time ?? "", description: cellEntity.descriptionAtr ?? "" )
                if (cell.time == "6AM") {
                    cells[0] = cell
                } else if (cell.time == "7AM") {
                    cells[1] = cell
                } else if (cell.time == "8AM") {
                    cells[2] = cell
                } else if (cell.time == "9AM") {
                    cells[3] = cell
                } else if (cell.time == "10AM") {
                    cells[4] = cell
                } else if (cell.time == "11AM") {
                    cells[5] = cell
                } else if (cell.time == "12AM") {
                    cells[6] = cell
                } else if (cell.time == "1PM") {
                    cells[7] = cell
                } else if (cell.time == "2PM") {
                    cells[8] = cell
                } else if (cell.time == "3PM") {
                    cells[9] = cell
                } else if (cell.time == "4PM") {
                    cells[10] = cell
                } else if (cell.time == "5PM") {
                    cells[11] = cell
                } else if (cell.time == "6PM") {
                    cells[12] = cell
                } else if (cell.time == "7PM") {
                    cells[13] = cell
                } else if (cell.time == "8PM") {
                    cells[14] = cell
                } else if (cell.time == "9PM") {
                    cells[15] = cell
                } else if (cell.time == "10PM") {
                    cells[16] = cell
                } else if (cell.time == "11PM") {
                    cells[17] = cell
                }
            }
        } catch let error {
            print("Error fetching cell data: \(error.localizedDescription)")
        }

    }
    
    func saveCellData(time: String, description: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let cellEntity = CellEntity(context: context)
        cellEntity.time = time
        cellEntity.descriptionAtr = description

        do {
            try context.save()
        } catch let error {
            print("Error saving cell data: \(error.localizedDescription)")
        }
    }
}
