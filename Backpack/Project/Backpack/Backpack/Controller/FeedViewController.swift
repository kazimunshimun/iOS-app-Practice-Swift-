//
//  FeedViewController.swift
//  Backpack
//
//  Created by Anik on 21/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var feedTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        feedTableView.delegate = self
        feedTableView.dataSource = self
        
        feedTableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "feedCell")
        feedTableView.register(UINib(nibName: "PopularDestinationTableViewCell", bundle: nil), forCellReuseIdentifier: "popularDestinationCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellWidth : CGFloat = 420.0;
        if indexPath.row == 1 {
            cellWidth = 260.0
        }
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell;
        
        if indexPath.row == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "popularDestinationCell") as! PopularDestinationTableViewCell
        } else{
            cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as! FeedTableViewCell
        }
        
        //cell.userNameLabel.text = "User name \(indexPath.row)"
        return cell;
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
