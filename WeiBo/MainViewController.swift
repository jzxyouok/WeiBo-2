//
//  MainViewController.swift
//  WeiBo
//
//  Created by Chris on 2016/12/5.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 添加子控制器
        addChildViewControllers()
    }
    
    // MARK: - 添加子控件
    private func addChildViewControllers() {
        createChildViewController(controller: HomeViewController(), title: "首页", imageName: "tabbar_home")
        createChildViewController(controller: MessageViewController(), title: "消息", imageName: "tabbar_message_center")
        createChildViewController(controller: DiscoverViewController(), title: "广场", imageName: "tabbar_discover")
        createChildViewController(controller: ProfileViewController(), title: "我的", imageName: "tabbar_profile")
        
    }
    
    // MARK: - 初始化控制器
    private func createChildViewController(controller: UIViewController, title: String, imageName: String) {
        controller.title = title
        controller.tabBarItem.image = UIImage(named: "\(imageName)")
        controller.tabBarItem.selectedImage = UIImage(named: "\(imageName)_selected")
        
        addChildViewController(controller)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
