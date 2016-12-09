//
//  Account.swift
//  WeiBo
//
//  Created by Chris on 2016/12/9.
//  Copyright © 2016年 Chris. All rights reserved.
//

import Foundation

class Account {
    static let shared = Account()
    private init() {}
    
    var token = ""
    var expiresDate = Date()
    var uid = ""
    var name = ""
    var avatarLarge = ""
    var expires: TimeInterval = 0.0 {
        didSet {
            expiresDate = Date(timeIntervalSinceNow: expires)
        }
    }
}
