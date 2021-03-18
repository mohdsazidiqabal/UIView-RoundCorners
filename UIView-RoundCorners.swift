//
//  File.swift
//
//
//  Created by Sazid Iqabal on 18/03/21.
//  Copyright © 2021 Sazid Iqabal. All rights reserved.
//

import Foundation

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, _ radius: CGFloat) {
        if #available(iOS 11, *) {
            var radii = CACornerMask()
            if(corners.contains(.topLeft)){
                radii.insert(.layerMinXMinYCorner)
            }
            if(corners.contains(.topRight)){
                radii.insert(.layerMaxXMinYCorner)
            }
            if(corners.contains(.bottomLeft)){
                radii.insert(.layerMinXMaxYCorner)
            }
            if(corners.contains(.bottomRight)){
                radii.insert(.layerMaxXMaxYCorner)
            }
            self.clipsToBounds = true
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = radii
        }
        else {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
            maskLayer.borderWidth = 1.0
            maskLayer.borderColor = UIColor.white.cgColor
        }
    }
}

private func howToCall() {
    let viewT = UIView()
    viewT.roundCorners([.bottomLeft, .bottomRight], 12)
}
