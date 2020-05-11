//
//  Tool.swift
//  News
//
//  Created by 鲁成龙 on 2020/4/21.
//  Copyright © 2020 鲁成龙. All rights reserved.
//

import UIKit

class Tool: NSObject {
    
    class func naviagtionBarHeight(_ viewController : UIViewController) -> CGFloat {
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        return viewController.navigationController!.navigationBar.bounds.size.height + statusBarHeight
    }
    
    class func UUID() -> String?{
        return UIDevice.current.identifierForVendor?.uuidString
    }
    
    class func appCurrentVersion() -> String {
        return Bundle.init().infoDictionary!["CFBundleShortVersionString"] as! String
    }
}

extension UIView {
    
    @discardableResult public func addCornerRadiusAndShadow(cornerRadius : CGFloat) -> CALayer {
        let layer = CALayer()
        layer.cornerRadius = cornerRadius
        layer.backgroundColor = UIColor.white.cgColor
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize.init(width: 1, height: 1) //shadowOffset阴影偏移,x向右偏移3，y向下偏移2，默认(0, -3),这个跟shadowRadius配合使用
        layer.shadowOpacity = 0.2
        if subviews.count > 0 {
            layer.frame = self.bounds
            self.layer.insertSublayer(layer, below: subviews[0].layer)
        } else {
            layer.frame = self.frame
            superview?.layer.insertSublayer(layer, below: self.layer)
        }
        return layer
    }
}


extension Date {
    var timeStamp : String {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return "\(timeStamp)"
    }

    /// 获取当前 毫秒级 时间戳 - 13位
    var milliTimeStamp : String {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval*1000))
        return "\(millisecond)"
    }
    
}
