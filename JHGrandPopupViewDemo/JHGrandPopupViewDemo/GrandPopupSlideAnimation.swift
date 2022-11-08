//
//  GrandPopupSlideAnimation.swift
//  GrandPopupViewDemo
//
//  Created by xq on 2022/7/14.
//

import UIKit
import JHGrandPopupView

class GrandPopupSlideAnimation: NSObject, JHGrandPopupAnimationProtocol {
    func animateIn(with popupView: JHGrandPopupView, willAnimate: (() -> Void)?, didAnimate: (() -> Void)?) {
        popupView.layoutIfNeeded()
        
        let toFrame = popupView.contentView.frame
        
        var fromFrame = popupView.contentView.frame
        fromFrame.origin.y = -popupView.contentView.frame.size.height
        popupView.contentView.frame = fromFrame
        
        popupView.alpha = 0
        willAnimate?()
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseInOut) {
            popupView.alpha = 1
            popupView.contentView.frame = toFrame
        } completion: { (finished) in
            didAnimate?()
        }
    }
    
    func animateOut(with popupView: JHGrandPopupView, willAnimate: (() -> Void)?, didAnimate: (() -> Void)?) {
        var toFrame = popupView.contentView.frame
        toFrame.origin.y = popupView.frame.size.height + popupView.contentView.frame.size.height

        willAnimate?()
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut) {
            popupView.alpha = 0
            popupView.contentView.frame = toFrame
        } completion: { (finished) in
            didAnimate?()
        }
    }
    

}
