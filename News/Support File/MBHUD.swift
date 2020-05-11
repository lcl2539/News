//
//  MBHUD.swift
//  News
//
//  Created by 鲁成龙 on 2020/5/7.
//  Copyright © 2020 鲁成龙. All rights reserved.
//

import UIKit
import MBProgressHUD


class MBHUD: NSObject {
    
    static var dissmissTime : Double = 0
    
    
    private override init() {}
    
    class func show(_ text : String){
        dissmissTime = 1.5
        DispatchQueue.main.async {
            let hud = MBHUD.getHud()
            hud.label.text = text
            hud.mode = .text
            hud.offset = CGPoint.init(x: 0, y: MBProgressMaxOffset)
            hud.hide(animated: true, afterDelay: 1.5)
        }
    }
    
    class func loading(text : String?, detailText : String?){
        dissmissTime = 0
        DispatchQueue.main.async {
            let hud = MBHUD.getHud()
            hud.label.text = text
            hud.detailsLabel.text = detailText
            hud.mode = .indeterminate
        }
    }
    
    class func error(text : String?, detailText : String?){
        dissmissTime = 1.5
        DispatchQueue.main.async {
            let image = #imageLiteral(resourceName: "Failed_HUD").withRenderingMode(.alwaysTemplate)
            self.custom(UIImageView.init(image: image), text: text, detailText: detailText)
        }
    }
    
    class func success(text : String?, detailText : String?){
        dissmissTime = 1.5
        DispatchQueue.main.async {
            let image = #imageLiteral(resourceName: "Success_HUD").withRenderingMode(.alwaysTemplate)
            self.custom(UIImageView.init(image: image), text: text, detailText: detailText)
        }
    }
    
    class func progress(_ progress : Progress , text : String?, detailText : String?){
        DispatchQueue.main.async {
            let hud = self.getHud()
            hud.label.text = text
            hud.detailsLabel.text = detailText
            hud.mode = .determinateHorizontalBar
            hud.progressObject = progress
        }
    }
    
    class func custom(_ view : UIView , text : String? , detailText : String?){
        let hud = self.getHud()
        hud.label.text = text
        hud.detailsLabel.text = detailText
        hud.mode = .customView
        hud.customView = view
        hud.isSquare = true
        hud.hide(animated: true, afterDelay: 1.5)
    }
    
    
    class func getHud() -> (MBProgressHUD){
        let hud = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated: true)
        hud.backgroundView.style = .solidColor
        hud.backgroundView.color = UIColor.init(white: 0, alpha: 0.3)
        hud.animationType = .zoomOut
        return hud
    }
    
}
