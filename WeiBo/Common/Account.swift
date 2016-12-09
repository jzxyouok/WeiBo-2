//
//  Account.swift
//  WeiBo
//
//  Created by Chris on 2016/12/9.
//  Copyright © 2016年 Chris. All rights reserved.
//

import Foundation

class Account: NSCoding {
    static let shared = Account()
    private init() {}
    
    static let archiverPath: String = {
        let userDocumentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        return userDocumentPath.appending("account.plist")
    }()
    
    var token = ""
    var uid = ""
    var name = ""
    var avatarLarge = ""
    var expires: TimeInterval = 0.0
    var isSigin: Bool {
        return Date.timeIntervalSinceReferenceDate > expires && expires > 0.0
    }
    
    /// 解档
    required init?(coder decoder: NSCoder) {
        token = decoder.decodeObject(forKey: "token") as! String
        uid = decoder.decodeObject(forKey: "uid") as! String
        name = decoder.decodeObject(forKey: "name") as! String
        avatarLarge = decoder.decodeObject(forKey: "avatarLarge") as! String
        expires = decoder.decodeObject(forKey: "expires") as! TimeInterval
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
    func archiver() {
        NSKeyedArchiver.archiveRootObject(self, toFile: Account.archiverPath)
    }
    
    /// 取出
    static func unArchiver() -> Account? {
        guard let account = NSKeyedUnarchiver.unarchiveObject(withFile: Account.archiverPath) as? Account else  {
            return nil
        }
        
        if account.isSigin {
            return account
        }
        
        return nil
    }
}
