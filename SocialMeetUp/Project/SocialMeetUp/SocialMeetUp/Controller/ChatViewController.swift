//
//  ChatViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 28/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate {

    var topic: String!
    var hostedBy: People!
    
    let dataSource = ChatDataSource()
    lazy var viewModel : ChatViewModel = {
        let viewModel = ChatViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var chatTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }
    
    func setupViews() {
        topicLabel.text = topic
        
        self.chatTableView.delegate = self
        self.chatTableView.dataSource = self.dataSource
        self.chatTableView.register(UINib(nibName: "IncomingChatCell", bundle: nil), forCellReuseIdentifier: "incomingCell")
        self.chatTableView.rowHeight = UITableView.automaticDimension
        self.chatTableView.estimatedRowHeight = 600
        
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.chatTableView.reloadData()
            self?.scrollToBottom()
        }
        self.viewModel.fetchChats(count: 20, hostedBy: hostedBy.name)
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    func scrollToBottom(){
        if self.dataSource.data.value.count > 0 {
            let indexPath = IndexPath(row: self.dataSource.data.value.count - 1, section: 0)
            self.chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}
