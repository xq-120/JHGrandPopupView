//
//  GrandPopupSlideAnimation.swift
//  GrandPopupViewDemo
//
//  Created by xq on 2022/7/14.
//

import UIKit
import JHGrandPopupView

class GrandPopupSlideAnimation: NSObject, JHGrandPopupViewAnimationProtocol, JHGrandPopupViewControllerAnimationProtocol {
    
    func transitionDuration(using transitionContext: (any UIViewControllerContextTransitioning)?) -> TimeInterval {
        return 0.25
    }
    
    func animateTransition(using transitionContext: any UIViewControllerContextTransitioning) {
        if directionType == .in {
            
        } else {
            
        }
    }
    
    var directionType: JHGrandPopupAnimateDirectionType = .in
    
    func animateIn(with popupView: JHGrandPopupView, completion: (() -> Void)?) {
        popupView.layoutIfNeeded()
        
        let toFrame = popupView.contentView.frame
        
        var fromFrame = popupView.contentView.frame
        fromFrame.origin.y = -popupView.contentView.frame.size.height
        popupView.contentView.frame = fromFrame
        
        popupView.alpha = 0
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseInOut) {
            popupView.alpha = 1
            popupView.contentView.frame = toFrame
        } completion: { (finished) in
            completion?()
        }
    }
    
    func animateOut(with popupView: JHGrandPopupView, completion: (() -> Void)?) {
        var toFrame = popupView.contentView.frame
        toFrame.origin.y = popupView.frame.size.height + popupView.contentView.frame.size.height

        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut) {
            popupView.alpha = 0
            popupView.contentView.frame = toFrame
        } completion: { (finished) in
            completion?()
        }
    }
}


