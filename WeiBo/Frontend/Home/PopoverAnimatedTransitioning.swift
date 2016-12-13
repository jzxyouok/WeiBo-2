//
//  PopoverAnimatedTransitioning.swift
//  WeiBo
//
//  Created by Chris on 2016/12/8.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit

class PopoverAnimatedTransitioning: NSObject {
    fileprivate var isPersented = false
    var coverButtonAction: (() -> ())?
}

extension PopoverAnimatedTransitioning: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let popover = PopoverPresentationController(presentedViewController: presented, presenting: presenting)
        popover.coverButtonAction = coverButtonAction
        return popover
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPersented = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPersented = false
        return self
    }
}

extension PopoverAnimatedTransitioning: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    // UITransitionContextFromViewKey, and UITransitionContextToViewKey
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPersented {
            presented(using: transitionContext)
        } else {
            dismissed(using: transitionContext)
        }
    }
    
    fileprivate func presented(using transitionContext: UIViewControllerContextTransitioning) {
        let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        
        transitionContext.containerView.addSubview(presentedView!)
        
        presentedView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        presentedView?.transform = CGAffineTransform(scaleX: 1.0, y: 0)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            presentedView?.transform = CGAffineTransform.identity
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    }
    
    fileprivate func dismissed(using transitionContext: UIViewControllerContextTransitioning) {
        let dismissedView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            dismissedView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.000001)
        }, completion: { (_) in
            dismissedView?.removeFromSuperview()
            transitionContext.completeTransition(true)
        })
    }
}
