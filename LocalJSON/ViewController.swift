//
//  ViewController.swift
//  LocalJSON
//
//  Created by Belal medhat on 8/7/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CountryTable.delegate = self
        CountryTable.dataSource = self
    }

    @IBOutlet weak var CountryTable: UITableView!
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CountryLoader.shared.returnCountries().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CountryTable.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        cell.CountryName.text = CountryLoader.shared.returnCountries()[indexPath.item].country
        return cell
    }
    
    
}
