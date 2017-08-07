//
//  AboutVC.swift
//  Hegg
//
//  Created by Mamdouh El Nakeeb on 8/1/17.
//  Copyright © 2017 Mamdouh El Nakeeb. All rights reserved.
//

import UIKit
import GoogleMaps

class AboutVC: UIViewController {

    let lat = 21.4151678
    let lon = 39.8789227
    let campName = "شركة أهالى القصيم"
    let fbUrl = "https://www.facebook.com/peekssolutions/"
    let twtUrl = "https://twitter.com/peekssolutions"
    let siteUrl = "http://peekssolutions.com"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        let image = UIImage(named:"sideMenuIcon")?.withRenderingMode(.alwaysTemplate)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(SSASideMenu.presentRightMenuViewController))
        
       
        initDesc()
        initMap()
        initHeaderView()
        initSocialMedia()
        
    }

    func initMap(){
        
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
        
        mapView.frame = CGRect(x: 0, y: (self.view.frame.height * 2 / 3), width: self.view.frame.width, height: self.view.frame.height / 3)
        
        self.view.addSubview(mapView)
        
    }
    
    func initHeaderView(){
        let margin: CGFloat = 30
        let logoIV = UIImageView(image: UIImage(named: "logo_icon"))
        
        logoIV.frame = CGRect(x: self.view.frame.width - margin * 4, y: 30, width: 80, height: 80)
        
        let appNameLbl = UILabel(frame: CGRect(x: self.view.frame.width - margin * 4, y: 120, width: 80, height: 15))
        appNameLbl.text = "تطبيق الحج"
        appNameLbl.font = UIFont(name: "GE SS Two", size: 14)
        appNameLbl.textAlignment = .center
        appNameLbl.textColor = UIColor.white
        
        let line1 = UIView(frame: CGRect(x: margin , y: 150, width: self.view.frame.width - 2 * margin, height: 1))
        line1.backgroundColor = UIColor.white
        
        line1.alpha = 0.3
        
        let aboutUsLbl = UILabel(frame: CGRect(x: 0, y: 150, width: self.view.frame.width, height: 40))
        aboutUsLbl.text = "من نحن"
        aboutUsLbl.font = UIFont(name: "GE SS Two", size: 20)
        aboutUsLbl.textAlignment = .center
        aboutUsLbl.textColor = UIColor.white
        
        let line2 = UIView(frame: CGRect(x: margin , y: 190, width: self.view.frame.width - 2 * margin, height: 1))
        
        line2.backgroundColor = UIColor.white
        
        line2.alpha = 0.3
        
        
        self.view.addSubview(logoIV)
        self.view.addSubview(appNameLbl)
        self.view.addSubview(line1)
        self.view.addSubview(aboutUsLbl)
        self.view.addSubview(line2)
    }
    
    func initSocialMedia(){
        
        let smHeight: CGFloat = 40
        
        let viewSize = CGSize(width: self.view.frame.width / 3, height: smHeight)
        
        let greenV = UIView(frame: CGRect(x: 0, y: 210, width: self.view.frame.width, height: smHeight))
        greenV.backgroundColor = UIColor(red: 74/255, green: 174/255, blue: 106/255, alpha: 1)
        
        let fbVCenter = CGPoint(x: (self.view.frame.width / 6) - 10, y: 0)
        let fbBtnTitle = UILabel(frame: CGRect(origin: fbVCenter, size: viewSize))
        fbBtnTitle.textColor = UIColor.white
        fbBtnTitle.font = UIFont(name: fbBtnTitle.font.fontName, size: 14)
        fbBtnTitle.text = "Facebook"
        
        let fbIcon = UIImage(named: "twitter_icon")!.withRenderingMode(.alwaysTemplate)
        let fbBtnImg = UIImageView(image: fbIcon)
        
        fbBtnImg.tintColor = UIColor.white
        fbBtnImg.frame = CGRect(x: fbBtnTitle.frame.minX - 40, y: 0, width: 25, height: smHeight)
        fbBtnImg.contentMode = .scaleAspectFit
        
        
        let twtVCenter = CGPoint(x: (self.view.frame.width / 2) - 10, y: 0)
        
        let twtBtnTitle = UILabel(frame: CGRect(origin: twtVCenter, size: viewSize))
        twtBtnTitle.textColor = UIColor.white
        twtBtnTitle.font = UIFont(name: twtBtnTitle.font.fontName, size: 14)
        twtBtnTitle.text = "Twitter"
        
        let twtIcon = UIImage(named: "twitter_icon")!.withRenderingMode(.alwaysTemplate)
        let twtBtnImg = UIImageView(image: twtIcon)
        
        twtBtnImg.tintColor = UIColor.white
        twtBtnImg.frame = CGRect(x: twtBtnTitle.frame.minX - 40, y: 0, width: 25, height: smHeight)
        twtBtnImg.contentMode = .scaleAspectFit

        
        let siteVCenter = CGPoint(x: (self.view.frame.width / 6 * 5) - 10, y: 0)
        let siteBtnTitle = UILabel(frame: CGRect(origin: siteVCenter, size: viewSize))
        siteBtnTitle.textColor = UIColor.white
        siteBtnTitle.font = UIFont(name: siteBtnTitle.font.fontName, size: 14)
        siteBtnTitle.text = "Hegg.com"

        let siteIcon = UIImage(named: "siteIcon")!.withRenderingMode(.alwaysTemplate)
        let siteBtnImg = UIImageView(image: siteIcon)

        siteBtnImg.tintColor = UIColor.white
        siteBtnImg.frame = CGRect(x: siteBtnTitle.frame.minX - 40, y: 0, width: 25, height: smHeight)
        siteBtnImg.contentMode = .scaleAspectFit
        
        
        greenV.addSubview(fbBtnImg)
        greenV.addSubview(fbBtnTitle)
        greenV.addSubview(twtBtnImg)
        greenV.addSubview(twtBtnTitle)
        greenV.addSubview(siteBtnImg)
        greenV.addSubview(siteBtnTitle)
        
        self.view.addSubview(greenV)
        
    }
    
    func initDesc(){
        
        let whiteView = UIView(frame: CGRect(x: 0, y: 210, width: self.view.frame.width, height: self.view.frame.height - 210))
        whiteView.backgroundColor = UIColor.white
        
        let descLbl = UILabel(frame: CGRect(x: 20, y: 0, width: self.view.frame.width - 40, height: whiteView.frame.height - 250))
        
        descLbl.textColor = UIColor.lightGray
        descLbl.numberOfLines = 8
        descLbl.textAlignment = .center
        descLbl.font = UIFont(name: "GE SS Two", size: 15)
        descLbl.text = "تطبيق الحج لإرشاد الحجاج تطبيق الحج لإرشاد الحجاج تطبيق الحج لإرشاد الحجاج تطبيق الحج لإرشاد الحجاج تطبيق الحج لإرشاد الحجاج تطبيق الحج لإرشاد الحجاج تطبيق الحج لإرشاد الحجاج"

        whiteView.addSubview(descLbl)
        
        self.view.addSubview(whiteView)
    }
    
    
}



