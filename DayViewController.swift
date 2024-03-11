import UIKit

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
        print(1111111)
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
        print(1111111)
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
        print(1111111)
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
        print(1111111)
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
        print(1111111)
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
        print(1111111)
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
        print(1111111)
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












