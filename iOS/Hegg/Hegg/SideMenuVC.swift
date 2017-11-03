//
//  SideMenuTVC.swift
//  Hegg
//
//  Created by Mamdouh El Nakeeb on 7/28/17.
//  Copyright © 2017 Mamdouh El Nakeeb. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var userIDTF = String()
    
    
    let titles: [String] = [
        "الرئيسية",
        "دليل الحاج و المعتمر",
        "الأخبار",
       "موقعنا بالمشاعر",
        "أماكن التجمع",
        "الخطة الزمنية",
        "طلب فتوى",
        "طلب كرسي",
     "الحاج الضائع",
     "مسابقات",
        "الفيديوهات",
        "الصور",
        "تواصل معنا",
        "دردشة",
  "عن الشركة"]
    
    let images: [String] = ["homeIcon", "guideIcon", "newsIcon", "markerIcon", "mapIcon", "timelineIcon", "fatwaIcon", "chairIcon", "markerIcon", "compsIcon", "videosIcon", "galleryIcon", "contactIcon", "chatIcon", "aboutIcon"]
    
    
    @IBOutlet weak var sideMenuTV: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        sideMenuTV.separatorStyle = .none
        sideMenuTV.frame = CGRect(x: 0, y: (self.view.frame.size.height - 45 * CGFloat(titles.count)) / 2.0, width: self.view.frame.size.width, height: 45 * CGFloat(titles.count))
        sideMenuTV.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
        sideMenuTV.isOpaque = false
        sideMenuTV.backgroundColor = UIColor.clear
        sideMenuTV.backgroundView = nil
        sideMenuTV.isScrollEnabled = true
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SideMenuTVCell
        
        
        cell.label.font = UIFont(name: "GE SS Two", size: 15)
        cell.label.text = titles[indexPath.row]
        cell.icon.image = UIImage(named: images[indexPath.row])
        cell.icon.tintColor = UIColor.white
        
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        cell.contentView.backgroundColor = UIColor(red: 74/255, green: 174/255, blue: 106/255, alpha: 1)
        
        switch indexPath.row {
        case 0:
            
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: LandingVC())
            sideMenuViewController?.hideMenuViewController()
            
            break
            
        case 3:
            
            let mapListVC = MapListVC()
            mapListVC.mapListType = true
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: mapListVC)
            sideMenuViewController?.hideMenuViewController()
            
            break
        
        case 4:
            
            let mapListVC = MapListVC()
            mapListVC.mapListType = false
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: mapListVC)
            sideMenuViewController?.hideMenuViewController()
            
            break
            
        case 5:
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: TimelineVC())
            sideMenuViewController?.hideMenuViewController()
            
            break
            
        case 10:
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: VideoVC())
            sideMenuViewController?.hideMenuViewController()
            
            break
            
        case 11:
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: GalleryVC())
            sideMenuViewController?.hideMenuViewController()
            
            break
            
        case 2:
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: NewsVC())
   	         sideMenuViewController?.hideMenuViewController()
            
            break
            
        case 1:
            
            UIApplication.tryURL(urls: [
                "http://www.mnaskacademy.org/ara/download-centre"
                ])
            
            sideMenuViewController?.hideMenuViewController()
            
            break
            
        case 7:
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: ChairOrderVC())
            sideMenuViewController?.hideMenuViewController()
            
            break
            
        case 6:
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: FatwaVC())
            sideMenuViewController?.hideMenuViewController()
            
            break
            
        case 8:
            
            // TODO HaggTayeh
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: HaggTayehVC())
            sideMenuViewController?.hideMenuViewController()
            
            break
            
        case 14:
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: AboutVC())
            sideMenuViewController?.hideMenuViewController()
            
            break
            
        case 13:
            
            if UserDefaults.standard.object(forKey: "userID") == nil {
                joinUser()
                return
            }
            
            var chatVC: UIViewController?
            let chat: Chat = {
                let chat = Chat()
                chat.type = "bot"
                chat.targetId = "89757"
                chat.chatId = chat.type + "_" + chat.targetId
                chat.title = "Chat"
                chat.detail = "bot"
                return chat
            }()
            
            chatVC = ChatVC(chat: chat)

            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: chatVC!)
            sideMenuViewController?.hideMenuViewController()
            
            break
            
        case 12:
            sideMenuViewController?.contentViewController = UINavigationController(rootViewController: ContactVC())
            sideMenuViewController?.hideMenuViewController()
            
            break
        
        default:
            break
        }
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
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
    
}





