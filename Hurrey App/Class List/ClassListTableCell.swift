//
//  ClassListTableCell.swift
//  Hurrey App
//
//  Created by Sumit Bangarwa on 14/07/20.
//  Copyright © 2020 Sumit Bangarwa. All rights reserved.
//

import UIKit

class ClassListTableCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet var Circular_IMG: UILabel!
    @IBOutlet var className: UILabel!
    @IBOutlet var section: UILabel!
    
    @IBOutlet var noOfStudents: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        Circular_IMG.layer.masksToBounds = true
        Circular_IMG.layer.cornerRadius = Circular_IMG.bounds.width / 2
        Circular_IMG.layer.borderWidth = 1
        Circular_IMG.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        bgView.layer.cornerRadius = 15
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.lightGray.cgColor
        
       
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
