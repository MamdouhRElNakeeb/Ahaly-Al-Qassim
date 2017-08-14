//
//  Extensions.swift
//  Hegg
//
//  Created by Mamdouh El Nakeeb on 7/28/17.
//  Copyright © 2017 Mamdouh El Nakeeb. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func maskWithColor(color: UIColor) -> UIImage? {
        let maskImage = cgImage!
        
        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        
        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)
        
        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }
    
}

extension UIApplication {
    class func tryURL(urls: [String]) {
        let application = UIApplication.shared
        for url in urls {
            if application.canOpenURL(NSURL(string: url)! as URL) {
                if #available(iOS 10.0, *) {
                    application.open(URL(string: url)!, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                    application.openURL(URL(string: url)!)
                }
                return
            }
        }
    }
}

extension UIColor {
    
    class func primaryColor() -> UIColor {
     
        return UIColor(red: 74/255, green: 174/255, blue: 106/255, alpha: 1)
    }
    
    class func secondryColor() -> UIColor {
        
        return UIColor(red: 184/255, green: 209/255, blue: 36/255, alpha: 1)
    }
}
extension UIView{

    class Circle{
        
        var radius: CGFloat
        var fill: UIColor
        var stroke: UIColor
        
        init(radius: CGFloat, fill: UIColor, stroke: UIColor){
            
            self.radius = radius
            self.fill = fill
            self.stroke = stroke
        }
        
        func getCircle() -> UIView{
            
            let circle = UIView()
            circle.frame = CGRect(x: 0, y: 0, width: self.radius * 2, height: self.radius * 2)
            circle.layer.cornerRadius = radius
            circle.backgroundColor = fill
            circle.addBorder(view: circle, stroke: stroke, fill: fill, radius: Int(radius), width: 4)
            return circle
        }
        
    }
    
    class Triangle{
        
        var height: CGFloat
        var width: CGFloat
        
        init(height: CGFloat, width: CGFloat) {
            
            self.width = width
            self.height = height
        }
        
        func getTriangle() -> UIView {
            
            // Create Path
            let bezierPath = UIBezierPath()
            
            // Draw Points
            bezierPath.move(to: CGPoint(x: 0, y: height))
            bezierPath.addLine(to: CGPoint(x: width, y: height))
            bezierPath.addLine(to: CGPoint(x: width, y: 0))
            bezierPath.addLine(to: CGPoint(x: 0, y: height))
            bezierPath.close()
            
            // Apply Color
            UIColor.green.setFill()
            bezierPath.fill()
            
            // Mask to Path
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = bezierPath.cgPath
            
            let triangle = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
            triangle.layer.mask = shapeLayer
            
            return triangle
        }
        
    }
    
    func addBorder(view: UIView, stroke: UIColor, fill: UIColor, radius: Int, width: CGFloat){
        // Add border
        let borderLayer = CAShapeLayer()
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = view.frame
        rectShape.position = view.center
        
        rectShape.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.bottomRight , .topLeft, .topRight, .bottomLeft], cornerRadii: CGSize(width: radius, height: radius)).cgPath
        borderLayer.path = rectShape.path // Reuse the Bezier path
        borderLayer.fillColor = fill.cgColor
        borderLayer.strokeColor = stroke.cgColor
        borderLayer.lineWidth = width
        borderLayer.frame = view.bounds
        view.layer.addSublayer(borderLayer)
        view.layer.mask = rectShape
        
    }
    
    func removeBorder(view: UIView){
        // remove border
        view.layer.removeFromSuperlayer()
    }
    
   func dropShadow() {
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: -1, height: 0)
        self.layer.shadowRadius = 3
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
    
    func dropShadow2() {
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: -1, height: 0)
        self.layer.shadowRadius = 9
        
        //self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        //self.layer.cornerRadius = 15
        self.layer.masksToBounds = false
    }
    
    
    func outerGlow() {
        
        self.layer.shadowColor = UIColor(red: 252/255, green: 247/255, blue: 192/255, alpha: 1).cgColor
        self.layer.shadowOpacity = 2
        self.layer.shadowOffset = CGSize(width: -1, height: 0)
        self.layer.shadowRadius = 5
        
        //self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        //self.layer.cornerRadius = 5
        
        self.layer.masksToBounds = false
    }
}

