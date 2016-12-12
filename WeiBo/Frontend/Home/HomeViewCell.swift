//
//  HomeViewCell.swift
//  WeiBo
//
//  Created by Chris on 2016/12/10.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewCell: UITableViewCell {
    @IBOutlet weak var contentLabelWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var avatorImageView: UIImageView!
    @IBOutlet weak var verifiedImageView: UIImageView!
    @IBOutlet weak var vipImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatorImageView.layer.cornerRadius = 20.0
        avatorImageView.layer.borderColor = UIColor.lightGray.cgColor
        avatorImageView.layer.borderWidth = 1 / UIScreen.main.scale
        avatorImageView.clipsToBounds = true
        
        contentLabelWidthConstraint.constant = UIScreen.main.bounds.width - (2 * 15)
    }

    /// Load data from the Status
    var status: Status = Status() {
        didSet {
            titleLabel.text = status.user?.screenName
            timeLabel.text = time
            sourceLabel.text = status.source
            contentLabel.text = status.text
            
            verifiedImageView.image = verifiedImage
            vipImageView?.image = vipImage
            
            avatorImageView.kf.setImage(with: URL(string: (status.user?.avatarLarge)!), placeholder: UIImage(named: "avator_default"))
            
            // <a href=\"http://app.weibo.com/t/feed/6vtZb0\" rel=\"nofollow\">\U5fae\U535a weibo.com</a>
        }
    }
}

extension HomeViewCell {
    /// 认证图片
    fileprivate var verifiedImage: UIImage? {
        guard let verifiedType = status.user?.verifiedType else { return nil }
        switch verifiedType {
        case 0: return UIImage(named: "avatar_vip")
        case 2, 3, 5: return UIImage(named: "avatar_enterprise_vip")
        case 220: return UIImage(named: "avatar_grassroot")
        default: break
        }
        
        return nil
    }

    /// vip 图片
    fileprivate var vipImage: UIImage? {
        guard let mbrank = status.user?.mbrank else { return nil }
        if mbrank > 0 && mbrank < 7 {
            return UIImage(named: "common_icon_membership_level\(mbrank)")
        }
        
        return nil
    }
    
    /// 时间
    fileprivate var time: String {
        // Sat Dec 10 23:32:03 +0800 2016
        // EEE MMM d HH:mm:ss Z yyyy

        let fmt = DateFormatter()
        fmt.dateFormat = "EEE MMM d HH:mm:ss Z yyyy"
        let date = fmt.date(from: status.createdAt)!
        
        let calendar = Calendar.current
        let coms = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date, to: Date())
        print(coms.year ?? "", coms.month ?? "", coms.day ?? "", coms.hour ?? "", coms.minute ?? "", coms.second ?? "")
        
//        if com.year! > 1 {
//            fmt.dateFormat = "yyyy-MM-dd"
//        } else if com.month! > 1{
//            fmt.dateFormat = "MM-dd"
//        } else if com.day! > 1 {
//            fmt.dateFormat = "昨天 HH:mm"
//        } else if com.hour! > 1 {
//            fmt.dateFormat = "mm:ss"
//        } else if com.minute! > 60 {
//            fmt.dateFormat = "mm 分钟前"
//        } else {
//            fmt.dateFormat = ""
//        }
        
        
        return fmt.string(from: date)
    }
}
