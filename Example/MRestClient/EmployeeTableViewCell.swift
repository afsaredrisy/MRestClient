//
//  EmployeeTableViewCell.swift
//  MRestClient_Example
//
//  Created by Afsar Sir on 19/02/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    @IBOutlet weak var profile_image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var salary: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profile_image.layer.cornerRadius = profile_image.bounds.width/2
        profile_image.layer.borderWidth = 1
        profile_image.layer.borderColor = UIColor.gray.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
