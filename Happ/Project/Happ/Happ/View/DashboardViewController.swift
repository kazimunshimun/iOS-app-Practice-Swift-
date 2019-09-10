//
//  ViewController.swift
//  Happ
//
//  Created by Anik on 9/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var partOfDayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var dashboardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setuViews()
    }

    private func setuViews() {
        dashboardTableView.delegate = self
        dashboardTableView.dataSource = self
        //register cell
        dashboardTableView.register(UINib(nibName: "ModeCell", bundle: nil), forCellReuseIdentifier: "modeCell")
        dashboardTableView.register(UINib(nibName: "BillCell", bundle: nil), forCellReuseIdentifier: "billCell")
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            //mode
            let cell = tableView.dequeueReusableCell(withIdentifier: "modeCell", for: indexPath) as! ModeCell
            return cell
        } else if (indexPath.row == 1) {
            //appliance
            let cell = tableView.dequeueReusableCell(withIdentifier: "applianceCell", for: indexPath) as! ApplianceCell
            return cell
        } else {
            //bill
            let cell = tableView.dequeueReusableCell(withIdentifier: "billCell", for: indexPath) as! BillCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            //mode
            return 216.0
        } else if (indexPath.row == 1) {
            //appliance
            return 191.0
        } else {
            //bill
            return 186.0
        }
    }
}

