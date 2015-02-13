//
//  CollectionViewCellTag.swift
//  Tag
//
//  Created by Maimaitiming Abudukadier on 2/8/15.
//  Copyright (c) 2015 Maimaitiming Abudukadier. All rights reserved.
//

import UIKit

class CollectionViewCellTag: UICollectionViewCell {
    
    @IBOutlet weak var labelTag: UILabel!
    override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        self.contentView.layer.cornerRadius = CGRectGetHeight(self.frame)/2
        self.contentView.layer.borderColor = UIColor(red: 225/255.0, green: 225/255.0, blue: 225/255.0, alpha: 1).CGColor
        self.contentView.layer.borderWidth = 0.5
    }
}
