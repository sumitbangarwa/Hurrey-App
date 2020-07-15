//
//  StudentTableViewCell.swift
//  Hurrey App
//
//  Created by Sumit Bangarwa on 14/07/20.
//  Copyright © 2020 Sumit Bangarwa. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet var name: UILabel!
    @IBOutlet var emailBT: UIButton!
    @IBOutlet var mobileBtn: UIButton!
    @IBOutlet var Map: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        emailBT.layer.masksToBounds = true
        emailBT.layer.borderWidth = 0.8
        emailBT.layer.borderColor = UIColor.lightGray.cgColor
        emailBT.layer.cornerRadius = 15
        
        mobileBtn.layer.masksToBounds = true
        mobileBtn.layer.borderWidth = 0.8
        mobileBtn.layer.borderColor = UIColor.lightGray.cgColor
        mobileBtn.layer.cornerRadius = 15
        
        Map.layer.masksToBounds = true
        Map.layer.borderWidth = 0.8
        Map.layer.borderColor = UIColor.lightGray.cgColor
        Map.layer.cornerRadius = 15
        
        bgView.layer.cornerRadius = 15
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.lightGray.cgColor
    }

    
    
    
    
}
