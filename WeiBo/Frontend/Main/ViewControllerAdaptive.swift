//
//  ViewControllerAdaptive.swift
//  WeiBo
//
//  Created by Chris on 2016/12/6.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit

class ViewControllerAdaptive: NSObject {
    /// view controller 名字
    var vcName = ""
    /// view controller title
    var title = ""
    /// view controller tabbar image
    var imageName = ""
    /// 全部 view controller 
    var viewControllers: [ViewControllerAdaptive] {
        let info = JSONSerialization.serialization(forResource: "vc_name.json", ofType: nil) as! [[String: String]]
        
        return info.map { dict -> ViewControllerAdaptive in
            let x = ViewControllerAdaptive()
            x.setValuesForKeys(dict)
            return x
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
    
}
