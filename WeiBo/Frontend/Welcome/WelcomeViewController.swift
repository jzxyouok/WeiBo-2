//
//  WelcomeViewController.swift
//  WeiBo
//
//  Created by Chris on 2016/12/10.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit
import Kingfisher

class WelcomeViewController: UIViewController {
    @IBOutlet weak var avatorImageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var avatorImageView: UIImageView!
    @IBOutlet weak var avatorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        avatorImageView.layer.cornerRadius = 39
        avatorImageView.clipsToBounds = true
        
        let account = Account.shared
        // 设置欢迎语
        avatorLabel.text = account.name + " " + avatorLabel.text!
        // 下载图片
        let url = URL(string: account.avatarLarge)
        avatorImageView.kf.setImage(with: url, placeholder: UIImage(named: "avator_default"))
        // 动画
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: [], animations: {
            self.avatorImageViewTopConstraint.constant = 160
            self.view.layoutIfNeeded()
        }) { (isFinished) in
            if isFinished {
                // 设置根控制器
                let homeVc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
                UIApplication.shared.keyWindow?.rootViewController = homeVc
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
