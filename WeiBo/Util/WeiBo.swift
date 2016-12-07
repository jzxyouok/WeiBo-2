//
//  WeiBo.swift
//  WeiBo
//
//  Created by Chris on 2016/12/6.
//  Copyright © 2016年 Chris. All rights reserved.
//

import Foundation
struct WeiBo {
    
    /// 获取微博项目的 Module
    ///
    /// - Returns: Plist 中的 Executable 名字
    static var module: String {
        return (Bundle.main.infoDictionary?[String(kCFBundleExecutableKey)] as? String)!
    }
}
