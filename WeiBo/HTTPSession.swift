//
//  HTTPSession.swift
//  WeiBo
//
//  Created by Chris on 2016/12/9.
//  Copyright © 2016年 Chris. All rights reserved.
//

import Alamofire
import SwiftyJSON

enum Method: String {
    case get = "GET"
    case post = "POST"
}

struct HTTPSession {
    static func send(url: URLConvertible, parameters: [String: Any]? = nil, method: Method = .post, completion: @escaping (JSON?) -> Void) {
        Alamofire.request(url, method: HTTPMethod(rawValue: method.rawValue)!, parameters: parameters).responseJSON { response in
            if let data = response.data {
                completion(JSON(data: data))
            } else {
                completion(nil)
            }
        }
    }
}
