//
//  ViewController.swift
//  HoroscopeApp
//
//  Created by Mañanas on 13/6/25.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var horoscopeList = Horoscope.horoscopeList

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HoroscopeCell", for: indexPath) as! HoroscopeViewCell
        cell.render(horoscope: horoscopeList[indexPath.row])
        return cell
    }
}

