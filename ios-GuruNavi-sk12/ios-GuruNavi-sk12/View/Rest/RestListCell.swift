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

    // MARK: - IBOutlet
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
                
                imageURL = restData.imageUrl
                shopNameLabel.text = restData.name
                accessStaLabel.text = restData.access!.station
                accessMinLabel.text = String(format: "WALK_TIME".localized(), restData.access!.walk)
                shopAddressLabel.text = restData.address
                shopTelLabel.text = restData.tel
                shopBudgetLabel.text = restData.budget
            }
        }
    }
    
    // 写真をImageViewにセット
    private var imageURL: String = "" {
        
        didSet {
            
            if let url = URL(string: imageURL) {
                shopImageView.af_setImage(withURL: url)
            } else {
                let noImage = UIImage(named:"noImage")
                shopImageView.image = noImage
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        shopImageView.image = nil
    }
}
