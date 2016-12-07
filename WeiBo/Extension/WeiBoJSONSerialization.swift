//
//  WeiBoJSONSerialization.swift
//  WeiBo
//
//  Created by Chris on 2016/12/6.
//  Copyright © 2016年 Chris. All rights reserved.
//

import Foundation

extension JSONSerialization {
    static func serialization(forResource fileName: String?, ofType type: String?) -> Any {
        let filePath = Bundle.main.path(forResource: fileName, ofType: type)
        let url = URL(fileURLWithPath: filePath!)
        let jsonData = try! Data(contentsOf: url)
        return try! JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
    }
}
