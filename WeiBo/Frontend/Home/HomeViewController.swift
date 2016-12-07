//
//  HomeViewController.swift
//  WeiBo
//
//  Created by Chris on 2016/12/5.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    /// 标识是否登录
    let isSignIn = true
    
    override func loadView() {
        isSignIn ? super.loadView() : loadGuestView()
        isSignIn ? addUserItem() : addGuestItem()
    }
    
    private func loadGuestView() {
        // 添加访客视图
        let guestView = GuestView.guestView()
        guestView.startRotateAnimation()
        view = guestView
    }
    
    private func addGuestItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(signUp))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(signIn))
    }
    
    private func addUserItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_icon_radar", target: self, action: nil)
        
        let titleButton = HomeTitleButton()
        titleButton.setTitle("l1Dan", for: .normal)
        titleButton.setTitleColor( .black, for: .normal)
        navigationItem.titleView = titleButton
    }
    
    /// 注册
    @objc private func signUp() {
        
    }
    /// 登录
    @objc private func signIn() {
        
    }
    /// 登出
    @objc private func signOut() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
