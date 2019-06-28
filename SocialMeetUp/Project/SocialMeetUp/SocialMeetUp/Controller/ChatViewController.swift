//
//  ChatViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 28/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    var topic: String!
    
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var chatTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        topicLabel.text = topic
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController!.popViewController(animated: true)
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
