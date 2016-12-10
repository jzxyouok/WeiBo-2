//
//  Status.swift
//  WeiBo
//
//  Created by Chris on 2016/12/10.
//  Copyright © 2016年 Chris. All rights reserved.
//

import Foundation
import SwiftyJSON

class Status {
    var createdAt: String = ""
    var source: String = ""
    var mid: Int = 0
    var text: String = ""
    var user: User?
}

extension Status {
    /// Parse
    static func statuses(json: JSON?) -> [Status]? {
        guard let statuses = json?["statuses"].array else { return nil }
        return statuses.map { status -> Status in
            let createAt = status["created_at"].stringValue
            let source = status["source"].stringValue
            let mid = status["mid"].intValue
            let text = status["text"].stringValue
            let user = status["user"].dictionaryValue
            
            let st = Status()
            st.createdAt = createAt
            st.source = source
            st.mid = mid
            st.text = text
            st.user = User.user(dict: user)
                
            return st
        }
    }
}
