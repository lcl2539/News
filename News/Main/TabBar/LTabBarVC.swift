//
//  LTabBarVC.swift
//  News
//
//  Created by 鲁成龙 on 2020/4/21.
//  Copyright © 2020 鲁成龙. All rights reserved.
//

import UIKit

class LTabBarVC: QMUITabBarViewController {

    struct ItemInfo {
        let name : String
        let image : UIImage
        let controllerClass : AnyClass
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let commondItem = ItemInfo.init(name: "推荐", image: #imageLiteral(resourceName: "icon_home_remmd_1"), controllerClass: LRecommendVC.classForCoder())
        let newsItem = ItemInfo.init(name: "资讯", image: #imageLiteral(resourceName: "icon_home_news_1"), controllerClass: LNewsVC.classForCoder())
        let communityItem = ItemInfo.init(name: "社区", image: #imageLiteral(resourceName: "icon_home_comty_1"), controllerClass: LCommunityVC.classForCoder())
        let videoItem = ItemInfo.init(name : "视频", image : #imageLiteral(resourceName : "icon_home_video_1"), controllerClass : LVideoVC.classForCoder())
        let culturalCreationItem = ItemInfo.init(name: "文创", image: #imageLiteral(resourceName: "icon_home_creat_1"), controllerClass: LCulturalCreationVC.classForCoder())
        
        let itemInfos : [ItemInfo] = [commondItem,newsItem,communityItem,videoItem,culturalCreationItem]
        var viewControllers : [QMUINavigationController] = [];
        
        for (index,item) in itemInfos.enumerated() {
            let vc = creatSubViewController(item: item,idx: index)
            viewControllers.append(vc)
        }
        self.viewControllers = viewControllers
    }
    
    func creatSubViewController(item : ItemInfo,idx : Int) -> QMUINavigationController{
        let itemVCClass : QMUICommonViewController.Type = item.controllerClass.self as! QMUICommonViewController.Type
        let vc = itemVCClass.init()
        vc.view.backgroundColor = UIColor.white
        vc.hidesBottomBarWhenPushed = false
        
        let vcTabBarItem = UITabBarItem.init(title: item.name, image: item.image, tag: idx)
        vcTabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: -4.0)
        vcTabBarItem.selectedImage = item.image
        
        let navigationVC = QMUINavigationController.init(rootViewController: vc);
        navigationVC.navigationBar.isTranslucent = false
        navigationVC.tabBarItem = vcTabBarItem;
        
        return navigationVC
    }
}
