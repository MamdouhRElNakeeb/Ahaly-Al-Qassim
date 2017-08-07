//
//  LandingMenuBtn.swift
//  Hegg
//
//  Created by Mamdouh El Nakeeb on 8/5/17.
//  Copyright © 2017 Mamdouh El Nakeeb. All rights reserved.
//

import UIKit

class LandingMenuBtn: UIButton {

    var btnIcon = UIImageView()
    var btnTitle = UILabel()
    
    
    override func awakeFromNib() {
        
        btnIcon.frame = CGRect(x: 0, y: 17, width: 115, height: 55)
        btnIcon.contentMode = .scaleAspectFit
        btnIcon.tintColor = UIColor(red: 74/255, green: 174/255, blue: 106/255, alpha: 1)
        
        btnTitle.frame = CGRect(x: 0, y: 86, width: 115, height: 21)
        btnTitle.textColor = UIColor.white
        btnTitle.font = UIFont(name: "GE SS Two", size: 17)
        btnTitle.textAlignment = .center
        
        addSubview(btnIcon)
        addSubview(btnTitle)
    }
    
    override func draw(_ rect: CGRect) {
        
        btnIcon.frame = CGRect(x: 0, y: 17, width: 115, height: 55)
        btnIcon.contentMode = .scaleAspectFit
        btnIcon.tintColor = UIColor(red: 74/255, green: 174/255, blue: 106/255, alpha: 1)
        
        btnTitle.frame = CGRect(x: 0, y: 86, width: 115, height: 21)
        btnTitle.textColor = UIColor.white
        btnTitle.font = UIFont(name: "GE SS Two", size: 17)
        btnTitle.textAlignment = .center
        
        addSubview(btnIcon)
        addSubview(btnTitle)

        
    }

}
