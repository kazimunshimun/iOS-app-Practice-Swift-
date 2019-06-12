//
//  ChatViewController.swift
//  Backpack
//
//  Created by Anik on 30/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource/*UICollectionViewDelegate, UICollectionViewDataSource*/ {
    @IBOutlet weak var senderNameLabel: UILabel!
   // @IBOutlet weak var chatCollectionView: UICollectionView!
    
    @IBOutlet weak var chatTableView: UITableView!
    // var userName : String = ""
    
    var chatData: Chat?
    
    var messageList: [Message] = []
    
    @IBOutlet weak var userNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userNameLabel.text = chatData?.name
        
       // self.chatCollectionView.dataSource = self
       // self.chatCollectionView.delegate = self
       // self.chatCollectionView.register(TextMessageCell.self, forCellWithReuseIdentifier: "TextMessageCell")
        
        self.chatTableView.delegate = self
        self.chatTableView.dataSource = self
        self.chatTableView.register(ChatMessageViewCell.self, forCellReuseIdentifier: "ChatMessageViewCell")
        loadMessages()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    func loadMessages() {
        DispatchQueue.global(qos: .userInitiated).async {
            let count = 20
            MessageData.shared.getMessages(count: count, senderName: self.chatData!.name) { messages in
                DispatchQueue.main.async {
                    self.messageList = messages
                    self.chatTableView.reloadData()
                    self.scrollToBottom()
                    /*
                    self.chatCollectionView.reloadData()
                    //self.chatCollectionView.scrollToBottom()
                    let collectionViewContentHeight = self.chatCollectionView.contentSize.height
                    self.chatCollectionView.scrollRectToVisible(CGRect(x: 0.0, y: collectionViewContentHeight - 1.0, width: 1.0, height: 1.0), animated: true)
 */
                }
            }
        }
    }
    
    //MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messageList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatMessageViewCell", for: indexPath) as! ChatMessageViewCell
    
        let message = messageList[indexPath.row]
        cell.chatMessage = message
        cell.userImageView.image = UIImage(named: message.user.imageName)
        
        switch message.kind {
        case .text(let text):
            cell.messageLabel.text = text
            
        default:
            break
        }
        return cell
    }
    
    func scrollToBottom(){
        let indexPath = IndexPath(row: self.messageList.count - 1, section: 0)
        self.chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    /*
    // MARK: - CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let message = messageList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextMessageCell", for: indexPath) as! TextMessageCell
        cell.chatMessage = message
        cell.cellTopLabel.text = message.sentDate
        cell.userImageView.image = UIImage(named: message.user.imageName)
        switch message.kind {
        case .text(let text):
            cell.messageLabel.text = text
            
        default:
            break
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.messageList.count
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let flowLayout = self.chatCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: self.chatCollectionView.bounds.width, height: 120)
        }
    }
 */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
