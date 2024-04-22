//
//  ContactsVC.swift
//  UITableViewSectionsHD&FT
//
//  Created by HTLILI on 21/04/2024.
//

import UIKit

class ContactsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrSection = ["A", "M", "S"]
    var arrRows = [["Amie", "alex", "Axel"], ["Madona"], ["Seli", "Samuel"]]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(arrSection[section])"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRows[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath)
        cell.textLabel?.text = arrRows[indexPath.section][indexPath.row]
        return cell
        
    }

    @IBOutlet weak var ContactsVC: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    

   

}
