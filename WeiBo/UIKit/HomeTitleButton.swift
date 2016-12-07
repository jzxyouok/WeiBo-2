//
//  HomeTitleButton.swift
//  WeiBo
//
//  Created by Chris on 2016/12/7.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit

class HomeTitleButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImage(UIImage(named: "navigationbar_arrow_down"), for: .normal)
        setImage(UIImage(named: "navigationbar_arrow_up"), for: .selected)
        sizeToFit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let titleLabel = titleLabel, let imageView = imageView else { return }
        titleLabel.frame.origin.x = 0
        imageView.frame.origin.x = titleLabel.frame.maxX + 5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
