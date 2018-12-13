//
//  NetWorkController.swift
//  YiJiuClassRoom
//
//  Created by lidan on 2018/11/27.
//  Copyright © 2018 mac-lulu. All rights reserved.
//

import Foundation
import Alamofire
import HandyJSON
import SwiftyJSON
import MJRefresh
class NetWorkController: YJBaseViewController {
    var dataarray:[TestModel] = []
    var liveList:[HandyModel]?
   
    
    override func viewDidLoad() {
        self.title = "网络请求"
        self.view.backgroundColor=UIColor.white
        var dict = [String : AnyObject]()
        dict["openkey"] = "1" as AnyObject

        YJApplicationService.getRequestData(requestUrl: "http://f9v0.cn/api/baseData_gameColumn", dict: dict as NSDictionary, finish: { (isSuccess, model, errorStr) in
            print("\(String(describing: model?.data))")
            
//            print("\(String(describing: model?.data))")
//            JSON(parseJSON: jsonString!)

//            dataarray.append();
        })
        
        AlamofireGetRequest()
        
//        AlamofirePostRequest()
       
    }
    
    //没有参数请求

    func AlamofireGetRequest() {
        Tool.showLoadingOnView(view: self.view)

        
        Alamofire.request("http://f9v0.cn/api/baseData_gameColumn", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON {
            (response) in if (response.error == nil)
            {
            print("Alamofire请求成功：\(response.result.value ?? "")")
               
                let dict = response.result.value
                let dict1:NSDictionary = response.result.value as! NSDictionary
                
                let data:NSDictionary = dict1["data"] as! NSDictionary

                let json = JSON(dict!)
                //HandyJSON  解析
                if let mappedObject = JSONDeserializer<HandyModel>.deserializeModelArrayFrom(json: json["data"]["gamelist"].description) {
                    self.liveList = mappedObject as? [HandyModel]
                }
                print("\(String(describing: self.liveList?.count))")
                
                let handmodel =  self.liveList?[0]

                print("2222\(String(describing: handmodel?.title))-----\(String(describing: handmodel?.subtitle))")

                
                let arr:NSArray = data["gamelist"] as! NSArray

//            model内解析
                var results = [GameMoel]()   //模型一键赋值
                for item in arr {
//                    let result = GameMoel(dict: item as! [String: AnyObject])
                    let result = GameMoel(dic: item as! [String : AnyObject])
                    results.append(result)
                    print("\(String(describing: result.title))-----\(results.count)")
                }
                
//                外部解析
                for i in 0 ..< arr.count
                {
                let dict:NSDictionary = arr[i] as! NSDictionary
                let model = TestModel()        
                model.betTime = dict.object(forKey: "betTime") as! String
                model.openTime = dict.object(forKey: "openTime") as! String
                model.img = dict.object(forKey: "img") as! String
                model.subtitle = dict.object(forKey: "subtitle") as! String
                model.title = (dict.object(forKey: "title") as! String)

//                    print("\(model.title)")
                self.dataarray.append(model)
                    
                }
                Tool.hideLodingOnView(view: self.view)

                print("\(self.dataarray.count)")
                
                
                self.initUI()
//                let ljTempArray : NSArray = dict1["gamelist"]  as! NSArray
//
//                print("\(ljTempArray.count)")
//                var collections = [TestModel]()
//                for item in collectionsData {
//                    let collection = YMCollection(dict: item as! [String: AnyObject])
//                    collections.append(collection)
//                }
                
                //  字典转成模型
//                if let items = dict1!["gamelist"] ?.arrayObject {
                
//                    var homeItems = [TestModel]()
//                    for item in ljTempArray {
//                        let homeItem = TestModel(dict: item as! [String: AnyObject])
//                        homeItems.append(homeItem)
//                    }

//                }
                
                Tool.showHUDWithText(text: "text: model?.msg")

                
        }
            else
            {
                print("Alamofire请求失败：\(response.error ?? "" as! Error)")
            
            }
        }
    }
    
    
    
//    有参数请求
    func AlamofirePostRequest() {
        let dic: [String: String] = ["type": "1"] // 参数 // JSONEncoding.prettyPrinted 是提交json
        Alamofire.request("https://ceshi.ppljg.com/?/app/mobile/lottery", method: .post, parameters: dic, encoding: URLEncoding.default, headers: nil).responseJSON {
            (response) in
            if response.error == nil {
                print("Post 请求成功：\(response.result.value ?? "")")
                
            }else{
                print("Post 请求失败：\(response.error ?? "" as! Error)")
                
            }
            
        }
        
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
        //下拉刷新相关设置
        // 顶部刷新
        let header = MJRefreshNormalHeader()
        let fooder=MJRefreshAutoNormalFooter()
        
        header.setRefreshingTarget(self, refreshingAction: #selector(self.headerRefresh))
        myTableView.mj_header = header
        myTableView.mj_footer=fooder
        
        //下拉刷新相关设置,使用闭包Block
        myTableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            print("下拉刷新.")
            sleep(1)
            //重现生成数据
            //    self.refreshItemData()
            //重现加载表格数据
            myTableView.reloadData()
            //结束刷新
            myTableView.mj_header.endRefreshing()
        })
        
        
        myTableView.mj_footer=MJRefreshAutoNormalFooter(refreshingBlock: {
            print("上拉加载.")
            sleep(1)
            //重现生成数据
            //    self.refreshItemData()
            //重现加载表格数据
            myTableView.reloadData()
            //结束刷新
            myTableView.mj_footer.endRefreshing()
            myTableView.mj_footer.endRefreshingWithNoMoreData()
        })
        
        
        return myTableView
    }()
    
    
   
    
    
    
    //顶部下拉刷新
    func headerRefresh(){
        print("下拉刷新.")
        sleep(1)
//        //重现生成数据
//        refreshItemData()
        //重现加载表格数据
        myTableView.reloadData()
        //结束刷新
        myTableView.mj_header.endRefreshing()
    }
    
    
    
}
extension NetWorkController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150;
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      return   self.dataarray.count
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
        let cellIdentifierString = "MyTestTableCell"
        var cell: MyTestTableCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifierString) as? MyTestTableCell
        if cell == nil {
            cell = MyTestTableCell(style: .default, reuseIdentifier: cellIdentifierString)
            cell?.selectionStyle = .none
        }
//        cell?.dataModel = self.dataarray[indexPath.row]
 
        cell?.handModel=self.liveList![indexPath.row]
        return cell!
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        
}
}

