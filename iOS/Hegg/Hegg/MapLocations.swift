//
//  MapLocations.swift
//  Hegg
//
//  Created by Mamdouh El Nakeeb on 7/28/17.
//  Copyright © 2017 Mamdouh El Nakeeb. All rights reserved.
//

import UIKit
import GoogleMaps

class MapLocations: UIViewController {
    
    let lat = 21.4151678
    let lon = 39.8789227
    let campName = "مخيم شركة"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lon, zoom: 18.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.settings.compassButton = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        let markerIcon = UIImage(named: "markerIcon")!.withRenderingMode(.alwaysTemplate)
        let markerIconView = UIImageView(image: markerIcon)
        markerIconView.tintColor = UIColor(red: 74/255, green: 174/255, blue: 106/255, alpha: 1)
        markerIconView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        marker.iconView = markerIconView
        
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        marker.title = campName
        marker.map = mapView
        
        mapView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        self.view.addSubview(mapView)
        
        let image = UIImage(named:"sideMenuIcon")?.withRenderingMode(.alwaysTemplate)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(SSASideMenu.presentRightMenuViewController))

        self.navigationItem.leftBarButtonItem?.title = "رجوع"
        
        let labelTitle = UILabel()
        labelTitle.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        labelTitle.text = "مواقع الحملة"
        labelTitle.font = UIFont(name: "GE SS Two", size: 17)
        self.navigationItem.titleView = labelTitle

    }


}
