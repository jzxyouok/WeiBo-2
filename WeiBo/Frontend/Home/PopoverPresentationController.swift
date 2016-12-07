//
//  PopoverPresentationController.swift
//  WeiBo
//
//  Created by Chris on 2016/12/7.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit

class PopoverPresentationController: UIPresentationController {
    var coverButtonAction: (() -> ())?
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        guard let containerView = containerView else { return }
        let width: CGFloat = 200
        presentedView?.frame = CGRect(x: (containerView.bounds.width - width) * 0.5, y: 64, width: width, height: 300)
        
        addCoverView()
    }
    
    /// 添加一个蒙板
    private func addCoverView() {
        guard let containerView = containerView else { return }
        
        let coverButton = UIButton(frame: containerView.bounds)
        coverButton.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        coverButton.addTarget(self, action: #selector(clickCoverButton(_:)), for: .touchUpInside)
        containerView.insertSubview(coverButton, at: 0)
    }
    
    @objc private func clickCoverButton(_ sender: UIButton) {
        presentedViewController.dismiss(animated: true)
        
        if coverButtonAction != nil {
            coverButtonAction!()
        }
    }
}
