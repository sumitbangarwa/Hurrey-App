//
//  StudentListVC.swift
//  Hurrey App
//
//  Created by Sumit Bangarwa on 14/07/20.
//  Copyright © 2020 Sumit Bangarwa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class StudentListVC: UIViewController {
    
    @IBOutlet var studentTable: UITableView!
    
    var students: [JSON] = [JSON]()
    var className: String?
    
    var selectedMail = String()
    
    var arrdata = [student_model]()
    
    var studentCell = StudentTableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    
    
}


extension StudentListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        studentCell = studentTable.dequeueReusableCell(withIdentifier: "StudentTableViewCell") as! StudentTableViewCell
        
        studentCell.name.text = students[indexPath.row]["name"].stringValue
        
        studentCell.emailBT.addTarget(self, action: #selector(mailTapped), for: .touchUpInside)
        studentCell.emailBT.tag = indexPath.row
        
        studentCell.mobileBtn.addTarget(self, action: #selector(mobileTapped), for: .touchUpInside)
        studentCell.mobileBtn.tag = indexPath.row
        
        studentCell.Map.addTarget(self, action: #selector(MapTapped), for: .touchUpInside)
        studentCell.Map.tag = indexPath.row
        
        
        
        return studentCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedMail = students[indexPath.row]["email"].stringValue
        print("slected mai", selectedMail)
        
        
    }
    
    @objc func mailTapped(sender: UIButton) {
        print("Mail Tapped", sender.tag)
        
        //  MARK:Code for to open mail directly
        let toEmail = students[sender.tag]["email"].stringValue
        // let subject = "The subject!"
        //  let body = "It is raining in sunny California!"
        
        //opens mail app with new email started
        var email = "mailto:\(toEmail)?"
        print("email",email)
        email = (email as NSString).addingPercentEscapes(using: String.Encoding.utf8.rawValue) ?? ""
        if let url = URL(string: email) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            
        }
        
    }
    
    @objc func mobileTapped(sender: UIButton) {
        print("mobileTappped",sender.tag)
        
        let mobileNo = students[sender.tag]["mobile"].stringValue
        if let url = NSURL(string: "tel://\(mobileNo)"), UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.openURL(url as URL)
        }
        
    }
    
    @objc func MapTapped(sender: UIButton){
        print("MapTapped",sender.tag)
        
        let lat = students[sender.tag]["latitude"].doubleValue
        let long = students[sender.tag]["longitude"].doubleValue
        print("LAT LONG",lat, long)
        let mapVc = self.storyboard?.instantiateViewController(identifier: "MapVC") as! MapVC
        mapVc.lat = lat
        mapVc.long = long
        self.navigationController?.pushViewController(mapVc, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}

