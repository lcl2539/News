//
//  LCommonVC.swift
//  News
//
//  Created by 鲁成龙 on 2020/4/21.
//  Copyright © 2020 鲁成龙. All rights reserved.
//

import UIKit
import JXSegmentedView

class LRecommendVC: QMUICommonViewController{


    var segmentedView : JXSegmentedView!
    var segmentedTitles : [String]!
    var segmentedDataSource : JXSegmentedTitleDataSource!
    var listContainerView : JXSegmentedListContainerView!
    

    override func initSubviews() {
        super.initSubviews()
        
        segmentedView  = JXSegmentedView()
        let indicator = JXSegmentedIndicatorImageView()
        indicator.image = #imageLiteral(resourceName: "icon_pay_sel")
        indicator.indicatorWidth = 10
        indicator.indicatorHeight = 10
        segmentedView.indicators = [indicator]
        segmentedView.delegate = self
        segmentedView.contentEdgeInsetLeft = 15;
        segmentedView.contentEdgeInsetRight = 15;
        
        listContainerView = JXSegmentedListContainerView(dataSource: self)
        listContainerView.layer.isOpaque = true
        segmentedView.listContainer = listContainerView
        
        view.addSubview(segmentedView)
        view.addSubview(self.listContainerView)
        
        segmentedView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.snp_topMargin)
            make.height.equalTo(50)
        }
        listContainerView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp_bottomMargin)
            make.top.equalTo(segmentedView).offset(50)
        }
        
        
        
    }
    
    override func setupNavigationItems() {
        super.setupNavigationItems()
        let searchBar = QMUISearchBar.init()
        searchBar.placeholder = "请输入文章标题"
        searchBar.delegate = self
        
        let leftItem = UIBarButtonItem.qmui_item(with: #imageLiteral(resourceName: "icon_recom_logo"), target: nil, action: nil);
        let rightItem = UIBarButtonItem.qmui_item(with: #imageLiteral(resourceName: "icon_recom_nol_head"), target: self, action: #selector(showUserInfo));
        
        navigationItem.titleView = searchBar
        navigationItem.leftBarButtonItem = leftItem
        navigationItem.rightBarButtonItem = rightItem
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedTitles = ["要闻","求证","社会"]
        segmentedDataSource = JXSegmentedTitleDataSource()
        segmentedDataSource.titles = segmentedTitles
        segmentedDataSource.isTitleColorGradientEnabled = true
        segmentedDataSource.isItemSpacingAverageEnabled = false
        segmentedDataSource.isTitleZoomEnabled = true
        segmentedDataSource.isItemTransitionEnabled = true
        segmentedDataSource.isSelectedAnimable = true
        segmentedDataSource.titleNormalColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        segmentedDataSource.titleSelectedColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        segmentedDataSource.titleSelectedZoomScale = 1.2

        segmentedView.dataSource = segmentedDataSource
        segmentedView.defaultSelectedIndex = 1
        segmentedView.reloadData()
        listContainerView.reloadData()
    }
    
    @objc func showUserInfo() {
        let mineVC = LMineVC.init(nibName: "LMineVC", bundle: .main)
        navigationController?.pushViewController(mineVC, animated: true)
    }
    
}

// MARK: - Delegate
extension LRecommendVC : JXSegmentedViewDelegate, UISearchBarDelegate, JXSegmentedListContainerViewDataSource{
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return false
    }

    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int{
        return self.segmentedTitles.count
    }

    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        let containerView = LRecommendListVC()
        self.addChild(containerView)
        return containerView
        
    }
    
}
