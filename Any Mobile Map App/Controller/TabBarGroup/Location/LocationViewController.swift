//
//  LocationViewController.swift
//  Any Mobile Map App
//
//  Created by Jasur Salimov on 8/24/21.
//
import UIKit
import YandexMapsMobile
import CoreLocation
import BottomPopUpView
class LocationViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var mapView: YMKMapView!
    @IBOutlet weak var locationButtonOutlet: UIButton!  //
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var pinView: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchOutlet: UISearchBar! // search
    var searchManager: YMKSearchManager?
    var searchSession: YMKSearchSession?
    var bottomPopUpView: BottomPopUpView!
    //Initial declaration
    var TARGET_LOCATION = YMKPoint(latitude: 41.311150, longitude: 69.279743)
    //Core locatoin init
    var locManager = CLLocationManager()
    var currentUserLocation: CLLocation!
    //After loading
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        // pop up
        bottomPopUpView = BottomPopUpView(wrapperContentHeight: (self.view.frame.height - 90))
        bottomPopUpView.tableView.dataSource = self
        bottomPopUpView.tableView.delegate = self
        bottomPopUpView.tableView.separatorStyle = .singleLine
        bottomPopUpView.tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        //Nib registration
        let nib = UINib(nibName: "PopupTableViewCell", bundle: nil)
        bottomPopUpView.tableView.register(nib, forCellReuseIdentifier: "PopupTableViewCell")
        bottomPopUpView.tableView.register(UINib(nibName: "searchTableViewCell", bundle: nil), forCellReuseIdentifier: "searchTableViewCell")
        bottomPopUpView.tableView.sectionHeaderHeight = 72
        searchOutlet.delegate = self
        //
        mapView.mapWindow.map.move(
            with: YMKCameraPosition(target: TARGET_LOCATION, zoom: 17, azimuth: 0, tilt: 0),
            animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 5),
            cameraCallback: nil)
        //Selection method
        mapView.mapWindow.map.addTapListener(with: self)
        mapView.mapWindow.map.addInputListener(with: self)
        appearance()
        locManager.requestWhenInUseAuthorization()
        locManager.delegate = self
        locManager.requestLocation()
        // calling location method
    }
    //
 
    /* Present, very easy :) */
   

    
    
}

//MARK: - Map Selection
extension LocationViewController: YMKLayersGeoObjectTapListener, YMKMapInputListener{
    func onObjectTap(with: YMKGeoObjectTapEvent) -> Bool {
        let event = with
        let metadata = event.geoObject.metadataContainer.getItemOf(YMKGeoObjectSelectionMetadata.self)
        if let selectionMetadata = metadata as? YMKGeoObjectSelectionMetadata {
            mapView.mapWindow.map.selectGeoObject(withObjectId: selectionMetadata.id, layerId: selectionMetadata.layerId)
            return true
        }
        return false
    }
    
    func onMapTap(with map: YMKMap, point: YMKPoint) {
        mapView.mapWindow.map.deselectGeoObject()
    }
    func onMapLongTap(with map: YMKMap, point: YMKPoint) {
    }
    
}


//MARK: - Appearance methods
extension LocationViewController{
    func appearance(){
        
        let textFieldInsideSearchBar = searchOutlet.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.font = Constants.mainFont
        searchOutlet.searchTextField.layer.cornerRadius = 13
        searchOutlet.searchTextField.layer.masksToBounds = true
        searchView.layer.cornerRadius = 13
        //Search bar change button to voice pic and search Bar appearance changes
        let micImage = R.image.dictation()
        self.searchOutlet.setImage(micImage, for: .bookmark, state: .normal)
        //setting location image
        locationButtonOutlet.setImage(UIImage(named: "currentLocation"), for: .normal)
        //bring the search bar location image and pin to front
        mapView?.bringSubviewToFront(searchView)
        mapView?.bringSubviewToFront(locationView)
        mapView?.bringSubviewToFront(pinView)
        
    }
}
//MARK: - Location Button Pressed and location methods
extension LocationViewController: CLLocationManagerDelegate{
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        self.locManager.requestLocation()
        mapView.mapWindow.map.move(
            with: YMKCameraPosition(target: TARGET_LOCATION, zoom: 17, azimuth: 0, tilt: 0),
            animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 5),
            cameraCallback: nil)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Swift.Error) {
        print(error)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // .requestLocation will only pass one location to the locations array
        // hence we can access it by taking the first element of the array
        if let location = locations.first {
            TARGET_LOCATION = YMKPoint(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        }
    }
}

//MARK: - SearchTextFieldPressed
extension LocationViewController: UISearchBarDelegate, UITableViewDataSource{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if searchBar == self.searchOutlet {
            self.present(bottomPopUpView, animated: true, completion: nil)
            searchOutlet.resignFirstResponder()
        } else {
            print("HELOOOOOOOO")
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopupTableViewCell") as? PopupTableViewCell else { return UITableViewCell() }
         return cell
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchTableViewCell") as? searchTableViewCell else { return UIView() }
        cell.secondSearch.delegate = self
        cell.secondSearch.searchTextField.becomeFirstResponder()
        return cell.contentView
        
    }
}
