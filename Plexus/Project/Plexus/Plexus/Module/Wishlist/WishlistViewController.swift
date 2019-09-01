//
//  WishlistViewController.swift
//  Plexus
//
//  Created Anik on 19/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class WishlistViewController: UIViewController, WishlistViewProtocol {
    @IBOutlet weak var wishlistTableView: UITableView!
    var presenter: WishlistPresenterProtocol?
    private var wishlist: [WishlistRequest] = []

	override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        WishlistRouter.createModule(view: self)
        presenter?.viewDidLoad()
    }

    private func setupViews() {
        wishlistTableView.delegate = self
        wishlistTableView.dataSource = self
        wishlistTableView.register(UINib(nibName: "WishlistCell", bundle: nil), forCellReuseIdentifier: "wishlistCell")
    }
    
    func showWishlistCourses(with courses: [WishlistRequest]) {
        self.wishlist = courses
        self.animateTable()
    }
    
    func showError() {
        
    }
    
    func showLoading() {
        self.showWaitView(onView: self.view)
    }
    
    func hideLoading() {
        self.removeWaitView()
    }
    
    func animateTable() {
        self.wishlistTableView.reloadData()
        
        let cells = wishlistTableView.visibleCells
        let tableHeight: CGFloat = wishlistTableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            
            index += 1
        }
    }
}

extension WishlistViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellWidth : CGFloat = 166.0;
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wishlistCell", for: indexPath) as! WishlistCell
        cell.layer.backgroundColor = UIColor.clear.cgColor
        if wishlist.count > 0 {
            let course = wishlist[indexPath.row]
            cell.detailLabel.text = course.description
            cell.ratingView.rating = Double(course.rating!)
            cell.courseImageView.image = UIImage(named: course.imageName!)
        }
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }
}
