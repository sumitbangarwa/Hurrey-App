//
//  ClassListVC.swift
//  Hurrey App
//
//  Created by Sumit Bangarwa on 14/07/20.
//  Copyright © 2020 Sumit Bangarwa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ClassListVC: UIViewController {
    
    
    @IBOutlet var SchoolTable: UITableView!
    
    var schoolCell = ClassListTableCell()
    var arrdata = [student_model]()

    override func viewDidLoad() {
        super.viewDidLoad()

       callingAPI()
    }
    

  func callingAPI() {
        
    
    let Url = "https://w3dnetwork.com/api/08fe8af137d079a82cc1cb7035e66086.json"

         Alamofire.request(Url, method: .get).responseJSON {
            (response) in
          if response.result.isSuccess {

                let jsonResposne: JSON = JSON(response.result.value!)
//                print("RESPONSE : ", schoolLIST)

                let classesList = jsonResposne["classes"].arrayValue
                print("classesLSIT: \(classesList)")

                if classesList == [] {
                                 print("list empty")
                             }
                             else {
                                 self.arrdata.removeAll()
                                 for arr in (classesList) {
                                     self.arrdata.append(student_model(table: arr))
                                 }
                                 self.SchoolTable.reloadData()
                             }





            }
            else {
                print("Error: \(response.result.error)")
            }
        }
        
        
    }
}


extension ClassListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        schoolCell = SchoolTable.dequeueReusableCell(withIdentifier: "ClassListTableCell") as! ClassListTableCell

        schoolCell.Circular_IMG.text    = arrdata[indexPath.row].name
        schoolCell.className.text       = "class " + arrdata[indexPath.row].name
        schoolCell.section.text         = "Section " + arrdata[indexPath.row].section
        schoolCell.noOfStudents.text    = "No of Students " + "\(arrdata[indexPath.row].noOFstudents)"
        
        return schoolCell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let studentVC = self.storyboard?.instantiateViewController(identifier: "StudentListVC") as! StudentListVC
        
        studentVC.students = arrdata[indexPath.row].students
        studentVC.className = arrdata[indexPath.row].name
        self.navigationController?.pushViewController(studentVC, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

