//
//  AppExtensions.swift
//  Hurrey App
//
//  Created by Sumit Bangarwa on 16/07/20.
//  Copyright © 2020 Sumit Bangarwa. All rights reserved.
//

import Foundation
import UIKit


extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
