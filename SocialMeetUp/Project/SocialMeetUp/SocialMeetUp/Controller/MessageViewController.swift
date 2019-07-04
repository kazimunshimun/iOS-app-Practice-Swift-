//
//  MessageViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 22/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import ViewAnimator

class MessageViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var messageTableView: UITableView!
    private let animations = [AnimationType.from(direction: .top, offset: 30.0)]
    
    let dataSource = MessageDataSource()
    lazy var viewModel : MessageViewModel = {
        let viewModel = MessageViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }
    
    func setupViews() {
        self.messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "messageCell")
        self.messageTableView.delegate = self
        self.messageTableView.dataSource = self.dataSource
        
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.messageTableView.reloadData()
            if (self?.dataSource.data.value.count)! > 0 {
                let nextMessage = self?.dataSource.data.value[0]
                
                if nextMessage!.isRead {
                    self?.view.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#241332")
                } else {
                    self?.view.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#8A56AC")
                }
            }
            UIView.animate(views: (self?.messageTableView.visibleCells)!, animations: self!.animations, completion: nil)
            
        }
        self.viewModel.fetchMessages()
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellWidth : CGFloat = 100.0;
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("feed detail request view clicked")
        let message = self.dataSource.data.value[indexPath.row]
        let storyBoard: UIStoryboard = UIStoryboard(name: "Messaging", bundle: nil)
        let chatViewController = storyBoard.instantiateViewController(withIdentifier: "chatView") as! ChatViewController
        chatViewController.topic = message.title
        chatViewController.hostedBy = message.sender
        self.show(chatViewController, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
