//
//  AboutViewController.swift
//  Backpack
//
//  Created by Anik on 21/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var faqTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        faqTableView.delegate = self
        faqTableView.dataSource = self
        faqTableView.register(UINib(nibName: "FAQTableViewCell", bundle: nil), forCellReuseIdentifier: "faqCell")
        faqTableView.rowHeight = UITableView.automaticDimension
        faqTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell : UITableViewCell;
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "faqCell") as! FAQTableViewCell
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
