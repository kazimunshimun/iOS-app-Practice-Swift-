//
//  MessageViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 22/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var messageList: [Message] = []
    
    @IBOutlet weak var messageTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "messageCell")
        self.messageTableView.delegate = self
        self.messageTableView.dataSource = self
        
        loadMessages()
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    func loadMessages() {
        DispatchQueue.global(qos: .userInitiated).async {
            MessageData.shared.getMessages() { messages in
                DispatchQueue.main.async {
                    self.messageList = messages
                    self.messageTableView.reloadData()
                    
                    if messages.count > 0 {
                        let nextMessage = messages[0]
                        
                        if nextMessage.isRead {
                            self.view.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#241332")
                        } else {
                            self.view.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#8A56AC")
                        }
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellWidth : CGFloat = 100.0;
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageCell

        let message = messageList[indexPath.row]
        
        cell.profileImageView.image = UIImage(named: message.sender.imageName)
        cell.nameLabel.text = message.sender.name
        cell.titleLabel.text = message.title
        cell.timeAgoLabel.text = message.sentTimeAgo
        
        if message.isRead {
            cell.roundedCornerView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#241332")
            cell.unreadMessageView.isHidden = true
        } else {
            cell.roundedCornerView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#8A56AC")
            cell.unreadMessageView.isHidden = false
            cell.unreadMessageCountLabel.text = "\(message.unreadMessageCount)"
        }
        
        if indexPath.row + 1 < messageList.count {
            let nextMessage = messageList[indexPath.row + 1]
            
            if nextMessage.isRead {
                cell.contentView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#241332")
            } else {
                cell.contentView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#8A56AC")
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
