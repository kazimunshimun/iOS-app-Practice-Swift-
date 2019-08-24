//
//  SettingsViewController.swift
//  Write
//
//  Created by Anik on 24/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationView()
    }
    
    private func setupNavigationView() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = .clear
            headerView.backgroundView?.backgroundColor = .black
            headerView.textLabel?.textColor = UIColor(white: 1.0, alpha: 0.5)
            headerView.textLabel?.font = UIFont(name: "HelveticaNeue-Regular", size: 13)
        }
    }

}
