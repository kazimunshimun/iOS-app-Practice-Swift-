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
    
    @IBOutlet weak var rideShareViewHeightConstraint: NSLayoutConstraint!
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
    
    var selectedPlace: PlacesEntity?
    
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
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }

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
        rideView.addGestureRecognizer(rideGesture)
        
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
        callButton.setTitle("START", for: .normal)
        callButton.isEnabled = true
        callButton.backgroundColor = ColorUtils.hexStringToUIColor(hex: "576276")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1) {
            UIView.animate(withDuration: 0.25, animations: {
                self.rideShareHeightContraint.constant = 248
                self.rideShareViewHeightConstraint.constant = 0
                self.view.layoutIfNeeded()
            })
        }
        
        mapView.clear()
        showPlaceInMap(place: selectedPlace!)
        showProfileAvatarInMap()
        focusUserOnMap()
        
        showDirectionBetweenTwoLocation(source: userLocation, destination: (selectedPlace?.location.coordinate)!)
    }
    
    @objc func rideShareSelected() {
        print("ride share selected")
        nowShowingRide = .ride
        rideView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "576276")
        updateRideOptionView()
        
        callButton.backgroundColor = ColorUtils.hexStringToUIColor(hex: "576276")
        callButton.isEnabled = false
        updateRideComapnyView()
        focusUserOnMap()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1) {
            UIView.animate(withDuration: 0.25, animations: {
                self.rideShareHeightContraint.constant = 404
                self.rideShareViewHeightConstraint.constant = 156
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc func publicTransportSelected() {
        print("public transport selected")
        nowShowingRide = .publicTrasport
        publicTrasportView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "576276")
        updateRideOptionView()
        callButton.setTitle("START", for: .normal)
        callButton.isEnabled = true
        callButton.backgroundColor = ColorUtils.hexStringToUIColor(hex: "576276")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1) {
            UIView.animate(withDuration: 0.25, animations: {
                self.rideShareHeightContraint.constant = 248
                self.rideShareViewHeightConstraint.constant = 0
                self.view.layoutIfNeeded()
            })
        }
        mapView.clear()
        showPlaceInMap(place: selectedPlace!)
        showProfileAvatarInMap()
        focusUserOnMap()
    }
    
    let userLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 51.4876549, longitude: -0.2217534)
    
    func focusUserOnMap() {
        //51.4876549, -0.2217534
        mapView.animate(to: GMSCameraPosition(latitude: userLocation.latitude, longitude: userLocation.longitude, zoom: 16.0))
    }
    
    @objc func taxiSelected() {
        print("car selected")
        nowRideCompay = .taxi
        updateRideComapnyView()
        taxiView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "FFC400")
        callButton.backgroundColor = ColorUtils.hexStringToUIColor(hex: "FFC400")
        callButton.setTitle("CALL TAXI", for: .normal)
        callButton.isEnabled = true
        //show taxis
        mapView.clear()
        showPlaceInMap(place: selectedPlace!)
        showProfileAvatarInMap()
        showTaxisAround()
        focusUserOnMap()
        //updateRideOptionView()
    }
    
    func showTaxisAround() {
        
        let car1 = addMarkerToMap(title: "taxi", snippet: "", location: CLLocationCoordinate2D(latitude: 51.484253, longitude: -0.219813), markerImageName: "taxi_icon")
        let car2 = addMarkerToMap(title: "taxi", snippet: "", location: CLLocationCoordinate2D(latitude: 51.484487, longitude: -0.222559), markerImageName: "taxi_icon")
        let car3 = addMarkerToMap(title: "taxi", snippet: "", location: CLLocationCoordinate2D(latitude: 51.488449, longitude: -0.222736), markerImageName: "taxi_icon")
        car2.rotation = CLLocationDegrees(exactly: -25)!
        car1.map = mapView
        car2.map = mapView
        car3.map = mapView
        
    }
    
    @objc func ridySelected() {
        print("ride share selected")
        nowRideCompay = .ridy
        updateRideComapnyView()
        ridyView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "D461EE")
        callButton.backgroundColor = ColorUtils.hexStringToUIColor(hex: "D461EE")
        callButton.setTitle("CALL RIDY", for: .normal)
        callButton.isEnabled = true
        //show ridy cars
        mapView.clear()
        showPlaceInMap(place: selectedPlace!)
        showProfileAvatarInMap()
        showRidysAround()
        focusUserOnMap()
        //updateRideOptionView()
    }
    
    func showRidysAround() {
        let car1 = addMarkerToMap(title: "ridy", snippet: "", location: CLLocationCoordinate2D(latitude: 51.486378, longitude: -0.224088), markerImageName: "ridy_icon")
        let car2 = addMarkerToMap(title: "ridy", snippet: "", location: CLLocationCoordinate2D(latitude: 51.488195, longitude: -0.220730), markerImageName: "ridy_icon")
        let car3 = addMarkerToMap(title: "ridy", snippet: "", location: CLLocationCoordinate2D(latitude: 51.486866, longitude: -0.218005), markerImageName: "ridy_icon")
        car1.rotation = CLLocationDegrees(exactly: -25)!
        car2.rotation = CLLocationDegrees(exactly: 65)!
        car3.rotation = CLLocationDegrees(exactly: -20)!
        car1.map = mapView
        car2.map = mapView
        car3.map = mapView
    }
    
    @objc func autoMSelected() {
        print("public transport selected")
        nowRideCompay = .autoM
        updateRideComapnyView()
        autoMView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "00C3EE")
        callButton.backgroundColor = ColorUtils.hexStringToUIColor(hex: "00C3EE")
        callButton.setTitle("CALL AutoM", for: .normal)
        callButton.isEnabled = true
        //show autoM cars
        mapView.clear()
        showPlaceInMap(place: selectedPlace!)
        showProfileAvatarInMap()
        showAutoMsAround()
        focusUserOnMap()
        //updateRideOptionView()
    }
    
    func showAutoMsAround() {
        let car1 = addMarkerToMap(title: "autoM", snippet: "", location: CLLocationCoordinate2D(latitude: 51.488823, longitude: -0.218788), markerImageName: "autoM_icon")
        let car2 = addMarkerToMap(title: "autoM", snippet: "", location: CLLocationCoordinate2D(latitude: 51.487006, longitude: -0.218160), markerImageName: "autoM_icon")
        let car3 = addMarkerToMap(title: "autoM", snippet: "", location: CLLocationCoordinate2D(latitude: 51.486899, longitude: -0.221175), markerImageName: "autoM_icon")
        
        car1.rotation = CLLocationDegrees(exactly: -25)!
        car2.rotation = CLLocationDegrees(exactly: 65)!
        car3.rotation = CLLocationDegrees(exactly: -30)!
        
        car1.map = mapView
        car2.map = mapView
        car3.map = mapView
    }
    
    func updateRideComapnyView() {
        let rideCompanyList = [taxiView, ridyView, autoMView]
        for ride in rideCompanyList {
            ride?.backgroundColor = ColorUtils.hexStringToUIColor(hex: "454B63")
        }
    }
    
    @IBAction func callButtonClicked(_ sender: Any) {
        print("call button clicked. \(nowShowingRide.rawValue)")
        if nowShowingRide == .ride {
            print("ride selected \(nowRideCompay.rawValue)")
        }
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
        if nowShowingPanel == .nearby {
            panelManager.dismiss()
        } else if nowShowingPanel == .ride {
            rideShareView.isHidden = true
        }
        
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
                let marker = addMarkerToMap(title: place.name, snippet: "", location: CLLocationCoordinate2D(latitude: place.location.coordinate.latitude, longitude: place.location.coordinate.longitude), markerImageName: "unselected_marker")
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
        //hide/disable search bar textfield
        //show only the place selected in map
        selectedPlace = place
        showPlaceInMap(place: place)
        //show profile avatar
        showProfileAvatarInMap()
        //show select ride option
        nowShowingPanel = .ride
        showRideChooserView()
    }
    
    func goToNearByPlace(place: PlacesEntity) {
        panelManager.dismiss()
        nowShowingPanel = .ride
        selectedPlace = place
        updateSearchView()
        print("go there button clicked")
        //hide/disable search bar textfield
        //show the place selected on map
        showPlaceInMap(place: place)
        //show profile avatar
        showProfileAvatarInMap()
        // show select ride option
        showRideChooserView()
    }
    
    func showPlaceInMap(place: PlacesEntity) {
        mapView.clear()
        let camera = GMSCameraPosition.camera(withLatitude: place.location.coordinate.latitude, longitude: place.location.coordinate.longitude, zoom: 16.0)
        mapView.camera = camera
        let marker = addMarkerToMap(title: place.name, snippet: "", location: CLLocationCoordinate2D(latitude: place.location.coordinate.latitude, longitude: place.location.coordinate.longitude), markerImageName: "resturent_marker")
        marker.map = mapView
    }
    
    func showProfileAvatarInMap() {
        let marker = addMarkerToMap(title: "You", snippet: "", location: CLLocationCoordinate2D(latitude: 51.4876549, longitude: -0.2217534), markerImageName: "avatar_icon")
        marker.map = mapView
    }
    
    func updateSearchView() {
        self.view.backgroundColor = .white
        topView.isHidden = false
        topView.showShadow()
    }
    
    func showRideChooserView(){
        self.mapTopConstraint.constant = -44
        rideShareView.isHidden = false
        self.rideShareHeightContraint.constant = 0
        self.rideShareViewHeightConstraint.constant = 0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1) {
            UIView.animate(withDuration: 0.25, animations: {
                self.rideShareHeightContraint.constant = 248
                self.rideShareViewHeightConstraint.constant = 0
                self.view.layoutIfNeeded()
            })
        }
        //rideShareHeightContraint.constant = 172
        /*
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            [weak self] in
            self?.panelManager.show(panel: self!.panelForRideChooser, config: self!.panelConfigurationHalf)
        }
 */
        
    }
    
    func addMarkerToMap(title: String, snippet: String, location: CLLocationCoordinate2D, markerImageName: String) -> GMSMarker {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        marker.title = title
        marker.snippet = snippet
        marker.icon = UIImage(named: markerImageName)
        return marker
    }
    
    func showDirectionBetweenTwoLocation(source: CLLocationCoordinate2D, destination: CLLocationCoordinate2D) {
        let session = URLSession.shared
        
        let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=\(source.latitude),\(source.longitude)&destination=\(destination.latitude),\(destination.longitude)&sensor=false&mode=driving&key=AIzaSyA-2M_CQqkeHa0LC-Y6P5GgcJNlvXbY7H8")!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let jsonResult = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] else {
                print("error in JSONSerialization")
                return
            }
            
            let jsonResponse = jsonResult
            
            guard let routes = jsonResponse["routes"] as? [Any] else {
                return
            }
            
            if routes.count > 0 {
                guard let route = routes[0] as? [String: Any] else {
                    return
                }
                
                guard let overview_polyline = route["overview_polyline"] as? [String: Any] else {
                    return
                }
                
                guard let polyLineString = overview_polyline["points"] as? String else {
                    return
                }
                
                //Call this method to draw path on map
                self.drawPath(with: polyLineString)
            }
            
        })
        task.resume()
    }
    
    private func drawPath(with points : String){
        
        DispatchQueue.main.async {
            
            let path = GMSPath(fromEncodedPath: points)
            let polyline = GMSPolyline(path: path)
            polyline.strokeWidth = 3.0
            polyline.strokeColor = .red
            polyline.map = self.mapView
            
        }
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
