//
//  Account.swift
//  WeiBo
//
//  Created by Chris on 2016/12/9.
//  Copyright © 2016年 Chris. All rights reserved.
//

import Foundation

class Account: NSObject, NSCoding {
    static let shared = Account()
    fileprivate override init() {
        super.init()
    }
    
    static let archiverPath: String = {
        var userDocumentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        return (userDocumentPath as NSString).appendingPathComponent("account.dat")
    }()
    
    var token = ""
    var uid = ""
    var name = ""
    var avatarLarge = ""
    var expires: TimeInterval = 0.0
    var isSignIn: Bool {
        return Date.timeIntervalSinceReferenceDate > expires && expires > 0.0
    }
    
    /// 解档
    required init?(coder decoder: NSCoder) {
        token = decoder.decodeObject(forKey: "token") as! String
        uid = decoder.decodeObject(forKey: "uid") as! String
        name = decoder.decodeObject(forKey: "name") as! String
        avatarLarge = decoder.decodeObject(forKey: "avatarLarge") as! String
        expires = decoder.decodeDouble(forKey: "expires")
    }
    
    /// 归档
    func encode(with enCoder: NSCoder) {
        enCoder.encode(token, forKey: "token")
        enCoder.encode(uid, forKey: "uid")
        enCoder.encode(name, forKey: "name")
        enCoder.encode(avatarLarge, forKey: "avatarLarge")
        enCoder.encode(expires, forKey: "expires")
    }
    
    /// 保存
    static func archiver(_ account: Account) {
        NSKeyedArchiver.archiveRootObject(account, toFile: Account.archiverPath)
    }
    
    /// 取出
    static func unArchiver() -> Account? {
        guard let account = NSKeyedUnarchiver.unarchiveObject(withFile: self.archiverPath) as? Account else  {
            return nil
        }
        
        if account.isSignIn {
            return account
        }
        
        return nil
    }
}
