//
//  LNewsVC.swift
//  News
//
//  Created by 鲁成龙 on 2020/4/28.
//  Copyright © 2020 鲁成龙. All rights reserved.
//

import UIKit

class LNewsVC: QMUICommonViewController , UISearchBarDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func setupNavigationItems() {
        super.setupNavigationItems()
        let searchBar = QMUISearchBar.init()
        searchBar.placeholder = "请输入文章标题"
        searchBar.delegate = self

        let leftItem = UIBarButtonItem.qmui_item(with: #imageLiteral(resourceName: "icon_recom_logo"), target: nil, action: nil);
        let rightItem = UIBarButtonItem.qmui_item(with: #imageLiteral(resourceName: "icon_recom_nol_head"), target: nil, action: #selector(showUserInfo));

        navigationItem.titleView = searchBar
        navigationItem.leftBarButtonItem = leftItem
        navigationItem.rightBarButtonItem = rightItem
       
    }

    @objc func showUserInfo() {
        let mineVC = LMineVC.init(nibName: "LMineVC", bundle: .main)
        navigationController?.pushViewController(mineVC, animated: true)
    }
}
