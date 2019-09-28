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
    @IBOutlet weak var ampmLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var dashboardTableView: UITableView!
    
    var applianceData: [Appliance] = []
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setuViews()
        getDashboardData()
    }

    private func setuViews() {
        dashboardTableView.delegate = self
        dashboardTableView.dataSource = self
        //register cell
        dashboardTableView.register(UINib(nibName: "ModeCell", bundle: nil), forCellReuseIdentifier: "modeCell")
        dashboardTableView.register(UINib(nibName: "BillCell", bundle: nil), forCellReuseIdentifier: "billCell")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timer.invalidate()
        updateTime()
        // start the timer
        timer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    @objc func updateTime() {
        partOfDayLabel.text = "Good \(TimeUtils.getTimeOfTheDay())"
        let hourAnMinute = TimeUtils.getHourAndMinute()
        var hour = hourAnMinute.0
        if hourAnMinute.0 >= 12 {
            ampmLabel.text = "PM"
            hour = hour - 12
        } else {
            ampmLabel.text = "AM"
        }
        timeLabel.text = String(format: "%02d : %02d", hour, hourAnMinute.1)
    }
    
    private func getDashboardData() {
        let dataManager: DataManager = DataManager()
        do {
            applianceData = try dataManager.fetchAppliances()
            print("appliance count: \(applianceData.count)")
            if applianceData.count == 0 {
                //need to insert data for first time
                let inputData = InputData()
                inputData.insertApplianceData()
                applianceData = try dataManager.fetchAppliances()
                print("appliance count: \(applianceData.count)")
            }
            dashboardTableView.reloadData()
        } catch {
            print("data fetch error")
        }
        
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        if indexPath.row == 0 {
            //mode
            let cell = tableView.dequeueReusableCell(withIdentifier: "modeCell", for: indexPath) as! ModeCell
            cell.selectedBackgroundView = backgroundView
            cell.backgroundColor = .clear
            return cell
        } else if (indexPath.row == 1) {
            //appliance
            let cell = tableView.dequeueReusableCell(withIdentifier: "applianceCell", for: indexPath) as! ApplianceCell
            cell.applianceDelegate = self
            if applianceData.count > 0 {
                cell.items = applianceData
            }
            cell.selectedBackgroundView = backgroundView
            cell.backgroundColor = .clear
            return cell
        } else {
            //bill
            let cell = tableView.dequeueReusableCell(withIdentifier: "billCell", for: indexPath) as! BillCell
            cell.selectedBackgroundView = backgroundView
            cell.backgroundColor = .clear
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            //mode
            return 246.0
        } else if (indexPath.row == 1) {
            //appliance
            return 191.0
        } else {
            //bill
            return 206.0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Usage", bundle: nil)
        if indexPath.row == 0 {
            //mode
            print("mode")
            let timerViewController = storyBoard.instantiateViewController(withIdentifier: "timerView")
            self.show(timerViewController, sender: nil)
        } else if (indexPath.row == 2) {
            //bill
            print("bill")
            let usageViewController = storyBoard.instantiateViewController(withIdentifier: "usageView")
            self.show(usageViewController, sender: nil)
        }
    }
}

extension DashboardViewController: ApplianceSelectedDelegate {
    
    func seeAllSelected() {
        print("see all selected")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Appliance", bundle: nil)
        let applianceViewController = storyBoard.instantiateViewController(withIdentifier: "applianceView") as! ApplianceViewController
        applianceViewController.applianceData = applianceData
        self.show(applianceViewController, sender: nil)
    }
    
    func applianceSelected(appliance: Appliance) {
        //print("appliance selected wiht name: \(appliance.name)")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Controls", bundle: nil)
        if appliance.name == "Air Conditioner" {
            let acViewController = storyBoard.instantiateViewController(withIdentifier: "acView") as! ACControlViewController
            acViewController.appliance = appliance
            self.show(acViewController, sender: nil)
        } else if appliance.name == "Smart Light" || appliance.name == "LED Bulb"{
            let lightViewController = storyBoard.instantiateViewController(withIdentifier: "lightView") as! LightControlViewController
            lightViewController.appliance = appliance
            self.show(lightViewController, sender: nil)
        }
    }
}

