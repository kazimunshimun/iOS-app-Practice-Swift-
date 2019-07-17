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
import CoreLocation
import GoogleMaps

class HomeViewController: UIViewController, SideMenuItemContent, UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    fileprivate var currentPage: Int = 0 {
        didSet {
            print("current page set: \(self.currentPage)")
            places[self.currentPage].isShowing = true
            self.searchCollectionView.reloadData()
            if previousPage != -1 {
                places[self.previousPage].isShowing = false
                mapView.animate(to: GMSCameraPosition(latitude: places[self.currentPage].location.coordinate.latitude, longitude: places[self.currentPage].location.coordinate.longitude, zoom: 16.0))
                //let marker = placesMarker[self.currentPage]
                placesMarker[self.currentPage].icon = UIImage(named: "resturent_marker")
                placesMarker[self.previousPage].icon = UIImage(named: "unselected_marker")
                /*
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: places[self.currentPage].location.coordinate.latitude, longitude: places[self.currentPage].location.coordinate.longitude)
                marker.title = places[self.currentPage].name
                marker.snippet = places[self.currentPage].name
                marker.icon = UIImage(named: "resturent_marker")
                marker.map = mapView
 */
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
    
    var placesMarker: [GMSMarker] = []

    var places: [PlacesEntity] = [PlacesEntity(categoryID: 0, placeID: 1, name: "Sushi Place", imageName: "sushi_place_1", distance: 2.2, rating: 4.5, isShowing: false, location: CLLocation(latitude: 51.4976549, longitude: -0.2117534)), PlacesEntity(categoryID: 0, placeID: 2, name: "Nom Nom", imageName: "sushi_place_2", distance: 1.2, rating: 4.0, isShowing: false, location: CLLocation(latitude: 51.4970644, longitude: -0.2126093)), PlacesEntity(categoryID: 0, placeID: 3, name: "Palace", imageName: "sushi_place_3", distance: 4.2, rating: 4.3, isShowing: false, location: CLLocation(latitude: 51.4962299, longitude: -0.2106902)),
                                  PlacesEntity(categoryID: 0, placeID: 1, name: "Pho Montreal", imageName: "soup_place_1", distance: 2.2, rating: 4.5, isShowing: false, location: CLLocation(latitude: 51.4958147, longitude: -0.2086598)), PlacesEntity(categoryID: 0, placeID: 2, name: "Rigolati", imageName: "soup_place_2", distance: 1.2, rating: 4.0, isShowing: false, location: CLLocation(latitude: 51.4971387, longitude: -0.2130881)), PlacesEntity(categoryID: 0, placeID: 3, name: "Dae Jang Geum", imageName: "soup_place_3", distance: 4.2, rating: 4.3, isShowing: false, location: CLLocation(latitude: 51.4960969, longitude: -0.2087144)),
                                  PlacesEntity(categoryID: 0, placeID: 1, name: "Time Out", imageName: "burger_place_1", distance: 2.2, rating: 4.5, isShowing: false, location: CLLocation(latitude: 51.4979636, longitude: -0.2074568)), PlacesEntity(categoryID: 0, placeID: 2, name: "Tree House", imageName: "burger_place_2", distance: 1.2, rating: 4.0, isShowing: false, location: CLLocation(latitude: 51.4948706, longitude: -0.211411)), PlacesEntity(categoryID: 0, placeID: 3, name: "Cozy Sizzler", imageName: "burger_place_3", distance: 4.2, rating: 4.3, isShowing: false, location: CLLocation(latitude: 51.494379, longitude: -0.2103103))]

    
    @IBOutlet weak var searchTextCrossButton: UIButton!
    @IBOutlet weak var searchResultView: UIView!
    @IBOutlet weak var searchCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var topView: RoundedViewWithShadow!
    
    @IBOutlet weak var mapView: GMSMapView!
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
        updateMapView()
        return true
    }
    
    func updateMapView() {
        if places.count > 0 {
            let firstPlace = places[0]
            let camera = GMSCameraPosition.camera(withLatitude: firstPlace.location.coordinate.latitude, longitude: firstPlace.location.coordinate.longitude, zoom: 16.0)
            mapView.camera = camera
            for place in places {
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: place.location.coordinate.latitude, longitude: place.location.coordinate.longitude)
                marker.title = place.name
                marker.snippet = place.name
                marker.icon = UIImage(named: "unselected_marker")
                marker.map = mapView
                placesMarker.append(marker)
            }
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "places", for: indexPath) as! PlacesCell
        let place = places[indexPath.row]
        cell.imageView.image = UIImage(named: place.imageName)
        cell.nameLabel.text = place.name
        cell.infoLabel.text = "\(place.distance)mi, \(place.rating) stars"
        
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
        let place = places[indexPath.row]
        detailViewController.place = place
        self.present(detailViewController, animated: true, completion: nil)
        //self.show(detailViewController, sender: nil)
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
