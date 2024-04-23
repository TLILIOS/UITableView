//
//  CitysViewController.swift
//  UITableViewSectionsHD&FT
//
//  Created by HTLILI on 22/04/2024.
//

import UIKit

class CitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrCities = [UIImage(named: "img_riyadh")!,UIImage(named: "img_dubai")!,UIImage(named: "img_cairo")!,UIImage(named: "img_amman")! ]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as! CitiesTableViewCell
        cell.imgCityPhoto.image = arrCities[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let photo = arrCities[indexPath.row]
        let photoWidthRation = photo.size.width / photo.size.height
        return tableView.frame.width / photoWidthRation
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
       
    }
  
}
