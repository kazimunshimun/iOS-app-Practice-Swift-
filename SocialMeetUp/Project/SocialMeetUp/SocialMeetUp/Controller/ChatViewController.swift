//
//  ChatViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 28/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var topic: String!
    var hostedBy: People!
    var messageList: [Chat] = []
    
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var chatTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        topicLabel.text = topic
        
        self.chatTableView.delegate = self
        self.chatTableView.dataSource = self
        //self.chatTableView.register(ChatMessageViewCell.self, forCellReuseIdentifier: "ChatMessageViewCell")
        self.chatTableView.register(UINib(nibName: "IncomingChatCell", bundle: nil), forCellReuseIdentifier: "incomingCell")
        //incomingCell
        self.chatTableView.rowHeight = UITableView.automaticDimension
        self.chatTableView.estimatedRowHeight = 600
        
        loadChatMessages()
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    func loadChatMessages() {
        DispatchQueue.global(qos: .userInitiated).async {
            let count = 20
            ChatData.shared.getChats(count: count, senderName: self.hostedBy.name) { messages in
                DispatchQueue.main.async {
                    self.messageList = messages
                    self.chatTableView.reloadData()
                    self.scrollToBottom()
                }
            }
        }
    }
    
    func scrollToBottom(){
        let indexPath = IndexPath(row: self.messageList.count - 1, section: 0)
        self.chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messageList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatMessageViewCell", for: indexPath) as! ChatMessageViewCell
        
        var message = messageList[indexPath.row]
        
        if indexPath.row + 1 < messageList.count {
            let nextMessage = messageList[indexPath.row + 1]
            if nextMessage.profile.id == message.profile.id {
               // message.isShoulShowSenderImage = false
            }
        }
        
        cell.chatMessage = message
        cell.userImageView.image = UIImage(named: message.profile.imageName)
        
        cell.messageLabel.text = message.text
        */
        let message = messageList[indexPath.row]
        if message.isIncoming {
            let cell = tableView.dequeueReusableCell(withIdentifier: "incomingCell", for: indexPath) as! IncomingChatCell
            cell.chatTextCell.text = message.text
            cell.senderImageView.image = UIImage(named: message.profile.imageName)
            cell.senderNameLabel.text = message.profile.name
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "outgoingCell2", for: indexPath) as! OutgoingChat2Cell
            cell.chatTextCell.text = message.text
            cell.senderImageView.image = UIImage(named: message.profile.imageName)
            cell.senderNameLabel.text = message.profile.name
            return cell
        }
        //outgoingCell2
        
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
