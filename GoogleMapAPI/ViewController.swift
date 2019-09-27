//
//  ViewController.swift
//  GoogleMapAPI
//
//  Created by 윤동민 on 25/09/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit
import GoogleMaps

extension NSNotification.Name {
    static let clickProfile = NSNotification.Name(rawValue: "clickProfile")
    static let clickSetting = NSNotification.Name(rawValue: "clickSetting")
    static let clickLogout = NSNotification.Name(rawValue: "clickLogout")
}

class ViewController: UIViewController {
    var mapView: GMSMapView?
    var locationManager: CLLocationManager = CLLocationManager()
    
    override func loadView() {
        setMapInitial()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
        addinitialObserver()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let location = locationManager.location else { return }
        moveCurrent(location)
    }
    
    private func setMapInitial() {
        var camera: GMSCameraPosition
        if let location = locationManager.location {
            camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 16)
        } else {
            camera = GMSCameraPosition.camera(withLatitude: LocationInfo.ajouUnivLatitude, longitude: LocationInfo.ajouUnivLongitude, zoom: 16)
        }
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.view = mapView
        mapView?.isMyLocationEnabled = true
        mapView?.settings.myLocationButton = true
    }
    
    private func configureNavigationBar() {
        self.navigationController?.navigationBar.tintColor = .darkGray
        navigationItem.title = "H&M"
    }
    
    private func addinitialObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeToProfileSceen), name: .clickProfile, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeToSettingSceen), name: .clickSetting, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeToLogoutSceen), name: .clickLogout, object: nil)
    }

    private func moveCurrent(_ location: CLLocation) {
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 16)
        mapView?.camera = camera
    }
    
    @IBAction func openSideBar(_ sender: Any) {
        NotificationCenter.default.post(name: .touchSideBar, object: nil)
    }
    
    @objc func changeToProfileSceen() {
    
    }
    
    @objc func changeToSettingSceen() {
        
    }
    
    @objc func changeToLogoutSceen() {
        
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
}
