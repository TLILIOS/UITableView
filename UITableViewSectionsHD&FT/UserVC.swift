//
//  UserVC.swift
//  UITableViewSectionsHD&FT
//
//  Created by HTLILI on 21/04/2024.
//

import UIKit

class UserVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = arrayNames[indexPath.row]
        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var txtUserName: UITextField!
    var arrayNames = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        if let text = txtUserName.text {
            arrayNames.append(text)
            let indexPath = IndexPath(row: arrayNames.count - 1, section: 0)
            tableView.beginUpdates()
            tableView.insertRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            txtUserName.text = ""
        }
    }
    
    @IBAction func btnEdit(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
        
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        arrayNames.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "") { action, view, completionHandler in
            self.arrayNames.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            completionHandler(true)
        }
        let favoriteAction = UIContextualAction(style: .normal, title: "") { _, _, _ in
            tableView.cellForRow(at: indexPath)?.backgroundColor = .purple        }
        favoriteAction.backgroundColor = .purple
        favoriteAction.image = UIImage(systemName: "heart")
        
        deleteAction.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [deleteAction, favoriteAction])
    }
}
