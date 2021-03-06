//
//  ViewController.swift
//  Hegg
//
//  Created by Mamdouh El Nakeeb on 7/28/17.
//  Copyright © 2017 Mamdouh El Nakeeb. All rights reserved.
//

import UIKit
import Alamofire
import Firebase

class LandingVC: UIViewController, UIGestureRecognizerDelegate {

    var viewPager = ViewPager()
    var view1 = UIView()
    var view2 = UIView()
    
    var aboutVBtn = UIButton()
    var newsVBtn = UIButton()
    var timelineVBtn = UIButton()
    var mapVBtn = UIButton()
    var mapVBtn2 = UIButton()
    var fatawyVBtn = UIButton()
    var galleryVBtn = UIButton()
    var videosVBtn = UIButton()
    
    
    var guideVBtn = UIButton()
    var chairVBtn = UIButton()
    var tayehVBtn = UIButton()
    var fatwaReqVBtn = UIButton()
    var competitionsVBtn = UIButton()
    var contactVBtn = UIButton()
    
    var userIDTF = String()
    
    let viewDim: CGFloat = 100
    let viewMargin: CGFloat = 24
   
    let userUrl = "http://hegg.nakeeb.me/API/qassem/insertUser.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let token = Messaging.messaging().fcmToken
        print("FCM token: \(token ?? "")")
        
        Messaging.messaging().subscribe(toTopic: "news")
        print("Subscribed to news topic")
        
        let bgImg = UIImageView(image: UIImage(named: "landing_bg"))
        bgImg.contentMode = .scaleAspectFill
        bgImg.frame = self.view.frame
        
        self.view.addSubview(bgImg)
        
