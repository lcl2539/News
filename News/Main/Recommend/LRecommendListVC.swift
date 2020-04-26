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

    var collectionView : UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cell = UICollectionViewCell()
    }	

    
    func listView() -> UIView {
        return view
    }
    
}
