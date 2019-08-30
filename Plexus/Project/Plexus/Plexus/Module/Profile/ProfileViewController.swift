//
//  ProfileViewController.swift
//  Plexus
//
//  Created Anik on 19/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ProfileViewController: UIViewController, ProfileViewProtocol {

    //http://www.mocky.io/v2/5d68cf3b3300002700b68664
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var profileCoursesTableview: UITableView!
    var presenter: ProfilePresenterProtocol?

    private let networkManager: NetworkManager = NetworkManager()
    private var profile: ProfileRequest = ProfileRequest(profileId: 0, name: "", detail: "", profileImage: "", completedCourses: [], topRated: [])
    
	override func viewDidLoad() {
        super.viewDidLoad()
        resetViewTransform()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       // setupViews()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        resetViewTransform()
    }
    
    private func setupViews() {
        profileCoursesTableview.delegate = self
        profileCoursesTableview.dataSource = self
        self.showWaitView(onView: self.view)
        networkManager.getProfileRequest(completion: { (profileResponse) in
            self.removeWaitView()
            self.profile = profileResponse!
            self.profilePictureImageView.image = UIImage(named: self.profile.profileImage!)
            self.profileCoursesTableview.reloadData()
            self.animateProfileImageView()
        })
    }
    
    private func animateProfileImageView() {
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.profilePictureImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.profilePictureImageView.alpha = 1
        }, completion: nil )
    }
    
    func resetViewTransform() {
        self.profilePictureImageView.alpha = 0
        self.profilePictureImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellWidth : CGFloat = 179.0;
        if indexPath.row == 1 {
            cellWidth = 198.0
        }
        return cellWidth;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "topRatedParentCell", for: indexPath) as! TopRatedParentCell
            if self.profile.topRated!.count > 0 {
                cell.topRatedList = self.profile.topRated!
                cell.topRatedCollectionView.reloadData()
            }
            cell.layer.backgroundColor = UIColor.clear.cgColor
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "completedParentCell", for: indexPath) as! CompletedParentCell
            if self.profile.topRated!.count > 0 {
                cell.completedList = self.profile.completedCourses!
                cell.completedCollectionView.reloadData()
            }
            cell.layer.backgroundColor = UIColor.clear.cgColor
            return cell
        }
        
    }
}
