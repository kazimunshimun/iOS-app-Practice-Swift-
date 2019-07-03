//
//  FeedWithTableViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 22/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class FeedWithTableViewController: UIViewController, UITableViewDelegate/*, UITableViewDataSource*/{

    @IBOutlet weak var feedTableView: UITableView!
    
    var menuItem: Menu?
    
    let dataSource = FeedDataSource()
    lazy var viewModel : FeedViewModel = {
        let viewModel = FeedViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    func setupViews() {
        self.feedTableView.register(UINib(nibName: "FeedCell", bundle: nil), forCellReuseIdentifier: "feedCell")
        self.feedTableView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#9599B3")
        self.view.backgroundColor = menuItem?.menuSelectedColor
        
        self.feedTableView.dataSource = self.dataSource
        self.feedTableView.delegate = self
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.feedTableView.reloadData()
        }
        self.viewModel.fetchFeeds(feedType: FeedType(rawValue: menuItem!.name)!)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("feed detail request view clicked")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let feedDetailViewController = storyBoard.instantiateViewController(withIdentifier: "feedDetailView") as! FeedDetailViewController
        feedDetailViewController.feed = self.dataSource.data.value[indexPath.row]
        show(feedDetailViewController, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellWidth : CGFloat = 190.0;
        return cellWidth;
    }

}
