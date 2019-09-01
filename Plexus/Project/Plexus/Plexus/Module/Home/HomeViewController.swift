//
//  HomeViewController.swift
//  Plexus
//
//  Created Anik on 16/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HomeViewController: UIViewController, HomeViewProtocol {
    
    @IBOutlet weak var homeTableView: UITableView!
    var presenter: HomePresenterProtocol?
    private let networkManager: NetworkManager = NetworkManager()
    private var courseList: CourseRequest = CourseRequest(discover: [], mostViews: [])

	override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        HomeRouter.createModule(view: self)
        presenter?.viewDidLoad()
    }

    private func setupViews() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(UINib(nibName: "BannerCell", bundle: nil), forCellReuseIdentifier: "bannerCell")
        homeTableView.register(UINib(nibName: "MostViewedCell", bundle: nil), forCellReuseIdentifier: "mostViewedCell")
    }
    
    func showHomeCourses(with courses: CourseRequest) {
        self.courseList = courses
        self.homeTableView.reloadData()
    }
    
    func showError() {
        
    }
    
    func showLoading() {
        self.showWaitView(onView: self.view)
    }
    
    func hideLoading() {
        self.removeWaitView()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellWidth : CGFloat = 190.0;
        
        if indexPath.row == 0 {
            cellWidth = 276.0
        } else if indexPath.row == 1 {
            cellWidth = 90.0
        }
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseList.mostViews!.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "discoverTableCell", for: indexPath) as! DiscoverCell
            if courseList.discover!.count > 0 {
                cell.discoverList = courseList.discover!
                cell.discoverCollectionView.reloadData()
            }
            cell.layer.backgroundColor = UIColor.clear.cgColor
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "bannerCell", for: indexPath) as! BannerCell
            cell.layer.backgroundColor = UIColor.clear.cgColor
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "mostViewedCell", for: indexPath) as! MostViewedCell
            if courseList.mostViews!.count > 0 {
                let course = courseList.mostViews![indexPath.row - 2]
                cell.courseImageView.image = UIImage(named: course.imageName!)
                cell.detailLabel.text = course.description
            }
            if indexPath.row > 2 {
                cell.mostViewedLabelHeight.constant = 0
            }
            cell.layer.backgroundColor = UIColor.clear.cgColor
            return cell
        }
        
    }
}
