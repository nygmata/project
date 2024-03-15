import UIKit
import CoreData

struct Cell {
    var time: String
    var description: String
}

class DayViewController: UITableViewController, DayView {
    var presenter: DayViewPresenter!
    
    let cellId = "cellId"
    var cells: [Cell] = []
    var cellManagement = CellManagement()
    var id: Int
    
    init(index: Int) {
        id = index
        super.init(nibName: nil, bundle: nil)
        
        presenter = DayPresenter(view: self, id: id)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        cells = presenter.getData()
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
            
            self.presenter.editNote(time: self.cells[indexPath.row].time, newDescription: description)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}
