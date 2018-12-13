//
//  MyTestTableCell.swift
//  YiJiuClassRoom
//
//  Created by lidan on 2018/11/27.
//  Copyright © 2018 mac-lulu. All rights reserved.
//
import Foundation

class MyTestTableCell: UITableViewCell {
    
    var dataModel:TestModel = TestModel() {
        didSet{
            if let url = dataModel.img{
                self.headImageView.kf.setImage(with: URL(string: url))
            }
            self.titleLable.text = dataModel.title

            
        }
    }
    
    
    var handModel:HandyModel = HandyModel() {
        didSet{
            if let url = handModel.img{
                self.headImageView.kf.setImage(with: URL(string: url))
            }
            self.titleLable.text = handModel.title
            
            
        }
    }
    
    
    
    
    
    lazy var headImageView: UIImageView = {
        let headImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        headImageView.backgroundColor=UIColor.red
        return headImageView
    }()
    
    lazy var titleLable: UILabel = {
        let titleLable = YJLable.getSimpleLabelNoFrame(textColor: .red, text: "", textAli: .left, textFont: 20, numLines: 1)
        return titleLable
    }()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI(){
        
        self.addSubview(self.headImageView)
        
//        let lbtitle = UILabel(frame: CGRect(x:120, y: 10, width: 200, height: 30 ))
//        lbtitle.textColor=UIColor.black
//        lbtitle.text="标题哈哈哈哈"
//        self.addSubview(lbtitle)
        self.addSubview(self.titleLable)
        self.titleLable.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(self.headImageView.snp.right).offset(10)
            make.right.equalTo(self).offset(15)
        }
        self.titleLable.text="这是标题"
        let bttest = UIButton(frame: CGRect(x: 120, y: 50, width: 100, height: 40))
        bttest.setTitleColor(UIColor.red, for: .normal)
        bttest.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        bttest.backgroundColor=UIColor.gray
        bttest.titleLabel?.font=UIFont.systemFont(ofSize: 18)
        bttest.setTitle("按钮hhh", for: .normal)

        self.addSubview(bttest)
        
        
    }
    
        @objc  func btnClick(){
    
    print("点击了哈哈哈哈哈")
    }
    
   
    
    
}


