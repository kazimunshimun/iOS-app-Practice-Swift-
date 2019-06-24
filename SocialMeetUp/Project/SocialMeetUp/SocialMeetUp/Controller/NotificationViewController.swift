//
//  NotificationViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 22/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var notificationTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.notificationTableView.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: "notificationCell")
        self.notificationTableView.delegate = self
        self.notificationTableView.dataSource = self
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellWidth : CGFloat = 100.0;
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as! NotificationCell
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
