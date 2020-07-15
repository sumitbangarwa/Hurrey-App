//
//  Generics.swift
//  Hurrey App
//
//  Created by Sumit Bangarwa on 14/07/20.
//  Copyright © 2020 Sumit Bangarwa. All rights reserved.

import UIKit

extension UIView {
    
    //MARK:- Gradient color for background
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 2.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }

    //MARK:- Round Corners
        func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
             let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
             let mask = CAShapeLayer()
             mask.path = path.cgPath
             self.layer.mask = mask
        }

}
