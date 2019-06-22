//
//  FeedWithTableViewController.swift
//  SocialMeetUp
//
//  Created by Anik on 22/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class FeedWithTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var feedTableView: UITableView!
    
    var menuItem: Menu?
    
    var feedList: [Feed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.feedTableView.delegate = self
        self.feedTableView.dataSource = self
        self.feedTableView.register(UINib(nibName: "FeedCell", bundle: nil), forCellReuseIdentifier: "feedCell")
        loadFeeds(feedType: FeedType(rawValue: menuItem!.name)!)
        self.feedTableView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#9599B3")
        self.view.backgroundColor = menuItem?.menuSelectedColor
    }
    
    func loadFeeds(feedType: FeedType) {
        DispatchQueue.global(qos: .userInitiated).async {
            FeedData.shared.getFeeds(type: feedType) { feeds in
                DispatchQueue.main.async {
                    self.feedList = feeds
                    self.feedTableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellWidth : CGFloat = 190.0;
        return cellWidth;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedCell
        
        let feed = feedList[indexPath.row]
        // Configure the cell...
        if indexPath.row + 1 < feedList.count {
            let nextFeed = feedList[indexPath.row + 1]
            cell.contentView.backgroundColor = nextFeed.feedColor
            //cell.backgroundColor = nextFeed.feedColor
        }
        
        if indexPath.row == feedList.count - 1 {
            cell.contentView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#9599B3")
        }
        cell.timeDateLabel.text = "\(feed.timeDate.dayOfWeek) \(feed.timeDate.fromTime)"
        cell.titleLabel.text = feed.title
        cell.roundedBackgroundView.backgroundColor = feed.feedColor
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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
