//
//  HistoryMonthListHeaderView.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/26.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//

import UIKit

final class HistoryMonthListHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initLayout() {
        backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "Month"
        titleLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        titleLabel.textColor = .primary
        let underLine = UIView()
        underLine.backgroundColor = .primary
        
        addSubviews(titleLabel, underLine)
        
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().inset(22)
            make.bottom.equalToSuperview().inset(2)
        }
        underLine.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
