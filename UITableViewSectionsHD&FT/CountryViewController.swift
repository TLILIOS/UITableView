//
//  CountryViewController.swift
//  UITableViewSectionsHD&FT
//
//  Created by HTLILI on 23/04/2024.
//

import UIKit

class CountryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var arrCountries = ["France", "Tunisia", "Italy", "USA", "UK", "China", "Mexico"]

    override func viewDidLoad() {
        super.viewDidLoad()
        arrCountries.removeAll()
        tableView.dataSource = self
        tableView.delegate = self
        if arrCountries.isEmpty {
            tableView.isHidden = true
            let imgErrorPhoto = UIImageView(frame: CGRect(x: 50, y: 100, width: self.view.frame.width - 100 , height: 250))
            imgErrorPhoto.image = UIImage(systemName: "icloud.slash")
            imgErrorPhoto.tintColor = .systemGray
            self.view.addSubview(imgErrorPhoto)
            let lblErrorMessage = UILabel(frame: CGRect(x: imgErrorPhoto.frame.minX, y: imgErrorPhoto.frame.maxY, width: imgErrorPhoto.frame.width, height: 45))
            lblErrorMessage.text = "No Data To Display"
            lblErrorMessage.textAlignment = .center
            self.view.addSubview(lblErrorMessage)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        cell.textLabel?.text = arrCountries[indexPath.row]
        return cell
    }


}
