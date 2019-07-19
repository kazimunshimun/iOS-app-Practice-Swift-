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

class HomeViewController: UIViewController, SideMenuItemContent, UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDataSource, VisitPlaceDelegate, VisitNearByPlaceDelegate {
    
    enum ShowingPanel {
        case nearby
        case ride
        case onTrip
    }
    
    enum ShowingRide : Int {
        case car = 0
        case ride = 1
        case publicTrasport = 2
        case none = 3
    }
    
    enum RideCompany : Int {
        case taxi = 0
        case ridy = 1
        case autoM = 2
        case none = 3
    }
    
    fileprivate var currentPage: Int = 0 {
        didSet {
            print("current page set: \(self.currentPage)")
            if places.count > 0 {
                places[self.currentPage].isShowing = true
                placesMarker[self.currentPage].icon = UIImage(named: "resturent_marker")
                self.searchCollectionView.reloadData()
                if previousPage != -1 {
                    places[self.previousPage].isShowing = false
                    mapView.animate(to: GMSCameraPosition(latitude: places[self.currentPage].location.coordinate.latitude, longitude: places[self.currentPage].location.coordinate.longitude, zoom: 16.0))
                    //let marker = placesMarker[self.currentPage]
                    placesMarker[self.previousPage].icon = UIImage(named: "unselected_marker")
                }
                previousPage = self.currentPage
            }
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
    
    var places: [PlacesEntity] = []
    
    var placesMarker: [GMSMarker] = []

    var nowShowingPanel: ShowingPanel = .nearby
    var nowShowingRide: ShowingRide = .none
    var nowRideCompay: RideCompany = .none
    
    @IBOutlet weak var searchTextCrossButton: UIButton!
    @IBOutlet weak var searchResultView: UIView!
    @IBOutlet weak var searchCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var topView: RoundedViewWithShadow!
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var mapTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var rideShareMultiColorView: RoundedCornerView!
    @IBOutlet weak var rideShareView: UIView!
    @IBOutlet weak var rideShareHeightContraint: NSLayoutConstraint!
    
    //ride option
    @IBOutlet weak var carView: RoundedCornerView!
    @IBOutlet weak var rideView: RoundedCornerView!
    @IBOutlet weak var publicTrasportView: RoundedCornerView!
    //sharing option
    @IBOutlet weak var taxiView: RoundedCornerView!
    @IBOutlet weak var ridyView: RoundedCornerView!
    @IBOutlet weak var autoMView: RoundedCornerView!
    
    @IBOutlet weak var callButton: UIButton!
    
    lazy var panelManager = Panels(target: self)
    var panelConfiguration = PanelConfiguration(size: .fullScreen)
    var panel = UIStoryboard.instantiatePanel(identifier: "Nearby") as! Nearby
    var panelForRideChooser = UIStoryboard.instantiatePanel(identifier: "Home") as! RideChooser
    var panelConfigurationHalf = PanelConfiguration(size: .custom(332))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.currentPage = 0
        searchTextCrossButton.isHidden = true
        searchTextField.delegate = self
        setupPanelView()
        setupRideViewListener()
        //setupLayout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let camera = GMSCameraPosition.camera(withLatitude: 51.494379, longitude: -0.2103103, zoom: 14.0)
        mapView.camera = camera
    }
    
    fileprivate func setupLayout() {
        let layout = self.searchCollectionView.collectionViewLayout as! UPCarouselFlowLayout
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 200)
    }
    
    override func viewDidLayoutSubviews() {
        rideShareMultiColorView.topLeft = true
        rideShareMultiColorView.topRight = true
    }
    
