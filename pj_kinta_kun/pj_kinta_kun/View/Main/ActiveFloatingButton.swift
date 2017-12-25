//
//  ActiveFloatingButton.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/17.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//

import UIKit
import SnapKit

final class ActiveFloatingButtonView: UIView {
    private enum State {
        case opened, animating, closed
    }
    
    let historyButton = UIButton()
    let userSettingButton = UIButton()
    let othersButton = UIButton()
    private let mainButton = UIButton()
    private var buttonState: State = .closed
    private let margin: CGFloat = 5
    private var distance: CGFloat { return historyButton.frame.height + margin }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        historyButton.round()
        userSettingButton.round()
        othersButton.round()
        mainButton.round()
        
        historyButton.transform = affineTransform(y: distance * 3)
        userSettingButton.transform = affineTransform(y: distance * 2)
        othersButton.transform = affineTransform(y: distance * distance)
    }
    
    private func initLayout() {
        addSubviews(historyButton, userSettingButton, othersButton, mainButton)
        
        historyButton.setTitle("H", for: .normal)
        historyButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        historyButton.backgroundColor = UIColor.primary
        userSettingButton.setTitle("S", for: .normal)
        userSettingButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        userSettingButton.backgroundColor = UIColor.primary
        othersButton.setTitle("O", for: .normal)
        othersButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        othersButton.backgroundColor = UIColor.primary
        mainButton.setTitle("＋", for: .normal)
        mainButton.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        mainButton.backgroundColor = UIColor.primary
        mainButton.addTarget(self, action: #selector(openOrClose), for: .touchUpInside)
        
        historyButton.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
            make.width.height.equalTo(45)
        }
        userSettingButton.snp.makeConstraints { make in
            make.top.equalTo(historyButton.snp.bottom).offset(margin)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(45)
        }
        othersButton.snp.makeConstraints { make in
            make.top.equalTo(userSettingButton.snp.bottom).offset(margin)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(45)
        }
        mainButton.snp.makeConstraints { make in
            make.top.equalTo(othersButton.snp.bottom).offset(margin)
            make.left.right.bottom.equalToSuperview()
            make.width.height.equalTo(55)
        }
    }
    
    private func affineTransform(y: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(translationX: 0, y: y)
    }
    
    @objc private func openOrClose() {
        
        switch buttonState {
        case .closed:
            buttonState = .animating
            UIView.animate(withDuration: 0.15) {
                self.mainButton.transform = CGAffineTransform(rotationAngle: 45 * .pi / 180)
            }
            UIView.animate(withDuration: 0.05, animations: {
                self.othersButton.transform = self.affineTransform(y: 0)
                self.userSettingButton.transform = self.affineTransform(y: self.distance)
                self.historyButton.transform = self.affineTransform(y: self.distance * 2)
            }, completion: { _ in
                UIView.animate(withDuration: 0.05, animations: {
                    self.userSettingButton.transform = self.affineTransform(y: 0)
                    self.historyButton.transform = self.affineTransform(y: self.distance)
                }, completion: { _ in
                    UIView.animate(withDuration: 0.05, animations: {
                        self.historyButton.transform = self.affineTransform(y: 0)
                        self.buttonState = .opened
                    })
                })
            })
        case .animating:
            // 連打防止
            break
        case .opened:
            buttonState = .animating
            UIView.animate(withDuration: 0.15) {
                self.mainButton.transform = CGAffineTransform(rotationAngle: 0)
            }
            UIView.animate(withDuration: 0.05, animations: {
                self.historyButton.transform = self.affineTransform(y: self.distance)
            }, completion: { _ in
                UIView.animate(withDuration: 0.05, animations: {
                    self.userSettingButton.transform = self.affineTransform(y: self.distance)
                    self.historyButton.transform = CGAffineTransform(translationX: 0, y: self.distance * 2)
                }, completion: { _ in
                    UIView.animate(withDuration: 0.05, animations: {
                        self.othersButton.transform = self.affineTransform(y: self.distance)
                        self.userSettingButton.transform = self.affineTransform(y: self.distance * 2)
                        self.historyButton.transform = self.affineTransform(y: self.distance * 3)
                        self.buttonState = .closed
                    })
                })
            })
        }
    }
}

