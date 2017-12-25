//
//  UIViewExtension.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/17.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//

import UIKit

extension UIView {
    func setCorner(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func round() {
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach(addSubview(_:))
    }
}
