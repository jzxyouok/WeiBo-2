//
//  HomeViewController.swift
//  WeiBo
//
//  Created by Chris on 2016/12/5.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit
import PKHUD

class HomeViewController: UITableViewController {
    /// 标识是否登录
    fileprivate lazy var account: Account = {
        if let account = Account.unArchiver() {
            return account
        } else {
            return Account.shared
        }
    }()
    
    fileprivate lazy var popoverAnimate = PopoverAnimatedTransitioning()
    fileprivate var statuses = [Status]()
    
    override func loadView() {
        if account.isSignIn {
            super.loadView()
            addUserItem()
            
            // Fetch data from network
            loadFriendsTimelineData()
        } else {
            loadGuestView()
            addGuestItem()
        }
    }
    
    fileprivate func loadGuestView() {
        // 添加访客视图
        let guestView = GuestView.guestView()
        guestView.startRotateAnimation()
        view = guestView
    }
    
    fileprivate func addGuestItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(clickSignUpButton(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(clickSignInButton(_:)))
    }
    
    fileprivate func addUserItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_icon_radar", target: self, action: nil)
        
        let titleButton = HomeTitleButton()
        titleButton.setTitle("l1Dan", for: .normal)
        titleButton.setTitleColor( .black, for: .normal)
        titleButton.addTarget(self, action: #selector(clickTitleButton(_:)), for: .touchUpInside)
        navigationItem.titleView = titleButton
    }
    
    /// 注册
    @objc fileprivate func clickSignUpButton(_ sender: UIButton) {
        
    }
    /// 登录
    @objc fileprivate func clickSignInButton(_ sender: UIButton) {
        // 包装一个导航栏
        let vc = OAuthViewController()
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
    /// 登出
    @objc fileprivate func clickSignOutButton(_ sender: UIButton) {
        
    }
    /// 点击按钮
    @objc fileprivate func clickTitleButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        let popover = PopoverViewController()
        popover.modalPresentationStyle = .custom
        popover.transitioningDelegate = popoverAnimate
        popoverAnimate.coverButtonAction = {
            sender.isSelected = false
        }
        
        present(popover, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 200
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HomeViewController {
    /// Fetch data from netwrok
    fileprivate func loadFriendsTimelineData() {
        ApiManager.fetchFriendsTimeline(account) { [weak self] statuses in
            if let statuses = statuses {
                self?.statuses = statuses
                self?.tableView.reloadData()
            } else {
                HUD.flash(.label("微博数据请求失败"), delay: 2.0)
            }
        }
    }
}

extension HomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statuses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewCell") as! HomeViewCell
        cell.status = statuses[indexPath.row]
        return cell
    }
}



