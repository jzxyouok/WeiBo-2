//
//  User.swift
//  WeiBo
//
//  Created by Chris on 2016/12/10.
//  Copyright © 2016年 Chris. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    var screenName: String = ""
    var avatarLarge: String = ""
    var gender: String = "n"
    var verifiedType: Int = -1
    var mbrank: Int = 0
    
    static func user(_ dict: [String: JSON]) -> User? {
        if let screenName = dict["screen_name"]?.stringValue,
        let avatarLarge = dict["avatar_large"]?.stringValue,
        let gender = dict["gender"]?.stringValue,
        let verifiedType = dict["verified_type"]?.intValue,
        let mbrank = dict["mbrank"]?.intValue {
            
            let user = User()
            user.screenName = screenName
            user.avatarLarge = avatarLarge
            user.gender = gender
            user.verifiedType = verifiedType
            user.mbrank = mbrank
            
            return user
        }
        
        return nil
    }
}
