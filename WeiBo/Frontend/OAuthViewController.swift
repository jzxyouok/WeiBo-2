//
//  OAuthViewController.swift
//  WeiBo
//
//  Created by Chris on 2016/12/9.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit
import PKHUD

class OAuthViewController: UIViewController {
    @IBOutlet var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let str = WeiBo.authorizeApi + "?client_id=" + WeiBo.appKey + "&redirect_uri=" + WeiBo.redirect
        let url = URL(string: str)!
        let request = URLRequest(url: url)
        webView.loadRequest(request)
        
        navigationItem.title = "加载中..."
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(clickCancelButton(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "填充", style: .plain, target: self, action: #selector(clickFillButton(_:)))
    }
    
    // MARK: - 按钮点击
    @objc private func clickCancelButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc private func clickFillButton(_ sender: UIButton) {
        let js = "document.getElementById('userId').value='18898586260'; document.getElementById('passwd').value='';"
        webView.stringByEvaluatingJavaScript(from: js)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - UIWebViewDelegate
extension OAuthViewController: UIWebViewDelegate {
    /// 即将加载 webView
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let containCodeString = request.url?.absoluteString ?? ""
        if containCodeString.contains("code=") {
            let code = containCodeString.components(separatedBy: "code=").last!
            let authRequest = OAuthRequest(code: code)
            ApiManager.accessToken(request: authRequest) { // 请求 token
                account in
                if let account = account {
                    ApiManager.usersShow(account: account) { // 请求用户信息
                        newAccount in
                        
                        if let newAccount = newAccount {
                            self.dismiss(animated: false) { // 页面跳转
                                UIApplication.shared.keyWindow?.rootViewController = WelcomeViewController()
                            }
                            // 归档
                            Account.archiver(account: newAccount)
                        } else {
                            HUD.flash(.label("获取用户信息失败!"), delay: 1.0)
                        }
                    }
                } else {
                    HUD.flash(.label("授权失败!"), delay: 1.0)
                }
            }
            
            return false
        }
        
        return true
    }
    /// 开始加载 webView
    func webViewDidStartLoad(_ webView: UIWebView) {
        HUD.show(.progress)
    }
    /// 完成加载 webView
    func webViewDidFinishLoad(_ webView: UIWebView) {
        PKHUD.sharedHUD.hide()
        
        // 加载完成设置title
        let title = webView.stringByEvaluatingJavaScript(from: "document.title")
        navigationItem.title = title
    }
    /// 加载 webView 失败
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        PKHUD.sharedHUD.hide()
    }
}
