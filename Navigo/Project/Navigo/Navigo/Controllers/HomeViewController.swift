//
//  HomeViewController.swift
//  Navigo
//
//  Created by Anik on 12/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import Panels
import UPCarouselFlowLayout

class HomeViewController: UIViewController, SideMenuItemContent, UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    fileprivate var currentPage: Int = 0 {
        didSet {
            print("current page set: \(self.currentPage)")
            places[self.currentPage].isShowing = true
            self.searchCollectionView.reloadData()
            if previousPage != -1 {
                places[self.previousPage].isShowing = false
            }
            previousPage = self.currentPage
        }
    }
    
    var previousPage: Int = -1;
    
    fileprivate var pageSize: CGSize {
        let layout = self.searchCollectionView.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    var places: [PlacesEntity] = [PlacesEntity(categoryID: 0, placeID: 1, name: "Sushi Place", imageName: "sushi_place_1", distance: 2.2, rating: 4.5, isShowing: false), PlacesEntity(categoryID: 0, placeID: 2, name: "Nom Nom", imageName: "sushi_place_2", distance: 1.2, rating: 4.0, isShowing: false), PlacesEntity(categoryID: 0, placeID: 3, name: "Palace", imageName: "sushi_place_3", distance: 4.2, rating: 4.3, isShowing: false),
                                  PlacesEntity(categoryID: 0, placeID: 1, name: "Pho Montreal", imageName: "soup_place_1", distance: 2.2, rating: 4.5, isShowing: false), PlacesEntity(categoryID: 0, placeID: 2, name: "Rigolati", imageName: "soup_place_2", distance: 1.2, rating: 4.0, isShowing: false), PlacesEntity(categoryID: 0, placeID: 3, name: "Dae Jang Geum", imageName: "soup_place_3", distance: 4.2, rating: 4.3, isShowing: false),
                                  PlacesEntity(categoryID: 0, placeID: 1, name: "Time Out", imageName: "burger_place_1", distance: 2.2, rating: 4.5, isShowing: false), PlacesEntity(categoryID: 0, placeID: 2, name: "Tree House", imageName: "burger_place_2", distance: 1.2, rating: 4.0, isShowing: false), PlacesEntity(categoryID: 0, placeID: 3, name: "Cozy Sizzler", imageName: "burger_place_3", distance: 4.2, rating: 4.3, isShowing: false)]

    
    @IBOutlet weak var searchTextCrossButton: UIButton!
    @IBOutlet weak var searchResultView: UIView!
    @IBOutlet weak var searchCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var topView: RoundedViewWithShadow!
    
    lazy var panelManager = Panels(target: self)
    var panelConfiguration = PanelConfiguration(size: .fullScreen)
    var panel = UIStoryboard.instantiatePanel(identifier: "Nearby") as! Nearby
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.currentPage = 0
        searchTextCrossButton.isHidden = true
        searchTextField.delegate = self
        setupPanelView()
        //setupLayout()
    }
    
    fileprivate func setupLayout() {
        let layout = self.searchCollectionView.collectionViewLayout as! UPCarouselFlowLayout
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 200)
    }
    
    func setupPanelView() {
        panelConfiguration.enclosedNavigationBar = false
        panelManager.delegate = self
        panelManager.show(panel: panel, config: panelConfiguration)
    }

    @IBAction func menuButtonClicked(_ sender: Any) {
        showSideMenu()
    }
    
    @IBAction func searchDeleteButtonClicked(_ sender: Any) {
        searchTextCrossButton.isHidden = true
        searchTextField.text = ""
        searchResultView.isHidden = true
        panelManager.show(panel: panel, config: panelConfiguration)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        panelManager.dismiss()
        searchTextCrossButton.isHidden = false
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchResultView.isHidden = false
        textField.resignFirstResponder()
        return true
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "places", for: indexPath) as! PlacesCell
        cell.imageView.image = UIImage(named: places[indexPath.row].imageName)
        cell.nameLabel.text = places[indexPath.row].name
        cell.infoLabel.text = "\(places[indexPath.row].distance)mi, \(places[indexPath.row].rating) stars"
        
        /*
        if cell.isSelected {
         
        } else {
            cell.infoView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#353A50")
        }
        */
        print("cell for row current page: \(self.currentPage) and index path: \(indexPath.row)")
        if places[indexPath.row].isShowing {
            cell.infoView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#3ACCE1")
        } else {
            cell.infoView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#353A50")
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collection view item selected")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Nearby", bundle: nil)
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "placeDetailView") as! PlaceDetailViewController
        self.show(detailViewController, sender: nil)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.searchCollectionView.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
}

extension HomeViewController: PanelNotifications {
    func panelDidPresented() {
        //print("Panel is presented")
        panel.updateTopView(isBottom: false)
        self.view.backgroundColor = .white
        topView.isHidden = false
        topView.showShadow()
    }
    
    func panelDidCollapse() {
        //print("Panel did collapse")
        panel.updateTopView(isBottom: false)
        self.view.backgroundColor = .white
        topView.isHidden = false
        topView.showShadow()
    }
    
    func panelDidOpen() {
        //print("Panel did open")
        panel.updateTopView(isBottom: true)
        topView.isHidden = true
        topView.hideShadow()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            [weak self] in
            self?.view.backgroundColor = self?.panel.view.backgroundColor
        }
        
    }
}
