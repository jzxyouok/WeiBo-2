//
//  MainViewController.swift
//  WeiBo
//
//  Created by Chris on 2016/12/5.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    fileprivate lazy var composeButton: UIButton = {
        let composeButton = UIButton()
        composeButton.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: .normal)
        composeButton.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: .highlighted)
        composeButton.setImage(UIImage(named: "tabbar_compose_icon_add"), for: .normal)
        composeButton.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        composeButton.sizeToFit()
        return composeButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置全局的 UITabBarItem 颜色
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.lightGray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.darkGray], for: .selected)
        UINavigationBar.appearance().tintColor = .orange
        
        composeButton.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height * 0.5)
        composeButton.addTarget(self, action: #selector(clickComposeButton(_:)), for: .touchUpInside)
        tabBar.addSubview(composeButton)
    }
    
    // MARK: - Compose button click
    @objc fileprivate func clickComposeButton(_ sender: UIButton) {
        print("clickComposeButton")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
