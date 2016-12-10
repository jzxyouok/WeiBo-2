//
//  WeiBo.swift
//  WeiBo
//
//  Created by Chris on 2016/12/6.
//  Copyright © 2016年 Chris. All rights reserved.
//

import Foundation

struct WeiBo { }

extension WeiBo {
    /// 获取微博项目的 Module
    ///
    /// - Returns: Plist 中的 Executable 名字
    static var module: String {
        return (Bundle.main.infoDictionary?[String(kCFBundleExecutableKey)] as? String)!
    }
    /// 授权 app key
    static var appKey: String {
        return "2640964376"
    }
    /// app secrect
    static var appSecret: String {
        return "4a27e798c6eb7ebe83f959938fdb4610"
    }
    /// app redirect uri
    static var redirect: String {
        return "http://l1dan.com"
    }
}

extension WeiBo {
    /// OAuth2的authorize接口
    static let authorizeApi = "https://api.weibo.com/oauth2/authorize"
    /// OAuth2的access_token接口
    static let accessTockApi = "https://api.weibo.com/oauth2/access_token"
    /// 获取用户信息
    static let usersShowApi = "https://api.weibo.com/2/users/show.json"
    /// 获取当前登录用户及其所关注用户的最新微博
    static let friendsTimelineApi = "https://api.weibo.com/2/statuses/friends_timeline.json"
}













