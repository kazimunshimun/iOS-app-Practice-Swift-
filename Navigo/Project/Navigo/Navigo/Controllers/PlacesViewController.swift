//
//  PlacesViewController.swift
//  Navigo
//
//  Created by Anik on 12/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class PlacesViewController: UIViewController, SideMenuItemContent {

    @IBOutlet weak var tripTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tripTableView.register(UINib(nibName: "TripsCell", bundle: nil), forCellReuseIdentifier: "tripCell")
        self.tripTableView.delegate = self
        self.tripTableView.dataSource = self
    }
    
    @IBAction func menuButtonClicked(_ sender: Any) {
        showSideMenu()
    }

}

extension PlacesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath) as! TripsCell
        return cell
    }
}
