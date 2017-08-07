//
//  VideoVC.swift
//  Hegg
//
//  Created by Mamdouh El Nakeeb on 8/4/17.
//  Copyright © 2017 Mamdouh El Nakeeb. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire

class VideoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var videosTV: UITableView = UITableView()
    
    var videosArray = Array<Video>()
    let videosUrl = "https://www.googleapis.com/youtube/v3/search?order=date&part=snippet&channelId=UCeH0M5ZjsNE1BDBs-AeH4sA&maxResults=50&key=AIzaSyAaKC-V6JT2M0iP6NUm3aXWkHBElCySfxQ"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let image = UIImage(named:"sideMenuIcon")?.withRenderingMode(.alwaysTemplate)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(SSASideMenu.presentRightMenuViewController))
        
        self.navigationItem.leftBarButtonItem?.title = "رجوع"
        
        let labelTitle = UILabel()
        labelTitle.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        labelTitle.text = "فيديوهات الحملة"
        labelTitle.font = UIFont(name: "GE SS Two", size: 17)
        self.navigationItem.titleView = labelTitle
        
        loadVideos()
        initVideosTV()
        
        let whiteNB = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 64))
        whiteNB.backgroundColor = UIColor.white
        self.view.addSubview(whiteNB)

    }
    
    func initVideosTV(){
        
        videosTV = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: UITableViewStyle.plain)
        videosTV.register(VideoCell.self, forCellReuseIdentifier: "VideoCell")
        videosTV.dataSource = self
        videosTV.delegate = self
        
        self.view.addSubview(videosTV)
        
    }
    
    func loadVideos(){
        let utils: Utils = Utils()
        
        if !utils.isConnectedToNetwork(){
            let alert = UIAlertController(title: "تنبيه", message: "يوجد مشكلة فى الإتصال بالإنترنت", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "حاول مرة أخرى", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        Alamofire.request(videosUrl)
            .responseJSON{
                
                response in
                
                //print(response)
                
                if let result = response.result.value {
                    
                    let videosJSONObject = result as! NSObject
                    
                    print(videosJSONObject)
                    
                    let videoItemsArr = videosJSONObject.value(forKey: "items") as! NSArray
                    
                    for videoItem in videoItemsArr {
                        
                        let videoIdObj = (videoItem as AnyObject).value(forKey: "id") as! NSObject
                        let videoId = videoIdObj.value(forKey: "videoId") as! String
                        
                        let videoSnippetObj = (videoItem as AnyObject).value(forKey: "snippet") as! NSObject
                        let videoName = videoSnippetObj.value(forKey: "title") as! String
                        
                        let videoThumbObj = videoSnippetObj.value(forKey: "thumbnails") as! NSObject
                        let videoThumvMedObj = videoThumbObj.value(forKey: "medium") as! NSObject
                        
                        let thumbnailUrl = videoThumvMedObj.value(forKey: "url") as! String
                        
                        self.videosArray.append(Video.init(name: videoName, thumbnail: thumbnailUrl, url: videoId))
                    }
                    
                }
                
                self.videosTV.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videosArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        
        cell.videoLbl.text = videosArray[indexPath.row].name
        cell.thumbnailIV.sd_setImage(with: URL(string: videosArray[indexPath.row].thumbnail))
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let youtubeId = videosArray[indexPath.row].url
        var youtubeUrl = NSURL(string:"youtube://\(youtubeId)")!
        if UIApplication.shared.canOpenURL(youtubeUrl as URL){
            UIApplication.shared.openURL(youtubeUrl as URL)
        } else{
            youtubeUrl = NSURL(string:"https://www.youtube.com/watch?v=\(youtubeId)")!
            UIApplication.shared.openURL(youtubeUrl as URL)
        }
    }
}


