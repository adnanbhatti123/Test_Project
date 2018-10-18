//
//  NyTimesTableViewCell.swift
//  Test_Project
//
//  Created by Muhammad Arslan Khalid on 18/10/2018.
//  Copyright © 2018 3s. All rights reserved.
//

import UIKit
import SDWebImage

class NyTimesTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView:UIImageView!
    @IBOutlet weak var title:UILabel!
    @IBOutlet weak var detail:UILabel!
    @IBOutlet weak var publishedDate:UIButton!
    @IBOutlet weak var publishedBy:UILabel!
    
    
    func setCellInfo(nyTimeObj:NYTime){
    self.title.text = nyTimeObj.title
    self.detail.text = nyTimeObj.detail
    
    self.publishedBy.text?.formatString(unformattedString: nyTimeObj.writer!)
    self.publishedDate.setTitle(" \(String(describing: nyTimeObj.publishedDate!))", for: .normal)
    let placeholderImage = UIImage.init(named: "placeholder")
    self.newsImageView.sd_setImage(with: URL(string: nyTimeObj.imageUrl! as String), placeholderImage: placeholderImage)
    self.newsImageView.setRounded()
    }
    
    
    
    
}
