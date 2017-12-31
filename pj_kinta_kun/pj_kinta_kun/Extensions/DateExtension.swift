//
//  DateExtention.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/31.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//
import Foundation

extension Date {
    private func component(_ component: Calendar.Component) -> Int {
        return Calendar.current.component(component, from: self)
    }
    
    var year: Int { return component(.year) }
    
    var month: Int { return component(.month) }
    
    var day: Int { return component(.day) }
    
    var hour: Int { return component(.hour) }
    
    var minute: Int { return component(.minute) }
}
