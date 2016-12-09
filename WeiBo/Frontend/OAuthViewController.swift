//
//  OAuthViewController.swift
//  WeiBo
//
//  Created by Chris on 2016/12/9.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit

class OAuthViewController: UIViewController {
    @IBOutlet var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let str = "https://api.weibo.com/oauth2/authorize?client_id=2640964376&redirect_uri=http://l1dan.com"
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
//        dismiss(animated: true)
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
        return true
    }
    /// 开始加载 webView
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    /// 完成加载 webView
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
    }
    /// 加载 webView 失败
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
    }
}











