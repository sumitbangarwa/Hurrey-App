//
//  studentModel.swift
//  Student Model
//
//  Created by Sumit Bangarwa on 13/07/20.
//  Copyright © 2020 Sumit Bangarwa. All rights reserved.
//

import Foundation
import SwiftyJSON


struct student_model {
    
    var name : String = ""
    var section : String = ""
    var noOFstudents = Int()
    var latitude = Double()
    //    var longitude =
    var students: [JSON] = [JSON]()
    
    
    init() {
        
    }
    
    init(table : JSON) {
        
        name       = table["name"].stringValue
        section    = table["section"].stringValue
        students   = table["students"].arrayValue
        noOFstudents = students.count
        
        let aaa = table["students"].arrayValue
        
        for i in 0..<aaa.count {
            latitude = aaa[i]["latitude"].doubleValue
        }
        
        
        print("MODEL: ",latitude)
        
        
        
        
    }
    
    
    
    
}
