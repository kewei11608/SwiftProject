//
//  MyTestTableController.swift
//  YiJiuClassRoom
//
//  Created by lidan on 2018/11/27.
//  Copyright © 2018 mac-lulu. All rights reserved.
//

import UIKit
class MyTestTableController: YJBaseViewController {
    
    override func viewDidLoad() {
        self.title = "tableview练习"
        self.initUI()
    }
    
    func initUI(){
        self.view.addSubview(self.myTableView)
        self.myTableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(self.view)
        }
    }
    
    lazy var myTableView: UITableView = {
        
        let myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: KSW, height: KSH - 44), style: UITableViewStyle.grouped)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.estimatedRowHeight = 50
        myTableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        myTableView.backgroundColor = Colorf6
        myTableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0)
//        myTableView.isScrollEnabled = false
        return myTableView
    }()
    
    

    

}
extension MyTestTableController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section==0 {
            return 150;
        }
        return 50
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0{
            return 0;
        }
        return 5;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section==0 {
            let cellIdentifierString = "MyTestTableCell"
            var cell: MyTestTableCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifierString) as? MyTestTableCell
            if cell == nil {
                cell = MyTestTableCell(style: .default, reuseIdentifier: cellIdentifierString)
                cell?.selectionStyle = .none
            }
            return cell!
       
        }else{
        
        let cellIdentifierString = "default"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifierString)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifierString)
            cell?.selectionStyle = .none
        }
        cell?.textLabel?.textColor = Color3
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 14)
            if indexPath.row==0{
                cell?.textLabel?.text = "自定义cell，网络请求"

            }else if indexPath.row==1{
                cell?.textLabel?.text = "AFN Moya网络请求"
            }
            
            else{
                cell?.textLabel?.text = "公司名称"

            }
            

        return cell!

    }
    
    
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row==0 {
            let pvc = NetWorkController()
            pvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(pvc, animated: true)
        }else if indexPath.row==1
        {
            let pvc = AFNMoyaController()
            pvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(pvc, animated: true)
            
            
            
        }
        print("\(indexPath.row)")
    }
    
    
}


