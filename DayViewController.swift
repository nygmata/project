import UIKit
import CoreData

struct Cell {
    var time: String
    var description: String
}

class MondayViewController: UITableViewController {

    let cellId = "cellId"
    var cells: [Cell] = [Cell]()
    var cellManagement = CellManagement()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        cellManagement.createCells(&cells)
        cellManagement.loadCellData(&cells, CellEntityMonday.self)
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
            
            self.cellManagement.saveCellData(time: self.cells[indexPath.row].time, description: description, CellEntityMonday.self)
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}

class TuesdayViewController: UITableViewController {

    let cellId = "cellId"
    var cells: [Cell] = [Cell]()
    var cellManagement = CellManagement()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        cellManagement.createCells(&cells)
        cellManagement.loadCellData(&cells, CellEntityTuesday.self)
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
            self.cellManagement.saveCellData(time: self.cells[indexPath.row].time, description: description, CellEntityTuesday.self)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}

class WednesdayViewController: UITableViewController {

    let cellId = "cellId"
    var cells: [Cell] = [Cell]()
    var cellManagement = CellManagement()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        cellManagement.createCells(&cells)
        cellManagement.loadCellData(&cells, CellEntityWednesday.self)
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
            self.cellManagement.saveCellData(time: self.cells[indexPath.row].time, description: description, CellEntityWednesday.self)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}

class ThursdayViewController: UITableViewController {

    let cellId = "cellId"
    var cells: [Cell] = [Cell]()
    var cellManagement = CellManagement()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        cellManagement.createCells(&cells)
       
        cellManagement.loadCellData(&cells, CellEntityThursday.self)
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
            self.cellManagement.saveCellData(time: self.cells[indexPath.row].time, description: description, CellEntityThursday.self)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}

class FridayViewController: UITableViewController {

    let cellId = "cellId"
    var cells: [Cell] = [Cell]()
    var cellManagement = CellManagement()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        cellManagement.createCells(&cells)
        cellManagement.loadCellData(&cells, CellEntityFriday.self)
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
            self.cellManagement.saveCellData(time: self.cells[indexPath.row].time, description: description, CellEntityFriday.self)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}

class SaturdayViewController: UITableViewController {

    let cellId = "cellId"
    var cells: [Cell] = [Cell]()
    var cellManagement = CellManagement()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        cellManagement.createCells(&cells)

        cellManagement.loadCellData(&cells, CellEntitySaturday.self)
    }
    
    func saveCellData(time: String, description: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let cellEntity = CellEntitySaturday(context: context)
        cellEntity.time = time
        cellEntity.descriptionAtr = description

        do {
            try context.save()
        } catch let error {
            print("Error saving cell data: \(error.localizedDescription)")
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
            self.cellManagement.saveCellData(time: self.cells[indexPath.row].time, description: description, CellEntitySaturday.self)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}

class SundayViewController: UITableViewController {

    let cellId = "cellId"
    var cells: [Cell] = [Cell]()
    var cellManagement = CellManagement()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        cellManagement.createCells(&cells)
        cellManagement.loadCellData(&cells, CellEntitySunday.self)
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
            self.cellManagement.saveCellData(time: self.cells[indexPath.row].time, description: description, CellEntitySunday.self)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}
