//
//  UserQuestionTableViewCell.swift
//  WJEduiOS
//
//  Created by samson on 25/1/2017.
//  Copyright © 2017 samson. All rights reserved.
//

import UIKit

class UserQuestionTableViewCell: UITableViewCell {

   
    weak var questContextLabel:UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createLinearRootLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //对于需要动态评估高度的UITableViewCell来说可以把布局视图暴露出来。用于高度评估和边界线处理。以及事件处理的设置。
    fileprivate(set) var rootLayout:TGBaseLayout!
    
    
    func setModel(queststring:String)
    {
       
        // self.iconImage.image = UIImage(named: imageName)
        self.questContextLabel.text = queststring
    }
    
}

extension UserQuestionTableViewCell{
    //用线性布局来实现UI界面
    func createLinearRootLayout()
    {
        
        self.rootLayout = TGLinearLayout(.vert)
        self.rootLayout.tg_width.equal(.fill)
        self.rootLayout.tg_height.equal(.wrap)
        self.contentView.addSubview(self.rootLayout)
        
        let actionLayout = TGLinearLayout(.horz)
        actionLayout.backgroundColor = UIColor.white
        
        actionLayout.tg_leftPadding = 10
        actionLayout.tg_rightPadding = 10
        actionLayout.tg_width.equal(100%)
        actionLayout.tg_height.equal(TGDimeAdapter.height(64))
        actionLayout.tg_gravity = TGGravity.vert.center //左右内边距都是10，不包裹子视图，整体高度为50，里面的子布局垂直居中对齐。
        actionLayout.tg_bottomBorderline = TGLayoutBorderline(color: AppPlist.lineColor) //设置底部和顶部都有红色
        
//        let imageView = UIImageView(image: UIImage(named: "triangle"))
//        imageView.tg_left.equal(TGDimeAdapter.width(10))
//        imageView.tg_centerY.equal(0)
//        actionLayout.addSubview(imageView)

        
        self.questContextLabel = {
            let label = UILabel()
            label.font = CFTool.fontCustomer(AppPlist.appPingFangMediumFontString, size: 13)
            label.textColor = CFTool.color(3)
            label.tg_top.equal(10)
            label.tg_bottom.equal(10)
            label.tg_left.equal(18)
            label.tg_width.equal(screenBounds.width-18*2)
            label.tg_centerY.equal(0)
            label.tg_height.equal(.wrap)
            label.numberOfLines = 0
            label.sizeToFit()
            //        label.tag = 1000
            label.tg_left.equal(50%)
            //            label.tg_right.equal(50%) //
            actionLayout.addSubview(label)
            return label
            
        }()
        
        
        
        self.rootLayout.addSubview(actionLayout)
        
    }
    
    
    
}
