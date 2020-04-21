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
        let navBarHeight = viewController.navigationController!.navigationBar.bounds.height
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        return navBarHeight + statusBarHeight
    }
    
}
