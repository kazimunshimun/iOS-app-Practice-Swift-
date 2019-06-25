//
//  NotificationViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 22/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var notifications: [Notifiation] = []
    
    @IBOutlet weak var notificationTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.notificationTableView.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: "notificationCell")
        self.notificationTableView.delegate = self
        self.notificationTableView.dataSource = self
        
        loadNotification()
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    func loadNotification() {
        DispatchQueue.global(qos: .userInitiated).async {
            NotificationData.shared.getNotifications() { notifi in
                DispatchQueue.main.async {
                    self.notifications = notifi
                    self.notificationTableView.reloadData()
                    
                    if notifi.count > 0 {
                        let nextNotification = notifi[0]
                        
                        if nextNotification.isRead {
                            self.view.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#352641")
                        } else {
                            self.view.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#D47FA6")
                        }
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notifications.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellWidth : CGFloat = 100.0;
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as! NotificationCell
        let notification = notifications[indexPath.row]
        cell.titleLabel.text = notification.title
        cell.profileImageView.image = UIImage(named: notification.sender.imageName)
        cell.timeAgoLabel.text = notification.sentTimeAgo
        
        if notification.isRead {
            cell.roundedCornerView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#352641")
        } else {
            cell.roundedCornerView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#D47FA6")
        }
        
        if indexPath.row + 1 < notifications.count {
            let nextNotification = notifications[indexPath.row + 1]
            
            if nextNotification.isRead {
                cell.contentView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#352641")
            } else {
                cell.contentView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#D47FA6")
            }
        }
        
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
