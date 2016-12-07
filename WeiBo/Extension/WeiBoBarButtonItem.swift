//
//  WeiBoBarButtonItem.swift
//  WeiBo
//
//  Created by Chris on 2016/12/7.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(imageName name: String, target: Any?, action: Selector?) {
        let item = UIButton()
        item.setBackgroundImage(UIImage(named: name), for: .normal)
        item.setBackgroundImage(UIImage(named: "\(name)_highlighted"), for: .highlighted)
        item.sizeToFit()
        
        self.init(customView: item)
    }
}
