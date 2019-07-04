//
//  NotificationViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 22/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import ViewAnimator

class NotificationViewController: UIViewController, UITableViewDelegate {

    private let animations = [AnimationType.from(direction: .top, offset: 30.0)]

    let dataSource = NotificationDataSource()
    lazy var viewModel : NotificationViewModel = {
        let viewModel = NotificationViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    @IBOutlet weak var notificationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }
    
    func setupViews(){
        self.notificationTableView.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: "notificationCell")
        self.notificationTableView.delegate = self
        self.notificationTableView.dataSource = self.dataSource
        
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.notificationTableView.reloadData()
            if (self?.dataSource.data.value.count)! > 0 {
                let nextNotification = self?.dataSource.data.value[0]
                
                if nextNotification!.isRead {
                    self?.view.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#352641")
                } else {
                    self?.view.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#D47FA6")
                }
                UIView.animate(views: (self?.notificationTableView.visibleCells)!, animations: self!.animations, completion: nil)
            }
        }
        self.viewModel.fetchNotifiations()
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellWidth : CGFloat = 100.0;
        return cellWidth;
    }

}
