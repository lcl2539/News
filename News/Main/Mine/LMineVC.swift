//
//  LMineVC.swift
//  News
//
//  Created by 鲁成龙 on 2020/4/28.
//  Copyright © 2020 鲁成龙. All rights reserved.
//

import UIKit
import SkeletonView

class LMineVC: QMUICommonViewController {

    @IBOutlet weak var headerImageHeight: NSLayoutConstraint!
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var userInfoView: UIView!
    
    @IBOutlet weak var reportButton: QMUIButton!
    @IBOutlet weak var shareButton: QMUIButton!
    
    @IBOutlet weak var userActionView: UIView!
    @IBOutlet weak var shopActionView: UIView!
    
    var shareShadowLayer : CALayer!
    var reportShadowLayer : CALayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userInfoView.layer.cornerRadius = 8
        shareShadowLayer = shareButton.addCornerRadiusAndShadow(cornerRadius: 8)
        reportShadowLayer = reportButton.addCornerRadiusAndShadow(cornerRadius: 8)
        userActionView.addCornerRadiusAndShadow(cornerRadius: 8)
        shopActionView.superview?.addCornerRadiusAndShadow(cornerRadius: 8)

        
        
        for button : QMUIButton in userActionView.subviews as! [QMUIButton] {
            button.imagePosition = QMUIButtonImagePosition.top
            button.spacingBetweenImageAndTitle = 8
        }
        for button : QMUIButton in shopActionView.subviews as! [QMUIButton] {
            button.imagePosition = QMUIButtonImagePosition.top
            button.spacingBetweenImageAndTitle = 8
        }
    }
    
    override func setupNavigationItems() {
        super.setupNavigationItems()
        title = "个人中心"
        titleView?.adjustsSubviewsTintColorAutomatically = false
        titleView?.titleLabel.textColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shareShadowLayer.frame.origin.y += UIApplication.shared.statusBarFrame.height
        reportShadowLayer.frame.origin.y += UIApplication.shared.statusBarFrame.height
        navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isTranslucent = false
    }
    
    override func navigationBarBackgroundImage() -> UIImage? {
        return UIImage.qmui_image(with: UIColor.clear)
    }
    
}
