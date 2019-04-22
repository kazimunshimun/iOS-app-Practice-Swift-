//
//  MessagingViewController.swift
//  Backpack
//
//  Created by Anik on 21/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class MessagingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let chatPeoples: [Chat] = [Chat(id: "0", name: "Alex", lastMessage: "Hey when are you going?", lastMessageTime: "9:45AM", isActive: true, imageName: "alex_pp"),
                               Chat(id: "0", name: "Sandra", lastMessage: "I would love to take this trip with", lastMessageTime: "9:45AM", isActive: false, imageName: "sandra_pp"),
                               Chat(id: "0", name: "Lisa", lastMessage: "Sure, lets do it.", lastMessageTime: "9:45AM", isActive: false, imageName: "lisa_pp"),
                               Chat(id: "0", name: "Mike", lastMessage: "Yes, it was an amazing experience", lastMessageTime: "9:45AM", isActive: false, imageName: "mike_pp"),
                               Chat(id: "0", name: "Jennifer", lastMessage: "Loved it out there.", lastMessageTime: "9:45AM", isActive: false, imageName: "jennifer_pp"),
                               Chat(id: "0", name: "Travis", lastMessage: "Can't wait to do it again", lastMessageTime: "9:45AM", isActive: false, imageName: "travis_pp"),
    ]
    
    @IBOutlet weak var chatsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chatsTableView.delegate = self
        chatsTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatPeoples.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatData = chatPeoples[indexPath.row]
        let cell = chatsTableView.dequeueReusableCell(withIdentifier: "chatCell") as! ChatTableViewCell
        cell.userNameLabel.text = chatData.name
        cell.lastMessageLabel.text = chatData.lastMessage
        cell.lastMessageTimeLabel.text = chatData.lastMessageTime
        cell.userImageView.image = UIImage(named: chatData.imageName)
        
        if chatData.isActive {
            cell.isActiveView.isHidden = false
            cell.lastMessageLabel.textColor = UIColor.black
        } else {
            cell.isActiveView.isHidden = true
            cell.lastMessageLabel.textColor = UIColor(red: 159.0 / 255.0, green: 159.0 / 255.0, blue: 159.0 / 255.0, alpha: 1.0)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Messaging", bundle: nil)
        let chatViewController = storyBoard.instantiateViewController(withIdentifier: "chatView") as! ChatViewController
        chatViewController.userName = "User name \(indexPath.row)"
        self.show(chatViewController, sender: nil)
       // self.performSegue(withIdentifier: "showChatView", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
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
