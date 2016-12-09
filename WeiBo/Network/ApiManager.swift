//
//  ApiManager.swift
//  WeiBo
//
//  Created by Chris on 2016/12/9.
//  Copyright © 2016年 Chris. All rights reserved.
//

import SwiftyJSON

struct ApiManager {
    /// 请求 access token
    ///
    /// - Parameters:
    ///   - request: 请求模型
    ///   - completion: 去过请求失败 则 account 为 nil
    static func accessToken(request: OAuthRequest, completion: @escaping (Account?) -> Void) {
        let parameters = [
                "code": request.code,
                "client_id": request.appKey,
                "client_secret": request.appSecret,
                "grant_type": request.grantType,
                "redirect_uri": request.redirect,
            ]
        
        HTTPSession.send(url: WeiBo.accessTockApi, parameters: parameters) {
            json in
            if let token = json?["access_token"].string,
                let expires = json?["expires_in"].double,
                let uid = json?["uid"].string {
                
                let account = Account.shared
                account.token = token
                account.expires = expires
                account.uid = uid
                
                completion(account)
            } else {
                completion(nil)
            }
        }
    }
    
    static func usersShow(account: Account, completion: @escaping (Account?) -> Void) {
        let paramaters = [
            "access_token": account.token,
            "uid": account.uid,
        ]
        
        HTTPSession.send(url:  WeiBo.usersShowApi, parameters: paramaters, method: .get) {
            json in
            
            if let screen_name = json?["screen_name"].string, let avatar_large = json?["avatar_large"].string {
                account.name = screen_name
                account.avatarLarge = avatar_large
                
                completion(account)
            } else {
                completion(nil)
            }
        }
    }
}
