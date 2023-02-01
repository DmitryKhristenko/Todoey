//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by Дмитрий Х on 29.01.23.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0
    }
    // MARK: - TableView datasource methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? SwipeTableViewCell else {
            Logger.shared.debugPrint("error in override func tableView")
            return UITableViewCell()
        }
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { _, indexPath in
            self.updateModel(at: indexPath)
        }
        let editAction = SwipeAction(style: .default, title: "Edit") { _, indexPath in
            self.changeCellName(at: indexPath)
        }
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")
        editAction.image = UIImage(systemName: "rectangle.and.pencil.and.ellipsis")
        return [deleteAction, editAction]
    }
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }
    // this functions are overridden from CategoryVC and TodoListVC
    func updateModel (at indexPath: IndexPath) { }
    func changeCellName(at indexPath: IndexPath) { }
}