        let image = UIImage(named:"sideMenuIcon")?.withRenderingMode(.alwaysTemplate)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(SSASideMenu.presentRightMenuViewController))
        
        initViews()
        initView2()
        initViewPager()
        
        /*
        if !UserDefaults.standard.bool(forKey: "logged"){
            joinUser()
        }
        */
        
        let labelTitle = UILabel()
        labelTitle.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        labelTitle.text = "مرحباً بك"
        labelTitle.font = UIFont(name: "GE SS Two", size: 17)
        self.navigationItem.titleView = labelTitle
        
        
        let whiteNB = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 64))
        whiteNB.backgroundColor = UIColor.white
        self.view.addSubview(whiteNB)
        
        let greenV = UILabel(frame: CGRect(x: 0, y: whiteNB.frame.maxY, width: self.view.frame.width, height: 44))
        greenV.backgroundColor = UIColor.primaryColor()
        greenV.textAlignment = .center
        greenV.font = UIFont(name: "GE SS Two", size: 17)
        greenV.textColor = UIColor.white
        greenV.text = "أهالي القصيم لحجاج الداخل"
        
        self.view.addSubview(greenV)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewPager.scrollToPage(index: 0)
    }
    
    func initViewPager(){
        
        viewPager.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        viewPager.dataSource = self;
        //viewPager.animationNext()
        
        self.view.addSubview(viewPager)
    }
    
    func joinUser(){
        
        let alert = UIAlertController(title: "مرحباً بك", message: "أدخل الرقم التعريفى الخاص بك", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "User ID"
            textField.keyboardType = .numberPad
        }
        
        alert.addAction(UIAlertAction(title: "إدخال", style: UIAlertActionStyle.default, handler: {
            (action: UIAlertAction) -> Void in
            
            self.userIDTF = alert.textFields![0].text!
            print(self.userIDTF)
            let userDefaults = UserDefaults.standard
            userDefaults.set(self.userIDTF, forKey: "userID")
            userDefaults.set(true, forKey: "logged")
            userDefaults.synchronize()
            
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func initViews(){
        
        let menuV = UIView(frame: CGRect(x: 0, y: 108, width: self.view.frame.width, height: self.view.frame.height - 108))
        
        mapVBtn.frame = CGRect(x: (menuV.frame.width / 2) + viewMargin, y: (menuV.frame.height / 2) - (viewMargin * 3 / 2) - (viewDim * 2), width: viewDim, height: viewDim)
        
        let mapLocationsIcon = UIImageView(image: UIImage(named: "markerIcon")?.withRenderingMode(.alwaysTemplate))
        mapLocationsIcon.tintColor = UIColor.white
        mapLocationsIcon.frame = CGRect(x: 0, y: 10, width: mapVBtn.frame.width, height: 50)
        mapLocationsIcon.contentMode = .scaleAspectFit
        
        let mapLocationsLbl = UILabel(frame: CGRect(x: 0, y: mapLocationsIcon.frame.maxY + 10, width: mapVBtn.frame.width, height: 20))
        mapLocationsLbl.font = UIFont(name: "GE SS Two", size: 12)
        mapLocationsLbl.textColor = UIColor.secondryColor()
        mapLocationsLbl.textAlignment = .center
        mapLocationsLbl.text = "مواقعنا بالمشاعر"
        mapLocationsLbl.dropShadow2()
        
        mapVBtn.addSubview(mapLocationsIcon)
        mapVBtn.addSubview(mapLocationsLbl)
        
        mapVBtn2.frame = CGRect(x: (menuV.frame.width / 2) - viewDim - viewMargin, y: mapVBtn.frame.minY, width: viewDim, height: viewDim)
        
        let mapLocationsIcon2 = UIImageView(image: UIImage(named: "mapIcon")?.withRenderingMode(.alwaysTemplate))
        mapLocationsIcon2.tintColor = UIColor.white
        mapLocationsIcon2.frame = CGRect(x: 0, y: 10, width: mapVBtn2.frame.width, height: 50)
        mapLocationsIcon2.contentMode = .scaleAspectFit
        
        let mapLocationsLbl2 = UILabel(frame: CGRect(x: 0, y: mapLocationsIcon2.frame.maxY + 10, width: mapVBtn2.frame.width, height: 20))
        mapLocationsLbl2.font = UIFont(name: "GE SS Two", size: 12)
        mapLocationsLbl2.textColor = UIColor.secondryColor()
        mapLocationsLbl2.textAlignment = .center
        mapLocationsLbl2.text = "أماكن التجمع"
        mapLocationsLbl2.dropShadow2()
        
        mapVBtn2.addSubview(mapLocationsIcon2)
        mapVBtn2.addSubview(mapLocationsLbl2)
        
        
        timelineVBtn.frame = CGRect(x: (menuV.frame.width / 2) + viewMargin, y: (menuV.frame.height / 2) - (viewMargin / 2) - viewDim, width: viewDim, height: viewDim)
        
        let timelineIcon = UIImageView(image: UIImage(named: "timelineIcon")?.withRenderingMode(.alwaysTemplate))
        timelineIcon.tintColor = UIColor.white
        timelineIcon.frame = CGRect(x: 0, y: 10, width: timelineVBtn.frame.width, height: 50)
        timelineIcon.contentMode = .scaleAspectFit
        
        let timelineLbl = UILabel(frame: CGRect(x: 0, y: timelineIcon.frame.maxY + 10, width: timelineVBtn.frame.width, height: 20))
        timelineLbl.font = UIFont(name: "GE SS Two", size: 17)
        timelineLbl.textColor = UIColor.secondryColor()
        timelineLbl.textAlignment = .center
        timelineLbl.text = "الجدول"
        timelineLbl.dropShadow2()
        
        timelineVBtn.addSubview(timelineIcon)
        timelineVBtn.addSubview(timelineLbl)
        
        fatawyVBtn.frame = CGRect(x: (menuV.frame.width / 2) - viewDim -  viewMargin, y: timelineVBtn.frame.minY, width: viewDim, height: viewDim)
        
        let fatawyIcon = UIImageView(image: UIImage(named: "fatwasIcon")?.withRenderingMode(.alwaysTemplate))
        fatawyIcon.tintColor = UIColor.white
        fatawyIcon.frame = CGRect(x: 0, y: 10, width: fatawyVBtn.frame.width, height: 50)
        fatawyIcon.contentMode = .scaleAspectFit
        
        let fatawyLbl = UILabel(frame: CGRect(x: 0, y: fatawyIcon.frame.maxY + 10, width: fatawyVBtn.frame.width, height: 20))
        fatawyLbl.font = UIFont(name: "GE SS Two", size: 17)
        fatawyLbl.textColor = UIColor.secondryColor()
        fatawyLbl.textAlignment = .center
        fatawyLbl.text = "الفتاوى"
        fatawyLbl.dropShadow2()
        
        fatawyVBtn.addSubview(fatawyIcon)
        fatawyVBtn.addSubview(fatawyLbl)
        

        
        galleryVBtn.frame = CGRect(x: (menuV.frame.width / 2) - viewDim - viewMargin, y: (menuV.frame.height / 2) + (viewMargin / 2), width: viewDim, height: viewDim)
        
        let galleryIcon = UIImageView(image: UIImage(named: "galleryIcon")?.withRenderingMode(.alwaysTemplate))
        galleryIcon.tintColor = UIColor.white
        galleryIcon.frame = CGRect(x: 0, y: 10, width: galleryVBtn.frame.width, height: 50)
        galleryIcon.contentMode = .scaleAspectFit
        
        let galleryLbl = UILabel(frame: CGRect(x: 0, y: galleryIcon.frame.maxY + 10, width: galleryVBtn.frame.width, height: 20))
        galleryLbl.font = UIFont(name: "GE SS Two", size: 17)
        galleryLbl.textColor = UIColor.secondryColor()
        galleryLbl.textAlignment = .center
        galleryLbl.text = "صور"
        galleryLbl.dropShadow2()
        
        galleryVBtn.addSubview(galleryIcon)
        galleryVBtn.addSubview(galleryLbl)
        
        videosVBtn.frame = CGRect(x: (menuV.frame.width / 2) + viewMargin, y: galleryVBtn.frame.minY, width: viewDim, height: viewDim)

        let videosIcon = UIImageView(image: UIImage(named: "videosIcon")?.withRenderingMode(.alwaysTemplate))
        videosIcon.tintColor = UIColor.white
        videosIcon.frame = CGRect(x: 0, y: 10, width: videosVBtn.frame.width, height: 50)
        videosIcon.contentMode = .scaleAspectFit
        
        let videosLbl = UILabel(frame: CGRect(x: 0, y: videosIcon.frame.maxY + 10, width: videosVBtn.frame.width, height: 20))
        videosLbl.font = UIFont(name: "GE SS Two", size: 17)
        videosLbl.textColor = UIColor.secondryColor()
        videosLbl.textAlignment = .center
        videosLbl.text = "فيديوهات"
        videosLbl.dropShadow2()
        
        videosVBtn.addSubview(videosIcon)
        videosVBtn.addSubview(videosLbl)
        
        aboutVBtn.frame = CGRect(x: (menuV.frame.width / 2) - viewDim - viewMargin, y: (menuV.frame.height / 2) + (viewMargin * 3 / 2) + viewDim, width: viewDim, height: viewDim)
        let aboutIcon = UIImageView(image: UIImage(named: "aboutIcon")?.withRenderingMode(.alwaysTemplate))
        aboutIcon.tintColor = UIColor.white
        aboutIcon.frame = CGRect(x: 0, y: 10, width: aboutVBtn.frame.width, height: 50)
        aboutIcon.contentMode = .scaleAspectFit
        
        let aboutLbl = UILabel(frame: CGRect(x: 0, y: aboutIcon.frame.maxY + 10, width: aboutVBtn.frame.width, height: 20))
        aboutLbl.font = UIFont(name: "GE SS Two", size: 16)
        aboutLbl.textColor = UIColor.secondryColor()
        aboutLbl.textAlignment = .center
        aboutLbl.text = "عن الشركة"
        aboutLbl.dropShadow2()
        
        aboutVBtn.addSubview(aboutIcon)
        aboutVBtn.addSubview(aboutLbl)
        
        newsVBtn.frame = CGRect(x: (menuV.frame.width / 2) + viewMargin, y: aboutVBtn.frame.minY, width: viewDim, height: viewDim)
        
        let newsIcon = UIImageView(image: UIImage(named: "newsIcon")?.withRenderingMode(.alwaysTemplate))
        newsIcon.tintColor = UIColor.white
        newsIcon.frame = CGRect(x: 0, y: 10, width: newsVBtn.frame.width, height: 50)
        newsIcon.contentMode = .scaleAspectFit
        
        let newsLbl = UILabel(frame: CGRect(x: 0, y: newsIcon.frame.maxY + 10, width: newsVBtn.frame.width, height: 20))
        newsLbl.font = UIFont(name: "GE SS Two", size: 16)
        newsLbl.textColor = UIColor.secondryColor()
        newsLbl.textAlignment = .center
        newsLbl.text = "الأخبار"
        newsLbl.dropShadow2()
        
        newsVBtn.addSubview(newsIcon)
        newsVBtn.addSubview(newsLbl)
        
        let color = UIColor.white
        aboutVBtn.addBorder(view: aboutVBtn, stroke: color, fill: UIColor.clear, radius: 0, width: 3)
        newsVBtn.addBorder(view: newsVBtn, stroke: color, fill: UIColor.clear, radius: 0, width: 3)
        timelineVBtn.addBorder(view: timelineVBtn, stroke: color, fill: UIColor.clear, radius: 0, width: 3)
        mapVBtn.addBorder(view: mapVBtn, stroke: color, fill: UIColor.clear, radius: 0, width: 3)
        mapVBtn2.addBorder(view: mapVBtn2, stroke: color, fill: UIColor.clear, radius: 0, width: 3)
        fatawyVBtn.addBorder(view: fatawyVBtn, stroke: color, fill: UIColor.clear, radius: 0, width: 3)
        galleryVBtn.addBorder(view: galleryVBtn, stroke: color, fill: UIColor.clear, radius: 0, width: 3)
        videosVBtn.addBorder(view: videosVBtn, stroke: color, fill: UIColor.clear, radius: 0, width: 3)
        
        
        let aboutBtnTap = UITapGestureRecognizer(target: self, action: #selector(openAbout))
        aboutBtnTap.delegate = self
        aboutVBtn.addGestureRecognizer(aboutBtnTap)
        
        
        let newsBtnTap = UITapGestureRecognizer(target: self, action: #selector(openNews))
        newsBtnTap.delegate = self
        newsVBtn.addGestureRecognizer(newsBtnTap)
        
        let timelineBtnTap = UITapGestureRecognizer(target: self, action: #selector(openTimeline))
        timelineBtnTap.delegate = self
        timelineVBtn.addGestureRecognizer(timelineBtnTap)
        
        let mapBtnTap = UITapGestureRecognizer(target: self, action: #selector(openMap))
        mapBtnTap.delegate = self
        mapVBtn.addGestureRecognizer(mapBtnTap)
        
        let mapBtnTap2 = UITapGestureRecognizer(target: self, action: #selector(openMap2))
        mapBtnTap2.delegate = self
        mapVBtn2.addGestureRecognizer(mapBtnTap2)
        
        let fatawyBtnTap = UITapGestureRecognizer(target: self, action: #selector(openFatawy))
        fatawyBtnTap.delegate = self
        fatawyVBtn.addGestureRecognizer(fatawyBtnTap)
        
        
        let galleryBtnTap = UITapGestureRecognizer(target: self, action: #selector(openGallery))
        galleryBtnTap.delegate = self
        galleryVBtn.addGestureRecognizer(galleryBtnTap)
        
        
        let videosBtnTap = UITapGestureRecognizer(target: self, action: #selector(openVideos))
        videosBtnTap.delegate = self
        videosVBtn.addGestureRecognizer(videosBtnTap)
        
        menuV.addSubview(aboutVBtn)
        menuV.addSubview(newsVBtn)
        menuV.addSubview(timelineVBtn)
        menuV.addSubview(mapVBtn)
        menuV.addSubview(mapVBtn2)
        menuV.addSubview(fatawyVBtn)
        menuV.addSubview(galleryVBtn)
        menuV.addSubview(videosVBtn)
        
        self.view1.addSubview(menuV)
        
    }
    
    func initView2(){
        
        let menuV = UIView(frame: CGRect(x: 0, y: 108, width: self.view.frame.width, height: self.view.frame.height - 108))
        
        guideVBtn.frame = CGRect(x: (menuV.frame.width / 2) + viewMargin, y: (menuV.frame.height / 2) - (viewMargin * 3 / 2) - (viewDim * 2), width: viewDim, height: viewDim)
        
        let guideIcon = UIImageView(image: UIImage(named: "guideIcon")?.withRenderingMode(.alwaysTemplate))
        guideIcon.tintColor = UIColor.white
        guideIcon.frame = CGRect(x: 0, y: 10, width: mapVBtn.frame.width, height: 50)
        guideIcon.contentMode = .scaleAspectFit
        
        let guideLbl = UILabel(frame: CGRect(x: 0, y: guideIcon.frame.maxY + 10, width: guideVBtn.frame.width, height: 20))
        guideLbl.font = UIFont(name: "GE SS Two", size: 14)
        guideLbl.textColor = UIColor.secondryColor()
        guideLbl.textAlignment = .center
        guideLbl.text = "دليل الحاج"
        guideLbl.dropShadow2()
        
        guideVBtn.addSubview(guideIcon)
        guideVBtn.addSubview(guideLbl)
        
        chairVBtn.frame = CGRect(x: (menuV.frame.width / 2) - viewDim - viewMargin, y: guideVBtn.frame.minY, width: viewDim, height: viewDim)
        
        let chairIcon = UIImageView(image: UIImage(named: "chairIcon")?.withRenderingMode(.alwaysTemplate))
        chairIcon.tintColor = UIColor.white
        chairIcon.frame = CGRect(x: 0, y: 10, width: mapVBtn2.frame.width, height: 50)
        chairIcon.contentMode = .scaleAspectFit
        
        let chairLbl = UILabel(frame: CGRect(x: 0, y: chairIcon.frame.maxY + 10, width: chairVBtn.frame.width, height: 20))
        chairLbl.font = UIFont(name: "GE SS Two", size: 14)
        chairLbl.textColor = UIColor.secondryColor()
        chairLbl.textAlignment = .center
        chairLbl.text = "طلب كرسي"
        chairLbl.dropShadow2()
        
        chairVBtn.addSubview(chairIcon)
        chairVBtn.addSubview(chairLbl)
        
        
        tayehVBtn.frame = CGRect(x: (menuV.frame.width / 2) + viewMargin, y: (menuV.frame.height / 2) - (viewMargin / 2) - viewDim, width: viewDim, height: viewDim)
        
        let tayehIcon = UIImageView(image: UIImage(named: "markerIcon")?.withRenderingMode(.alwaysTemplate))
        tayehIcon.tintColor = UIColor.white
        tayehIcon.frame = CGRect(x: 0, y: 10, width: tayehVBtn.frame.width, height: 50)
        tayehIcon.contentMode = .scaleAspectFit
        
        let tayehLbl = UILabel(frame: CGRect(x: 0, y: tayehIcon.frame.maxY + 10, width: tayehVBtn.frame.width, height: 20))
        tayehLbl.font = UIFont(name: "GE SS Two", size: 15)
        tayehLbl.textColor = UIColor.secondryColor()
        tayehLbl.textAlignment = .center
        tayehLbl.text = "الحاج الضائع"
        tayehLbl.dropShadow2()
        
        tayehVBtn.addSubview(tayehIcon)
        tayehVBtn.addSubview(tayehLbl)
        
        fatwaReqVBtn.frame = CGRect(x: (menuV.frame.width / 2) - viewDim -  viewMargin, y: tayehVBtn.frame.minY, width: viewDim, height: viewDim)
        
        let fatwaReqIcon = UIImageView(image: UIImage(named: "fatwaIcon")?.withRenderingMode(.alwaysTemplate))
        fatwaReqIcon.tintColor = UIColor.white
        fatwaReqIcon.frame = CGRect(x: 0, y: 10, width: fatwaReqVBtn.frame.width, height: 50)
        fatwaReqIcon.contentMode = .scaleAspectFit
        
        let fatwaReqLbl = UILabel(frame: CGRect(x: 0, y: fatwaReqIcon.frame.maxY + 10, width: fatwaReqVBtn.frame.width, height: 20))
        fatwaReqLbl.font = UIFont(name: "GE SS Two", size: 15)
        fatwaReqLbl.textColor = UIColor.secondryColor()
        fatwaReqLbl.textAlignment = .center
        fatwaReqLbl.text = "طلب فتوى"
        fatwaReqLbl.dropShadow2()
        
        fatwaReqVBtn.addSubview(fatwaReqIcon)
        fatwaReqVBtn.addSubview(fatwaReqLbl)
        
        competitionsVBtn.frame = CGRect(x: (menuV.frame.width / 2) - viewDim - viewMargin, y: (menuV.frame.height / 2) + (viewMargin / 2), width: viewDim, height: viewDim)
        
        let compsIcon = UIImageView(image: UIImage(named: "compsIcon")?.withRenderingMode(.alwaysTemplate))
        compsIcon.tintColor = UIColor.white
        compsIcon.frame = CGRect(x: 0, y: 10, width: competitionsVBtn.frame.width, height: 50)
        compsIcon.contentMode = .scaleAspectFit
        
        let compsLbl = UILabel(frame: CGRect(x: 0, y: compsIcon.frame.maxY + 10, width: competitionsVBtn.frame.width, height: 20))
        compsLbl.font = UIFont(name: "GE SS Two", size: 15)
        compsLbl.textColor = UIColor.secondryColor()
        compsLbl.textAlignment = .center
        compsLbl.text = "مسابقات"
        compsLbl.dropShadow2()
        
        competitionsVBtn.addSubview(compsIcon)
        competitionsVBtn.addSubview(compsLbl)
        
        contactVBtn.frame = CGRect(x: (menuV.frame.width / 2) + viewMargin, y: competitionsVBtn.frame.minY, width: viewDim, height: viewDim)
        
        let contactIcon = UIImageView(image: UIImage(named: "contactIcon")?.withRenderingMode(.alwaysTemplate))
        contactIcon.tintColor = UIColor.white
        contactIcon.frame = CGRect(x: 0, y: 10, width: contactVBtn.frame.width, height: 50)
        contactIcon.contentMode = .scaleAspectFit
        
        let contactLbl = UILabel(frame: CGRect(x: 0, y: contactIcon.frame.maxY + 10, width: contactVBtn.frame.width, height: 20))
        contactLbl.font = UIFont(name: "GE SS Two", size: 15)
        contactLbl.textColor = UIColor.secondryColor()
        contactLbl.textAlignment = .center
        contactLbl.text = "تواصل معنا"
        contactLbl.dropShadow2()
        
        contactVBtn.addSubview(contactIcon)
        contactVBtn.addSubview(contactLbl)
        
        let color = UIColor.white
        guideVBtn.addBorder(view: guideVBtn, stroke: color, fill: UIColor.clear, radius: 0, width: 3)
        chairVBtn.addBorder(view: chairVBtn, stroke: color, fill: UIColor.clear, radius: 0, width: 3)
        fatwaReqVBtn.addBorder(view: fatwaReqVBtn, stroke: color, fill: UIColor.clear, radius: 0, width: 3)
        tayehVBtn.addBorder(view: tayehVBtn, stroke: color, fill: UIColor.clear, radius: 0, width: 3)
        competitionsVBtn.addBorder(view: competitionsVBtn, stroke: color, fill: UIColor.clear, radius: 0, width: 3)
        contactVBtn.addBorder(view: contactVBtn, stroke: color, fill: UIColor.clear, radius: 0, width: 3)
        
        let aboutBtnTap = UITapGestureRecognizer(target: self, action: #selector(openGuide))
        aboutBtnTap.delegate = self
        guideVBtn.addGestureRecognizer(aboutBtnTap)
        
        let newsBtnTap = UITapGestureRecognizer(target: self, action: #selector(openChair))
        newsBtnTap.delegate = self
        chairVBtn.addGestureRecognizer(newsBtnTap)
        
        let timelineBtnTap = UITapGestureRecognizer(target: self, action: #selector(openFatwaReq))
        timelineBtnTap.delegate = self
        fatwaReqVBtn.addGestureRecognizer(timelineBtnTap)
        
        let mapBtnTap = UITapGestureRecognizer(target: self, action: #selector(openTayeh))
        mapBtnTap.delegate = self
        tayehVBtn.addGestureRecognizer(mapBtnTap)
        
        let mapBtnTap2 = UITapGestureRecognizer(target: self, action: #selector(openContact))
        mapBtnTap2.delegate = self
        contactVBtn.addGestureRecognizer(mapBtnTap2)
        
        let fatawyBtnTap = UITapGestureRecognizer(target: self, action: #selector(openComps))
        fatawyBtnTap.delegate = self
        competitionsVBtn.addGestureRecognizer(fatawyBtnTap)
        
        
        menuV.addSubview(guideVBtn)
        menuV.addSubview(chairVBtn)
        menuV.addSubview(tayehVBtn)
        menuV.addSubview(fatwaReqVBtn)
        menuV.addSubview(competitionsVBtn)
        menuV.addSubview(contactVBtn)
        
        self.view2.addSubview(menuV)
        
    }
    
    
    func openMap() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "mapList") as! MapListVC
        newViewController.mapListType = true
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func openMap2() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "mapList") as! MapListVC
        newViewController.mapListType = false
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func openFatawy() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "fatawy") as! FatawyAnswersVC
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func openAbout() {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "about") as! AboutVC
        self.navigationController?.pushViewController(newViewController, animated: true)

    }
    
    func openVideos() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "videos") as! VideoVC
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

    func openNews() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "news") as! NewsVC
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func openTimeline() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "timeline") as! TimelineVC
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

    func openGallery() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "gallery") as! GalleryVC
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func openGuide() {
        UIApplication.tryURL(urls: [
            "http://www.mnaskacademy.org/ara/download-centre"
            ])
    }
    
    func openChair() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "chairOrder") as! ChairOrderVC
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func openFatwaReq() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "fatwa") as! FatwaVC
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func openTayeh() {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "tayeh") as! HaggTayehVC
        self.navigationController?.pushViewController(newViewController, animated: true)
        
    }
    
    func openComps() {
        UIApplication.tryURL(urls: [
            "http://quiz.app101.sa/qasim/"
            ])
    }
    
    func openContact() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "contact") as! ContactVC
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

}

extension LandingVC: ViewPagerDataSource{
    func numberOfItems(viewPager:ViewPager) -> Int {
        return 2;
    }
    
    func viewAtIndex(viewPager:ViewPager, index:Int, view:UIView?) -> UIView {
        var newView = view;
        //newView?.frame = CGRect(x: 0, y: 0, width: viewPager.frame.width, height: viewPager.frame.height)
        var label:UILabel?
        if index == 0{
            newView = self.view1
        }
        else if index == 1{
            newView = self.view2
        }else{
            label = newView?.viewWithTag(1) as? UILabel
        }
        
        label?.text = "Page View Pager  \(index+1)"
        
        return newView!
    }
    
    func didSelectedItem(index: Int) {
        print("select index \(index)")
    }
    
}


