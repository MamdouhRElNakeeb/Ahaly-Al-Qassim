//
//  SideMenuTVC.swift
//  Hegg
//
//  Created by Mamdouh El Nakeeb on 7/28/17.
//  Copyright © 2017 Mamdouh El Nakeeb. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //let landingVC = LandingVC()
    
    @IBOutlet weak var sideMenuTV: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        sideMenuTV.separatorStyle = .none
        sideMenuTV.frame = CGRect(x: 0, y: (self.view.frame.size.height - 54 * 7) / 2.0, width: self.view.frame.size.width, height: 54 * 7)
        sideMenuTV.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
        sideMenuTV.isOpaque = false
        sideMenuTV.backgroundColor = UIColor.clear
        sideMenuTV.backgroundView = nil
        sideMenuTV.bounces = false
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SideMenuTVCell
        
        let titles: [String] = ["الخريطة", "الجدول الزمنى", "فيديوهات", "صور", "الأخبار", "عن الشركة", "إتصل بنا"]
        
        let images: [String] = ["mapIcon", "timelineIcon", "videosIcon", "galleryIcon", "newsIcon", "aboutIcon", "contactIcon"]
        
        cell.label.font = UIFont(name: "GE SS Two", size: 18)
        cell.label.text = titles[indexPath.row]
        cell.icon.image = UIImage(named: images[indexPath.row])
        
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        cell.contentView.backgroundColor = UIColor(red: 74/255, green: 174/255, blue: 106/255, alpha: 1)
        
        switch indexPath.row {
        case 0:
            
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: MapLocations())
            sideMenuViewController?.hideMenuViewController()
            
            break
            
        case 1:
            
            break
            
        case 2:
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: VideoVC())
            sideMenuViewController?.hideMenuViewController()
            
            break
            
        case 3:
            
            break
            
        case 4:
            
            break
            
        case 5:
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: AboutVC())
            sideMenuViewController?.hideMenuViewController()
            
            break
            
        case 6:
            
            break
            
        default:
            break
        }
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }

    
}





