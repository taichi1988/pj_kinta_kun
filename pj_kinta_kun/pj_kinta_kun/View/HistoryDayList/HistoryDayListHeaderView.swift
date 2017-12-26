//
//  HistoryDayListHeaderView.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/27.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//

import UIKit

class HistoryDayListHeaderView: UIView {
    let monthLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initLayout() {
        backgroundColor = .white
        
        monthLabel.text = "October"
        monthLabel.textColor = .primary
        monthLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        let underLine = UIView()
        underLine.backgroundColor = .primary
        
        addSubviews(monthLabel, underLine)
        
        monthLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(22)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(2)
        }
        underLine.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(1)
        }
    }
}
