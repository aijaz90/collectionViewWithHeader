//
//  CollectionViewCell.swift
//  CollectionViewWithHeader
//
//  Created by Aijaz Ali on 17/08/2020.
//  Copyright © 2020 IT Majlis2019. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.mainView.layer.cornerRadius = 20
    }

}
