//
//  ButtonAreaView.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/26.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//

import UIKit
import SnapKit

final class ButtonAreaView: UIView {
    let startWorkButton = makeShadowButton(title: "出勤", color: .primary)
    let breakTimeButton = makeShadowButton(title: "休憩", color: .primary)
    let endWorkButton = makeShadowButton(title: "退勤", color: .primary)
    let startWorkTimeLabel = UILabel()
    let breakTimeLabel = UILabel()
    let endWorkTimeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initLayout() {
        addUnderLine(to: startWorkTimeLabel, breakTimeLabel, endWorkTimeLabel)
        
        let startWorkStackView = UIStackView(arrangedSubviews: [startWorkButton, startWorkTimeLabel])
        startWorkStackView.spacing = 4
        let breakTimeStackView = UIStackView(arrangedSubviews: [breakTimeButton, breakTimeLabel])
        breakTimeStackView.spacing = 4
        let endWorkStackView = UIStackView(arrangedSubviews: [endWorkButton, endWorkTimeLabel])
        endWorkStackView.spacing = 4
        
        let verticalStackView = UIStackView(arrangedSubviews: [startWorkStackView, breakTimeStackView, endWorkStackView])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 8
        
        addSubview(verticalStackView)
        verticalStackView.snp.makeConstraintsEqualToSuperview()
    }
    
    private func addUnderLine(to labels: UILabel...) {
        labels.forEach { label in
            let line = UIView()
            line.backgroundColor = UIColor.primary
            label.addSubview(line)
            line.snp.makeConstraints { make in
                make.left.right.bottom.equalToSuperview()
                make.height.equalTo(1)
            }
        }
    }
}

private func makeShadowButton(title: String, color: ShadowButton.Style.Color) -> ShadowButton {
    let button = ShadowButton(title: title, color: color)
    button.snp.makeConstraints { make in
        make.width.equalTo(80)
    }
    return button
}
