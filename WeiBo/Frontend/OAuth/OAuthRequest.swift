//
//  OAuthRequest.swift
//  WeiBo
//
//  Created by Chris on 2016/12/9.
//  Copyright © 2016年 Chris. All rights reserved.
//

import Foundation

/*
 https://api.weibo.com/oauth2/access_token
 client_id, client_secret, grant_type=authorization_code, code, redirect_uri
 */
class OAuthRequest {
    let appKey = WeiBo.appKey
    let appSecret = WeiBo.appSecret
    let redirect = WeiBo.redirect
    let grantType = "authorization_code"
    var code: String = ""
    
    init(code: String) {
        self.code = code
    }
}
