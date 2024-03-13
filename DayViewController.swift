import UIKit
import CoreData

var managedObjectContext: NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer.viewContext
}

struct Cell {
    var time: String
    var description: String
}

class MondayViewController: UITableViewController {

    let cellId = "cellId"
    var cells: [Cell] = [Cell]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        createCells()
        loadCellData(cells: [Cell]())
        
    }
    
    func loadCellData(cells: [Cell]) {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<CellEntity> = CellEntity.fetchRequest()

        do {
            let cellEntities = try context.fetch(fetchRequest)
            for cellEntity in cellEntities {
                
                let cell = Cell(time: cellEntity.time ?? "", description: cellEntity.descriptionAtr ?? "" )
                if (cell.time == "6AM") {
                    self.cells[0] = cell
                } else if (cell.time == "7AM") {
                    self.cells[1] = cell
                } else if (cell.time == "8AM") {
                    self.cells[2] = cell
                } else if (cell.time == "9AM") {
                    self.cells[3] = cell
                } else if (cell.time == "10AM") {
                    self.cells[4] = cell
                } else if (cell.time == "11AM") {
                    self.cells[5] = cell
                } else if (cell.time == "12AM") {
                    self.cells[6] = cell
                } else if (cell.time == "1PM") {
                    self.cells[7] = cell
                } else if (cell.time == "2PM") {
                    self.cells[8] = cell
                } else if (cell.time == "3PM") {
                    self.cells[9] = cell
                } else if (cell.time == "4PM") {
                    self.cells[10] = cell
                } else if (cell.time == "5PM") {
                    self.cells[11] = cell
                } else if (cell.time == "6PM") {
                    self.cells[12] = cell
                } else if (cell.time == "7PM") {
                    self.cells[13] = cell
                } else if (cell.time == "8PM") {
                    self.cells[14] = cell
                } else if (cell.time == "9PM") {
                    self.cells[15] = cell
                } else if (cell.time == "10PM") {
                    self.cells[16] = cell
                } else if (cell.time == "11PM") {
                    self.cells[17] = cell
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

    func createCells() {
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
            self.saveCellData(time: self.cells[indexPath.row].time, description: description) // Save the updated data
            
        }
        

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    enum Constants {
        static let height: CGFloat = 53.57
        static let lightGray = UIColor(red: 0xe0/255.0, green: 0xe1/255.0, blue: 0xe9/255.0, alpha: 1)
        static let titleFont = UIFont(name: "Didot", size: 30)
        static let corners: CGFloat = 20
        static let grape = CGColor(red: 79/255.0, green: 45/255.0, blue: 84/255.0, alpha: 0.1)
        static let borderWidth: CGFloat = 2
    }
}

class TuesdayViewController: UITableViewController {

    let cellId = "cellId"
    var cells: [Cell] = [Cell]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        createCells()
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

    func createCells() {
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
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    enum Constants {
        static let height: CGFloat = 53.57
        static let lightGray = UIColor(red: 0xe0/255.0, green: 0xe1/255.0, blue: 0xe9/255.0, alpha: 1)
        static let titleFont = UIFont(name: "Didot", size: 30)
        static let corners: CGFloat = 20
        static let grape = CGColor(red: 79/255.0, green: 45/255.0, blue: 84/255.0, alpha: 0.1)
        static let borderWidth: CGFloat = 2
    }
}

class WednesdayViewController: UITableViewController {

    let cellId = "cellId"
    var cells: [Cell] = [Cell]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        createCells()
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

    func createCells() {
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
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    enum Constants {
        static let height: CGFloat = 53.57
        static let lightGray = UIColor(red: 0xe0/255.0, green: 0xe1/255.0, blue: 0xe9/255.0, alpha: 1)
        static let titleFont = UIFont(name: "Didot", size: 30)
        static let corners: CGFloat = 20
        static let grape = CGColor(red: 79/255.0, green: 45/255.0, blue: 84/255.0, alpha: 0.1)
        static let borderWidth: CGFloat = 2
    }
}

class ThursdayViewController: UITableViewController {

    let cellId = "cellId"
    var cells: [Cell] = [Cell]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        createCells()
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

    func createCells() {
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
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    enum Constants {
        static let height: CGFloat = 53.57
        static let lightGray = UIColor(red: 0xe0/255.0, green: 0xe1/255.0, blue: 0xe9/255.0, alpha: 1)
        static let titleFont = UIFont(name: "Didot", size: 30)
        static let corners: CGFloat = 20
        static let grape = CGColor(red: 79/255.0, green: 45/255.0, blue: 84/255.0, alpha: 0.1)
        static let borderWidth: CGFloat = 2
    }
}


class FridayViewController: UITableViewController {

    let cellId = "cellId"
    var cells: [Cell] = [Cell]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        createCells()
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

    func createCells() {
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
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    enum Constants {
        static let height: CGFloat = 53.57
        static let lightGray = UIColor(red: 0xe0/255.0, green: 0xe1/255.0, blue: 0xe9/255.0, alpha: 1)
        static let titleFont = UIFont(name: "Didot", size: 30)
        static let corners: CGFloat = 20
        static let grape = CGColor(red: 79/255.0, green: 45/255.0, blue: 84/255.0, alpha: 0.1)
        static let borderWidth: CGFloat = 2
    }
}

class SaturdayViewController: UITableViewController {

    let cellId = "cellId"
    var cells: [Cell] = [Cell]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        createCells()
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

    func createCells() {
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
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    enum Constants {
        static let height: CGFloat = 53.57
        static let lightGray = UIColor(red: 0xe0/255.0, green: 0xe1/255.0, blue: 0xe9/255.0, alpha: 1)
        static let titleFont = UIFont(name: "Didot", size: 30)
        static let corners: CGFloat = 20
        static let grape = CGColor(red: 79/255.0, green: 45/255.0, blue: 84/255.0, alpha: 0.1)
        static let borderWidth: CGFloat = 2
    }
}


class SundayViewController: UITableViewController {

    let cellId = "cellId"
    var cells: [Cell] = [Cell]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        createCells()
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

    func createCells() {
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
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    enum Constants {
        static let height: CGFloat = 53.57
        static let lightGray = UIColor(red: 0xe0/255.0, green: 0xe1/255.0, blue: 0xe9/255.0, alpha: 1)
        static let titleFont = UIFont(name: "Didot", size: 30)
        static let corners: CGFloat = 20
        static let grape = CGColor(red: 79/255.0, green: 45/255.0, blue: 84/255.0, alpha: 0.1)
        static let borderWidth: CGFloat = 2
    }
}