    func setupRideViewListener() {
        let carGesture = UITapGestureRecognizer(target: self, action:  #selector(self.ownCarSelected))
        carView.addGestureRecognizer(carGesture)
        
        let rideGesture = UITapGestureRecognizer(target: self, action:  #selector(self.rideShareSelected))
        rideShareView.addGestureRecognizer(rideGesture)
        
        let tranportGesture = UITapGestureRecognizer(target: self, action:  #selector(self.publicTransportSelected))
        publicTrasportView.addGestureRecognizer(tranportGesture)
        
        
        let taxiGesture = UITapGestureRecognizer(target: self, action:  #selector(self.taxiSelected))
        taxiView.addGestureRecognizer(taxiGesture)
        
        let ridyGesture = UITapGestureRecognizer(target: self, action:  #selector(self.ridySelected))
        ridyView.addGestureRecognizer(ridyGesture)
        
        let autoMGesture = UITapGestureRecognizer(target: self, action:  #selector(self.autoMSelected))
        autoMView.addGestureRecognizer(autoMGesture)
    }
    
    @objc func ownCarSelected() {
        print("car selected")
        nowShowingRide = .car
        carView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "576276")
        updateRideOptionView()
        rideShareHeightContraint.constant = 172
    }
    
    @objc func rideShareSelected() {
        print("ride share selected")
        nowShowingRide = .ride
        rideView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "576276")
        updateRideOptionView()
        rideShareHeightContraint.constant = 404
        updateRideComapnyView()
    }
    
    @objc func publicTransportSelected() {
        print("public transport selected")
        nowShowingRide = .publicTrasport
        publicTrasportView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "576276")
        updateRideOptionView()
        rideShareHeightContraint.constant = 172
        //454F63
    }
    
    @objc func taxiSelected() {
        print("car selected")
        nowRideCompay = .taxi
        updateRideComapnyView()
        taxiView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "FFC400")
        callButton.backgroundColor = ColorUtils.hexStringToUIColor(hex: "FFC400")
        callButton.setTitle("CALL TAXI", for: .normal)
        //updateRideOptionView()
    }
    
    @objc func ridySelected() {
        print("ride share selected")
        nowRideCompay = .ridy
        updateRideComapnyView()
        ridyView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "D461EE")
        callButton.backgroundColor = ColorUtils.hexStringToUIColor(hex: "D461EE")
        callButton.setTitle("CALL RIDY", for: .normal)
        //updateRideOptionView()
    }
    
    @objc func autoMSelected() {
        print("public transport selected")
        nowRideCompay = .autoM
        updateRideComapnyView()
        autoMView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "00C3EE")
        callButton.backgroundColor = ColorUtils.hexStringToUIColor(hex: "00C3EE")
        callButton.setTitle("CALL AutoM", for: .normal)
        //updateRideOptionView()
    }
    
    func updateRideComapnyView() {
        let rideCompanyList = [taxiView, ridyView, autoMView]
        for ride in rideCompanyList {
            ride?.backgroundColor = ColorUtils.hexStringToUIColor(hex: "454B63")
        }
    }
    
    @IBAction func callButtonClicked(_ sender: Any) {
        
    }
    
    func updateRideOptionView() {
        var rideList = [carView, rideView, publicTrasportView]
        rideList.remove(at: nowShowingRide.rawValue)
        for ride in rideList {
            ride?.backgroundColor = ColorUtils.hexStringToUIColor(hex: "454B63")
        }
    }
    
    func setupPanelView() {
        panelConfiguration.enclosedNavigationBar = false
        panelManager.delegate = self
        panel.placeDelegate = self
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
        textField.resignFirstResponder()
        DispatchQueue.global(qos: .userInitiated).async {
            PlaceData.shared.getPlaces() { places in
                DispatchQueue.main.async {
                    self.places = places
                    self.searchResultView.isHidden = false
                    self.searchCollectionView.reloadData()
                    self.updateMapView()
                }
            }
        }
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
        detailViewController.placeDelegate = self
        self.present(detailViewController, animated: true, completion: nil)
        //self.show(detailViewController, sender: nil)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.searchCollectionView.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
    
    func goToPlace(place: PlacesEntity) {
        print("go there button clicked")
        //hide collection view of resturent
        searchResultView.isHidden = true
        //show only the place selected in map
        //show select ride option
        showRideChooserView()
    }
    
    func goToNearByPlace(place: PlacesEntity) {
        panelManager.dismiss()
        nowShowingPanel = .ride
        updateSearchView()
        print("go there button clicked")
        //show the place selected on map
        // show select ride option
        showRideChooserView()
    }
    
    func updateSearchView() {
        self.view.backgroundColor = .white
        topView.isHidden = false
        topView.showShadow()
    }
    
    func showRideChooserView(){
        rideShareView.isHidden = false
        rideShareHeightContraint.constant = 172
        /*
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            [weak self] in
            self?.panelManager.show(panel: self!.panelForRideChooser, config: self!.panelConfigurationHalf)
        }
 */
        
    }
}

extension HomeViewController: PanelNotifications {
    func panelDidPresented() {
        //print("Panel is presented")
        if self.nowShowingPanel == .nearby {
            panel.updateTopView(isBottom: false)
            updateSearchView()
        }
    }
    
    func panelDidCollapse() {
        //print("Panel did collapse")
        if self.nowShowingPanel == .nearby {
            panel.updateTopView(isBottom: false)
            updateSearchView()
            self.mapTopConstraint.constant = -44
        }
    }
    
    func panelDidOpen() {
        //print("Panel did open")
        if self.nowShowingPanel == .nearby {
            panel.updateTopView(isBottom: true)
            topView.isHidden = true
            topView.hideShadow()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                [weak self] in
                self?.view.backgroundColor = self?.panel.view.backgroundColor
                self?.mapTopConstraint.constant = 0
            }
        }
    }
}
