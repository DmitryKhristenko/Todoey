//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Дмитрий Х on 17.10.22.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoryViewController: SwipeTableViewController {
    private var realm = try? Realm()
    private var categories: Results<Category>?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let navBar = navigationController?.navigationBar else {fatalError("Navigation controller does not exist.")}
        navBar.backgroundColor = UIColor(hexString: "1D9BF6")
    }
    // MARK: - TableView Datasource Methods
    // Return the number of rows for the table.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch a cell from superclass.
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if let category = categories?[indexPath.row] {
            cell.textLabel?.text = category.name
            if let categoryColor = UIColor(hexString: category.cellBackgroundColor) {
                cell.backgroundColor = categoryColor
                cell.textLabel?.textColor = ContrastColorOf(categoryColor, returnFlat: true)
            } else {
                do {
                    try realm?.write {
                        cell.backgroundColor = UIColor.randomFlat()
                        category.cellBackgroundColor = cell.backgroundColor?.hexValue() ?? "#9AACD6"
                    }
                } catch {
                    Logger.shared.debugPrint("Error saving color \(error)")
                }
            }
        }
        return cell
    }
    // MARK: - Add new categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add category", style: .default) {_ in
            // what will happen once the user clicks the Add category button on UIAlert
            let newCategory = Category()
            newCategory.name = textField.text!
            self.save(category: newCategory)
        }
        action.isEnabled = false
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
            // Comments about this code in TodoListVC
            NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: textField, queue: OperationQueue.main, using: {_ in
                let textCount = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).count ?? 0
                let textIsNotEmpty = textCount > 0
                action.isEnabled = textIsNotEmpty
            })
        }
        present(alert, animated: true, completion: nil)
    }
    // MARK: - Data Manipulation Methods
    private func save(category:Category) {
        do {
            try realm?.write {
                realm?.add(category)
            }
        } catch {
            Logger.shared.debugPrint("Error saving category \(error)")
        }
        tableView.reloadData()
    }
    private func loadCategories() {
        categories = realm?.objects(Category.self)
        tableView.reloadData()
    }
    // MARK: - Delete Data from swipe
    override func updateModel(at indexPath: IndexPath) {
        if let category = categories?[indexPath.row] {
            do {
                try realm?.write {
                    realm?.delete(category)
                }
            } catch {
                Logger.shared.debugPrint("Error deleting category \(error)")
            }
        }
    }
    // MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC?.selectedCategory = categories?[indexPath.row]
        }
    }
}
