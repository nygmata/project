import UIKit
import CoreData

struct Cell {
    var time: String
    var description: String
}

class DayViewController: UITableViewController, DayView {
    var presenter: DayViewPresenter!
    
    let cellId = "cellId"
    var cells: [Cell] = [Cell]()
    var cellManagement = CellManagement()
    var id: Int
    
    init(index: Int) {
        id = index
        super.init(nibName: nil, bundle: nil)
        
        presenter = DayPresenter(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        cellManagement.createCells(&cells)
        switch id {
            case 0:
                cellManagement.loadCellData(&cells, CellEntityMonday.self)
            case 1:
                cellManagement.loadCellData(&cells, CellEntityTuesday.self)
            case 2:
                cellManagement.loadCellData(&cells, CellEntityWednesday.self)
            case 3:
                cellManagement.loadCellData(&cells, CellEntityThursday.self)
            case 4:
                cellManagement.loadCellData(&cells, CellEntityFriday.self)
            case 5:
                cellManagement.loadCellData(&cells, CellEntitySaturday.self)
            default:
                cellManagement.loadCellData(&cells, CellEntitySunday.self)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let currentCell = cells[indexPath.row]
        cell.textLabel?.text = "\(currentCell.time) - \(currentCell.description)"
        cell.textLabel?.isUserInteractionEnabled = true
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cellTapped)))
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }

    @objc func cellTapped(_ sender: UITapGestureRecognizer) {

        guard let cell = sender.view as? UITableViewCell else { return }
        guard let indexPath = tableView.indexPath(for: cell) else { return }

        let alertController = UIAlertController(title: "Enter Description", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Description"
            textField.text = self.cells[indexPath.row].description
        }

        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            guard let description = alertController.textFields?.first?.text else { return }
            self.cells[indexPath.row].description = description
            cell.textLabel?.text = description
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
            
            switch self.id {
                case 0:
                    self.cellManagement.saveCellData(time: self.cells[indexPath.row].time, description: description, CellEntityMonday.self)
                case 1:
                    self.cellManagement.saveCellData(time: self.cells[indexPath.row].time, description: description, CellEntityTuesday.self)
                case 2:
                    self.cellManagement.saveCellData(time: self.cells[indexPath.row].time, description: description, CellEntityWednesday.self)
                case 3:
                    self.cellManagement.saveCellData(time: self.cells[indexPath.row].time, description: description, CellEntityThursday.self)
                case 4:
                    self.cellManagement.saveCellData(time: self.cells[indexPath.row].time, description: description, CellEntityFriday.self)
                case 5:
                    self.cellManagement.saveCellData(time: self.cells[indexPath.row].time, description: description, CellEntitySaturday.self)
                default:
                    self.cellManagement.saveCellData(time: self.cells[indexPath.row].time, description: description, CellEntitySunday.self)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}
