//
//  LBottomImageCell.swift
//  News
//
//  Created by 鲁成龙 on 2020/4/28.
//  Copyright © 2020 鲁成龙. All rights reserved.
//

import UIKit

class LBottomImageCell: UICollectionViewCell {
    @IBOutlet weak var tileLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 8
    }

}
