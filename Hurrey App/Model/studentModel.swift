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
    var students: [JSON] = [JSON]()
    
    
    init() {
        
    }
    
    init(table : JSON) {
        
        name       = table["name"].stringValue
        section    = table["section"].stringValue
        
       students   = table["students"].arrayValue
        print("STUDENT MODEL:",students)
        noOFstudents = students.count
        
        
        print("MODEL: ",name,section,students)
        
        
        
        
    }
    

    
    
}
