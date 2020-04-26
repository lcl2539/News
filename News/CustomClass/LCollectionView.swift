//
//  LCollectionView.swift
//  News
//
//  Created by 鲁成龙 on 2020/4/24.
//  Copyright © 2020 鲁成龙. All rights reserved.
//

import UIKit
import MJRefresh

typealias LRefreshClosure =  () -> Void

class LCollectionView: UICollectionView {
    
    
    ///是否自动初始化
    var autoConfigHeaderFooter = true
    
    var headerRefresh : LRefreshClosure?{
        didSet{
            if autoConfigHeaderFooter {
                mj_header = MJRefreshNormalHeader.init(refreshingBlock: { [unowned self] in
                    self.headerRefreshAction()
                })
            }
        }
    }
    
    var footerRefresh : LRefreshClosure?{
        didSet {
            if autoConfigHeaderFooter {
                mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: { [unowned self] in
                    self.footerRefreshAction()
                })
            }
        }
    }

    
    func headerRefreshAction() {
        headerRefresh?()
    }
    
    
    func footerRefreshAction() {
        footerRefresh?()
    }
    
    
    func beginHeaderRefresh() {
        mj_header?.beginRefreshing()
    }
    
    func beginFooterRefresh() {
        mj_footer?.beginRefreshing()
    }
    
    func endHeaderRefresh() {
        mj_header?.endRefreshing()
    }
    
    func endFooterRefresh() {
        mj_footer?.endRefreshing()
    }
}
