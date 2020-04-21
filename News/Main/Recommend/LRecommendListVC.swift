//
//  LRecommendListVC.swift
//  News
//
//  Created by 鲁成龙 on 2020/4/21.
//  Copyright © 2020 鲁成龙. All rights reserved.
//

import UIKit
import JXSegmentedView

class LRecommendListVC: QMUICommonViewController ,JXSegmentedListContainerViewListDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        let colorNumber : CGFloat = CGFloat(arc4random_uniform(255))
        view.backgroundColor = UIColor.init(red: colorNumber, green: colorNumber, blue: colorNumber, alpha: 1)
    }

    override func initSubviews() {
        super.initSubviews()
        
    }
    
    func listView() -> UIView {
        return view
    }
    
}
