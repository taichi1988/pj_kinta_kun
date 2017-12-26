//
//  HistoryDayListCell.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/27.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//

import UIKit

final class HistoryDayListCell: UITableViewCell, CellReusable {
    private let dayLabel = UILabel()
    private let startWorkTimeLabel = makeLabel()
    private let breakTimeLabel = makeLabel()
    private let endWorkTimeLabel = makeLabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initLayout() {
        let startLabel = makeLabel(text: "出勤")
        let breakLabel = makeLabel(text: "休憩")
        let endLabel = makeLabel(text: "退勤")
        
        let startStackView = UIStackView(arrangedSubviews: [startLabel, startWorkTimeLabel])
        startStackView.spacing = 8
        let breakStackView = UIStackView(arrangedSubviews: [breakLabel, breakTimeLabel])
        breakStackView.spacing = 8
        let endStackView = UIStackView(arrangedSubviews: [endLabel, endWorkTimeLabel])
        endStackView.spacing = 8
        let verticalStackView = UIStackView(arrangedSubviews: [startStackView, breakStackView, endStackView])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 4
        
        contentView.addSubviews(dayLabel, verticalStackView)
        
        dayLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        dayLabel.textColor = .primary
        
        dayLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
        }
        verticalStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.left.equalTo(dayLabel.snp.right).offset(20)
        }
    }
    
    func set(startTime: String, breakTime: String, endTime: String) {
        startWorkTimeLabel.text = startTime
        breakTimeLabel.text = breakTime
        endWorkTimeLabel.text = endTime
    }
}

private func makeLabel(text: String? = nil) -> UILabel {
    let label = UILabel()
    label.text = text ?? ""
    label.textColor = .primary
    label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    return label
}
