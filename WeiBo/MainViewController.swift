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
        print(HomeViewController())
        createChildViewController(vcName: "HomeViewController", title: "首页", imageName: "tabbar_home")
        createChildViewController(vcName: "MessageViewController", title: "消息", imageName: "tabbar_message_center")
        createChildViewController(vcName: "DiscoverViewController", title: "广场", imageName: "tabbar_discover")
        createChildViewController(vcName: "ProfileViewController", title: "我的", imageName: "tabbar_profile")
    }
    
    // MARK: - 初始化控制器
    private func createChildViewController(vcName: String, title: String, imageName: String) {
        // <WeiBo.HomeViewController: 0x7fe26a506de0>
        guard let module = Bundle.main.infoDictionary?[String(kCFBundleExecutableKey)] as? String else { return }
        guard let vcClass = NSClassFromString("\(module).\(vcName)") else { return }
        
        let vcType = vcClass as! UIViewController.Type
        let vc = vcType.init()
        
        vc.title = title
        vc.tabBarItem.image = UIImage(named: "\(imageName)")
        vc.tabBarItem.selectedImage = UIImage(named: "\(imageName)_selected")
        addChildViewController(vc)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
