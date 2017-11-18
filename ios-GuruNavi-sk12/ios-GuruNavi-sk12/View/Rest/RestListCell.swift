//
//  RestListCell.swift
//  ios-GuruNavi-sk12
//
//  Created by S.Emoto on 2017/11/18.
//  Copyright © 2017年 S.Emoto. All rights reserved.
//

import UIKit
import AlamofireImage

class RestListCell: UITableViewCell {

    @IBOutlet weak var shopImageView: UIImageView!
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var accessStaLabel: UILabel!
    @IBOutlet weak var accessMinLabel: UILabel!
    @IBOutlet weak var shopAddressLabel: UILabel!
    @IBOutlet weak var shopTelLabel: UILabel!
    @IBOutlet weak var shopBudgetLabel: UILabel!
    
    var restData: Rest? {
        
        didSet {
            
            if let restData = self.restData {
                
                self.imageURL = restData.imageUrl
                self.shopNameLabel.text = restData.name
                self.accessStaLabel.text = restData.access!.station
                self.accessMinLabel.text = String(format: "WALK_TIME".localized(),
                                                  restData.access!.walk)
                self.shopAddressLabel.text = restData.address
                self.shopTelLabel.text = restData.tel
                shopBudgetLabel.text = restData.budget
            }
        }
    }
    
    // 写真をImageViewにセット
    fileprivate var imageURL: String = "" {
        
        didSet {
            
            if let url = URL(string: imageURL) {
                self.shopImageView.af_setImage(withURL: url)
            } else {
                let noImage = UIImage(named:"noImage")
                self.shopImageView.image = noImage
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.shopImageView.image = nil
    }
}
