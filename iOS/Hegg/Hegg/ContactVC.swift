//
//  ContactVC.swift
//  Hegg
//
//  Created by Mamdouh El Nakeeb on 8/9/17.
//  Copyright © 2017 Mamdouh El Nakeeb. All rights reserved.
//

import UIKit
import Alamofire

class ContactVC: UIViewController {
    
    var subjectTF = UITextField()
    var nameTF = UITextField()
    var mobileTF = UITextField()
    var msgTF = UITextView()
    
    var userIDTF = String()
    
    var spinner = UIActivityIndicatorView()
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))

    
    let margin: CGFloat = 30
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        let image = UIImage(named:"sideMenuIcon")?.withRenderingMode(.alwaysTemplate)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(SSASideMenu.presentRightMenuViewController))
        
        initViews()
    }
    
    func initViews(){
        
        let bgImg = UIImageView(image: UIImage(named: "landing_bg"))
        bgImg.frame = self.view.frame
        bgImg.contentMode = .scaleToFill
        
        self.view.addSubview(bgImg)

        let logoIV = UIImageView(image: UIImage(named: "logo_icon"))
        
        logoIV.frame = CGRect(x: self.view.frame.width - margin * 4, y: 110, width: 100, height: 100)
        logoIV.tintColor = UIColor.white
        
        let contactIconImg = UIImage(named:"contactIcon")?.withRenderingMode(.alwaysTemplate)
        let contactIconIV = UIImageView(image: contactIconImg)
        contactIconIV.tintColor = UIColor.white
        contactIconIV.frame = CGRect(x: margin, y: 80, width: 70, height: 70)
        
        let contactLbl = UILabel(frame: CGRect(x: margin, y: contactIconIV.frame.maxY + 10, width: 70, height: 15))
        contactLbl.text = "تواصل معنا"
        contactLbl.font = UIFont(name: "GE SS Two", size: 14)
        contactLbl.textAlignment = .center
        contactLbl.textColor = UIColor.white
        
        let greenTriangle = UIView.Triangle(height: 80, width: self.view.frame.width).getTriangle()
        greenTriangle.frame = CGRect(x: 0, y: 130, width: self.view.frame.width, height: 80)
        greenTriangle.backgroundColor = UIColor(red: 74/255, green: 174/255, blue: 106/255, alpha: 1)
        
        let greyTriangle = UIView.Triangle(height: greenTriangle.frame.height - 20, width: self.view.frame.width).getTriangle()
        greyTriangle.frame = CGRect(x: 0, y: greenTriangle.frame.minY + 20, width: self.view.frame.width, height: greenTriangle.frame.height - 20)
        greyTriangle.backgroundColor = UIColor.lightGray
        
        let whiteTriangle = UIView.Triangle(height: greyTriangle.frame.height - 10, width: self.view.frame.width).getTriangle()
        whiteTriangle.frame = CGRect(x: 0, y: greyTriangle.frame.minY + 10, width: self.view.frame.width, height: greyTriangle.frame.height - 10)
        whiteTriangle.backgroundColor = UIColor.white
        
        let whiteV = UIView(frame: CGRect(x: 0, y: whiteTriangle.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - whiteTriangle.frame.maxY))
        whiteV.backgroundColor = UIColor.white
        
        let nameV = UIView(frame: CGRect(x: margin * 3 / 2, y: logoIV.frame.maxY + margin, width: self.view.frame.width - margin * 3, height: 44))
        nameV.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        
        nameTF = UITextField(frame: CGRect(x: margin / 4, y: 0, width: nameV.frame.width - margin / 2, height: 44))
        
        nameTF.placeholder = "الاسم"
        nameTF.keyboardType = .namePhonePad
        nameTF.textAlignment = .right
        nameTF.font = UIFont(name: "GE SS Two", size: 14)
        nameTF.textColor = UIColor.black
        nameTF.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        
        nameV.addSubview(nameTF)
        
        
        let mobileV = UIView(frame: CGRect(x: margin * 3 / 2, y: nameV.frame.maxY + 10, width: self.view.frame.width - margin * 3, height: 44))
        mobileV.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        
        mobileTF = UITextField(frame: CGRect(x: margin / 4, y: 0, width: mobileV.frame.width - margin / 2, height: 44))
        
        mobileTF.placeholder = "رقم الجوال"
        mobileTF.textAlignment = .right
        mobileTF.keyboardType = .phonePad
        mobileTF.font = UIFont(name: "GE SS Two", size: 14)
        mobileTF.textColor = UIColor.black
        mobileTF.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        
        mobileV.addSubview(mobileTF)
        
        let subjectV = UIView(frame: CGRect(x: margin * 3 / 2, y: mobileV.frame.maxY + 10, width: self.view.frame.width - margin * 3, height: 44))
        subjectV.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        
        subjectTF = UITextField(frame: CGRect(x: margin / 4, y: 0, width: subjectV.frame.width - margin / 2, height: 44))
        
        subjectTF.placeholder = "عنوان الرسالة....."
        subjectTF.textAlignment = .right
        subjectTF.font = UIFont(name: "GE SS Two", size: 14)
        subjectTF.textColor = UIColor.black
        subjectTF.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        
        subjectV.addSubview(subjectTF)
        
        let msgV = UIView(frame: CGRect(x: margin * 3 / 2, y: subjectV.frame.maxY + 10, width: self.view.frame.width - margin * 3, height: 150))
        msgV.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        
        msgTF = UITextView(frame: CGRect(x: margin / 4, y: 0, width: msgV.frame.width - margin / 2, height: 150))
        
        msgTF.text = "نص الرسالة....."
        msgTF.textAlignment = .right
        msgTF.font = UIFont(name: "GE SS Two", size: 14)
        msgTF.textColor = UIColor.black
        msgTF.backgroundColor = UIColor.clear
        msgV.addSubview(msgTF)
        
        let hideKeyboard = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        hideKeyboard.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(hideKeyboard)
        
        let sendBtn = UIButton(frame: CGRect(x: margin * 3 / 2, y: msgV.frame.maxY + margin / 3, width: self.view.frame.width - margin * 3, height: 44))
        
        sendBtn.setTitle("إرسال", for: .normal)
        sendBtn.titleLabel?.font = UIFont(name: "GE SS Two", size: 14)
        sendBtn.backgroundColor = UIColor(red: 74/255, green: 174/255, blue: 106/255, alpha: 1)
        sendBtn.titleLabel?.textColor = UIColor.white
        
        sendBtn.addTarget(self, action: #selector(sendMsg), for: .touchUpInside)
        
        self.view.addSubview(greenTriangle)
        self.view.addSubview(greyTriangle)
        self.view.addSubview(whiteTriangle)
        self.view.addSubview(whiteV)
        self.view.addSubview(logoIV)
        self.view.addSubview(contactLbl)
        self.view.addSubview(contactIconIV)
        self.view.addSubview(subjectV)
        self.view.addSubview(nameV)
        self.view.addSubview(mobileV)
        self.view.addSubview(msgV)
        self.view.addSubview(sendBtn)
        
    }
    
    func initSpinner(){
        spinner.activityIndicatorViewStyle = .gray
        spinner.center = self.view.center
        
        spinner = UIActivityIndicatorView(activityIndicatorStyle: .white)
        spinner.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        
        let strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 160, height: 46))
        strLabel.text = "جارى الإرسال"
        strLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightMedium)
        strLabel.textColor = UIColor(white: 0.9, alpha: 0.7)
        
        
        effectView.frame = CGRect(x: view.frame.midX - strLabel.frame.width/2, y: view.frame.midY - strLabel.frame.height/2 , width: 160, height: 46)
        effectView.layer.cornerRadius = 15
        effectView.layer.masksToBounds = true
        
        effectView.addSubview(spinner)
        effectView.addSubview(strLabel)
    }
    
    func dismissSpinner(){
        spinner.stopAnimating()
        effectView.removeFromSuperview()
    }
    
    func displaySpinner(){
        spinner.startAnimating()
        self.view.addSubview(effectView)
    }
    
    func sendMsg(){
        
        if ((subjectTF.text?.isEmpty)! || (nameTF.text?.isEmpty)! || (mobileTF.text?.isEmpty)! || (msgTF.text.isEmpty)) {
            let alert = UIAlertController(title: "تنبيه", message: "برجاء ملئ جميع البيانات", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "حاول مرة أخرى", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        /*
        if !UserDefaults.standard.bool(forKey: "logged") {
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
        */
        
        displaySpinner()
        
        let utils: Utils = Utils()
        
        if !utils.isConnectedToNetwork(){
            dismissSpinner()
            let alert = UIAlertController(title: "تنبيه", message: "يوجد مشكلة فى الإتصال بالإنترنت", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "حاول مرة أخرى", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        
        let parameters: Parameters=[
            "userID": UserDefaults.standard.value(forKey: "userID") ?? 0,
            "subject": subjectTF.text!,
            "name": nameTF.text!,
            "mobile": mobileTF.text!,
            "msg": msgTF.text
        ]

        print(parameters)
        
        Alamofire.request(Urls.contactUS, method: .post, parameters: parameters)
            .responseJSON{
                
                response in
                
                self.dismissSpinner()
                print(response)
                
                if let result = response.result.value{
                    
                    let msgObj = result as! NSObject
                    
                    let msg = msgObj.value(forKey: "msg") as! String
                    
                    if msg == "success"{
                        let alert = UIAlertController(title: "تم الإرسال", message: "تم إرسال رسالتك بنجاح", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "حسناً", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
        }
    }
    
    func hideKeyboard(_ recognizer: UIGestureRecognizer) {
        view.endEditing(true)
    }

}
