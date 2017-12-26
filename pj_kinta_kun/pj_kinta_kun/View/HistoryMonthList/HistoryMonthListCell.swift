//
//  HistoryMonthListCell.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/26.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//

import UIKit

final class HistoryMonthListCell: UITableViewCell, CellReusable {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initLayout() {
        accessoryType = .disclosureIndicator
        
        let monthLabel = UILabel()
        monthLabel.text = "October"
        monthLabel.textColor = UIColor.primary
        monthLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        let yearLabel = UILabel()
        yearLabel.text = "2017"
        yearLabel.textColor = UIColor.primary
        yearLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        contentView.addSubviews(monthLabel, yearLabel)
        
        monthLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(5)
        }
        yearLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(30)
            make.bottom.equalTo(monthLabel)
        }
    }
}
