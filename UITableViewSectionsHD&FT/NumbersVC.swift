//
//  NumbersVC.swift
//  UITableViewSectionsHD&FT
//
//  Created by HTLILI on 22/04/2024.
//

import UIKit

class NumbersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var arryNumbers = [String]()
    let refreshControl = UIRefreshControl()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arryNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NumbersCell", for: indexPath)
        cell.textLabel?.text = arryNumbers[indexPath.row]
        return cell
        
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        refreshControl.tintColor = .gray
        refreshControl.addTarget(self, action: #selector(getData) , for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func getData() {
        arryNumbers.append("Value \(arryNumbers.count)")
        refreshControl.endRefreshing()
        tableView.reloadData()    }

}
