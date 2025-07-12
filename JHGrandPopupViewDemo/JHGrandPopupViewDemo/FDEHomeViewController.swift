//
//  ViewController.swift
//  DemonSwift
//
//  Created by xuequan on 2020/1/30.
//  Copyright © 2020 xuequan. All rights reserved.
//

import UIKit
import JHGrandPopupView

class FDEHomeViewController: FDEBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.tableFooterView = UIView.init()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var dataList: [FDEItemModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubview()
        loadData()
    }
    
    func setupSubview() {
        self.navigationItem.title = "首页"
        
        view.addSubview(tableView)
        tableView.frame = view.frame
    }

    func loadData() {
        dataList.removeAll()
        
        let item0 = FDEItemModel.init()
        item0.title = "宽高自适应弹窗"
        item0.actionBlk = { [weak self] in
            let popupView = LoveKeyAlertPopupView.init()
            popupView.show(completion: nil)
        }
        dataList.append(item0)
        
        let item1 = FDEItemModel.init()
        item1.title = "宽固定,高自适应弹窗"
        item1.actionBlk = { [weak self] in
            guard let self = self else {return}
            let popupView = BroadcastBeginAlertView.init()
//            popupView.show(in: self.tabBarController!.view, completion: nil)
            popupView.show(in: self.tabBarController!.view, animated: true, completion: nil)
        }
        dataList.append(item1)
        
        let item2 = FDEItemModel.init()
        item2.title = "底部文本输入弹窗"
        item2.actionBlk = { [weak self] in
            let popupView = PublishCommentAlertView.init()
            popupView.show {
                
            }
            popupView.textView.becomeFirstResponder()
        }
        dataList.append(item2)
        
        let item3 = FDEItemModel.init()
        item3.title = "自定义动画-slide"
        item3.actionBlk = { [weak self] in
            let popupView = AuditionEndBuyAlertView.init()
            popupView.show(completion: nil)
        }
        dataList.append(item3)
        
        let item4 = FDEItemModel.init()
        item4.title = "复杂弹窗"
        item4.actionBlk = { [weak self] in
            guard let self = self else {return}
            let popupView = SupportGroupVoteAlertView.init()
            popupView.shouldDismissOnTouchBackView = true
            popupView.animator = JHGrandPopupPresentAnimation.init()
            popupView.show(in: self.tabBarController!.view, completion: nil)
        }
        dataList.append(item4)
        
        do {
            let item = FDEItemModel.init()
            item.title = "use viewcontroller-宽高固定弹窗"
            item.actionBlk = { [weak self] in
                guard let self = self else {return}
                let popupView = JKPushAlertViewController.init()
                let animator = JHGrandPopupFadeAnimation()
                animator.disableAnimateOutZoom = true
                popupView.animator = animator
                popupView.show(in: self, isWrapInNavigationController: false, animated: true, completion: nil)
            }
            dataList.append(item)
        }
        
        let item5 = FDEItemModel.init()
        item5.title = "use viewcontroller-宽固定,高自适应弹窗"
        item5.actionBlk = { [weak self] in
            guard let self = self else {return}
            let popupView = JKBroadcastBeginAlertViewController.init()
            popupView.sureBtnDidClickedBlk = { [weak self] in
                let detail = FDEDetailViewController.init()
                detail.hidesBottomBarWhenPushed = true
                self?.navigationController?.pushViewController(detail, animated: true)
            }
            popupView.show(in: self, isWrapInNavigationController: false, animated: true, completion: nil)
        }
        dataList.append(item5)
        
        let item6 = FDEItemModel.init()
        item6.title = "use viewcontroller-宽固定,高自适应弹窗,带NavigationController"
        item6.actionBlk = { [weak self] in
            guard let self = self else {return}
            let popupView = JKBroadcastBeginAlertViewController.init()
            popupView.sureBtnDidClickedBlk = { [weak popupView] in
                let detail = FDEDetailViewController.init()
                detail.hidesBottomBarWhenPushed = true
                popupView?.navigationController?.pushViewController(detail, animated: true)
            }
            popupView.show(in: nil, isWrapInNavigationController: true, animated: true, completion: nil)
        }
        dataList.append(item6)
        
        let item7 = FDEItemModel.init()
        item7.title = "use viewcontroller-底部文本输入弹窗"
        item7.actionBlk = { [weak self] in
            let popupView = JKPublishCommentAlertViewController.init()
            popupView.show(in: nil, isWrapInNavigationController: false, animated: true)
            popupView.textView.becomeFirstResponder()
        }
        dataList.append(item7)
        
        let item8 = FDEItemModel.init()
        item8.title = "use viewcontroller-复杂弹窗"
        item8.actionBlk = { [weak self] in
            guard let self = self else {return}
            let popupView = JKSupportGroupVoteAlertViewController.init()
            popupView.confirmBtnDidClickedBlk = { [weak popupView, weak self] item in
                let detail = FDEDetailViewController.init()
                detail.hidesBottomBarWhenPushed = true
                self?.navigationController?.pushViewController(detail, animated: true)
            }
            popupView.shouldDismissOnTouchBackView = true
            popupView.show(in: nil, completion: nil)
        }
        dataList.append(item8)
        
        do {
            let item = FDEItemModel.init()
            item.title = "use viewcontroller-复杂弹窗,带NavigationController"
            item.actionBlk = { [weak self] in
                guard let self = self else {return}
                let popupView = JKSupportGroupVoteAlertViewController.init()
                popupView.confirmBtnDidClickedBlk = { [weak popupView] item in
                    let detail = FDEDetailViewController.init()
                    detail.hidesBottomBarWhenPushed = true
                    popupView?.navigationController?.pushViewController(detail, animated: true)
                }
                popupView.shouldDismissOnTouchBackView = true
                popupView.show(in: nil, isWrapInNavigationController: true, animated: true)
            }
            dataList.append(item)
        }
        
        do {
            let item = FDEItemModel.init()
            item.title = "通用弹窗"
            item.actionBlk = { [weak self] in
                guard let self = self else {return}
                let popupView = JHAlertView.init()
                popupView.titleLabel.text = "温馨提示"
                popupView.contentLabel.text = "站在车外，秦沐抬起头，仰望着那片漆黑一片、没有丝毫星光点缀的夜空。她静静地凝视着这片无尽的黑暗。"
                popupView.buttonLayoutStyle = .vertical
                popupView.onlyShowLeftBtn = false
                popupView.show(in: nil, animated: true, completion: nil)
            }
            dataList.append(item)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = item.title
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataList[indexPath.row]
        item.actionBlk?()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) { //13.0+不能设置为default
            return .darkContent
        } else {
            return .default
        }
    }
}

