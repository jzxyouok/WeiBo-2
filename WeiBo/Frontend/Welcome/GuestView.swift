//
//  GuestView.swift
//  WeiBo
//
//  Created by Chris on 2016/12/7.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit

class GuestView: UIView {
    /// 从 xib 中加载 view
    ///
    /// - Returns: 已经完成加载的 view
    class func guestView() -> GuestView {
        return Bundle.main.loadNibNamed("GuestView", owner: nil, options: nil)?.last as! GuestView
    }
    
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var feedLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    
    func startRotateAnimation() {
        // 1.创建动画
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        
        // 2.设置动画的属性
        rotationAnim.fromValue = 0
        rotationAnim.toValue = Double.pi * 2
        rotationAnim.duration = 30
        rotationAnim.repeatCount = Float.greatestFiniteMagnitude
        rotationAnim.isRemovedOnCompletion = false
        
        // 3.将动画添加到图层中
        feedImageView.layer.add(rotationAnim, forKey: nil)
    }
}
