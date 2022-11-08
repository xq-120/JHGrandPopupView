//
//  ViewController.swift
//  DemonSwift
//
//  Created by xuequan on 2020/1/30.
//  Copyright © 2020 xuequan. All rights reserved.
//

import UIKit

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
            popupView.show(in: self.tabBarController!.view, completion: nil)
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
            popupView.animationType = .present
            popupView.show(in: self.tabBarController!.view, completion: nil)
        }
        dataList.append(item4)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = item.title
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataList[indexPath.row]
        item.actionBlk?()
    }
}

