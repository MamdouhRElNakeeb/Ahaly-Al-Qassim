//
//  ViewController.swift
//  Hegg
//
//  Created by Mamdouh El Nakeeb on 7/28/17.
//  Copyright © 2017 Mamdouh El Nakeeb. All rights reserved.
//

import UIKit

class LandingVC: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var aboutVBtn: UIButton!
    @IBOutlet weak var newsVBtn: UIButton!
    @IBOutlet weak var timelineVBtn: UIButton!
    @IBOutlet weak var mapVBtn: UIButton!
    @IBOutlet weak var galleryVBtn: UIButton!
    @IBOutlet weak var videosVBtn: UIButton!
    
    let viewDim: CGFloat = 115
    let viewMargin: CGFloat = 24
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named:"sideMenuIcon")?.withRenderingMode(.alwaysTemplate)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(SSASideMenu.presentRightMenuViewController))
        
        initViews()
        
    }
    
    func initViews(){
        
        aboutVBtn.frame = CGRect(x: (self.view.frame.width / 2) - viewDim - viewMargin, y: (self.view.frame.height / 2) + (viewDim / 2) + viewMargin, width: viewDim, height: viewDim)
        newsVBtn.frame = CGRect(x: (self.view.frame.width / 2) + viewMargin, y: (self.view.frame.height / 2) + (viewDim / 2) + viewMargin, width: viewDim, height: viewDim)
        timelineVBtn.frame = CGRect(x: (self.view.frame.width / 2) - viewDim - viewMargin, y: (self.view.frame.height / 2) - (viewDim * 3 / 2) - viewMargin, width: viewDim, height: viewDim)
        mapVBtn.frame = CGRect(x: (self.view.frame.width / 2) + viewMargin, y: (self.view.frame.height / 2) - (viewDim * 3 / 2) - viewMargin, width: viewDim, height: viewDim)
        galleryVBtn.frame = CGRect(x: (self.view.frame.width / 2) - viewDim - viewMargin, y: (self.view.frame.height / 2) - (viewDim / 2), width: viewDim, height: viewDim)
        videosVBtn.frame = CGRect(x: (self.view.frame.width / 2) + viewMargin, y: (self.view.frame.height / 2) - (viewDim / 2), width: viewDim, height: viewDim)

        aboutVBtn.addBorder(view: aboutVBtn)
        newsVBtn.addBorder(view: newsVBtn)
        timelineVBtn.addBorder(view: timelineVBtn)
        mapVBtn.addBorder(view: mapVBtn)
        galleryVBtn.addBorder(view: galleryVBtn)
        videosVBtn.addBorder(view: videosVBtn)
        
        let aboutBtnTap = UITapGestureRecognizer(target: self, action: #selector(openMap))
        aboutBtnTap.delegate = self
        aboutVBtn.addGestureRecognizer(aboutBtnTap)
        
        
        let newsBtnTap = UITapGestureRecognizer(target: self, action: #selector(openMap))
        newsBtnTap.delegate = self
        newsVBtn.addGestureRecognizer(newsBtnTap)
        
        
        let timelineBtnTap = UITapGestureRecognizer(target: self, action: #selector(openMap))
        timelineBtnTap.delegate = self
        timelineVBtn.addGestureRecognizer(timelineBtnTap)
        
        
        let mapBtnTap = UITapGestureRecognizer(target: self, action: #selector(openMap))
        mapBtnTap.delegate = self
        mapVBtn.addGestureRecognizer(mapBtnTap)
        
        
        let galleryBtnTap = UITapGestureRecognizer(target: self, action: #selector(openMap))
        galleryBtnTap.delegate = self
        galleryVBtn.addGestureRecognizer(galleryBtnTap)
        
        
        let videosBtnTap = UITapGestureRecognizer(target: self, action: #selector(openMap))
        videosBtnTap.delegate = self
        videosVBtn.addGestureRecognizer(videosBtnTap)
        
    }
    
    func openMap() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "map") as! MapLocations
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

    
}
