import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var todoItems: [TodoItem] = [] 
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addItemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TodoItemCell")

    }
    
    @IBAction func addItem(_ sender: UIButton) {
        guard let text = addItemTextField.text, !text.isEmpty else { return }
        let newItem = TodoItem(title: text, isCompleted: false)
        todoItems.append(newItem)
        tableView.reloadData()
        addItemTextField.text = ""
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        let todoItem = todoItems[indexPath.row]
        cell.textLabel?.text = todoItem.title
        cell.accessoryType = todoItem.isCompleted ? .checkmark : .none
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todoItems[indexPath.row].isCompleted.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

