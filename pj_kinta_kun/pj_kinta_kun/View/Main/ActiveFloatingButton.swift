//
//  ActiveFloatingButton.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/17.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//

import UIKit
import SnapKit

extension MainViewController {
    final class ActiveFloatingButtonView: UIView {
        private enum State {
            case opened, animating, closed
        }
        
        let historyButton = UIButton()
        let userSettingButton = UIButton()
        let othersButton = UIButton()
        private let mainButton = UIButton()
        private var buttonState: State = .closed
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            initLayout()
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            historyButton.round()
            userSettingButton.round()
            othersButton.round()
            mainButton.round()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func initLayout() {
            addSubviews(historyButton, userSettingButton, othersButton, mainButton)
            
            historyButton.backgroundColor = UIColor.primary
            userSettingButton.backgroundColor = UIColor.primary
            othersButton.backgroundColor = UIColor.primary
            mainButton.backgroundColor = UIColor.primary
            mainButton.addTarget(self, action: #selector(openOrClose), for: .touchUpInside)
            
            historyButton.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.width.height.equalTo(45)
            }
            userSettingButton.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.width.height.equalTo(45)
            }
            othersButton.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.width.height.equalTo(45)
            }
            mainButton.snp.makeConstraints { make in
                make.edges.equalToSuperview()
                make.width.height.equalTo(55)
            }
        }
        
        @objc private func openOrClose() {
            let distance = frame.height
            
            switch buttonState {
            case .closed:
                buttonState = .animating
                UIView.animate(withDuration: 0.1, animations: {
                    self.othersButton.transform = CGAffineTransform(translationX: 0, y: -distance)
                    self.userSettingButton.transform = CGAffineTransform(translationX: 0, y: -distance)
                    self.historyButton.transform = CGAffineTransform(translationX: 0, y: -distance)
                }, completion: { _ in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.userSettingButton.transform = CGAffineTransform(translationX: 0, y: -distance * 2)
                        self.historyButton.transform = CGAffineTransform(translationX: 0, y: -distance * 2)
                    }, completion: { _ in
                        UIView.animate(withDuration: 0.1, animations: {
                            self.historyButton.transform = CGAffineTransform(translationX: 0, y: -distance * 3)
                            self.buttonState = .opened
                        })
                    })
                })
            case .animating:
                // 連打防止
                break
            case .opened:
                buttonState = .animating
                UIView.animate(withDuration: 0.1, animations: {
                    self.historyButton.transform = CGAffineTransform(translationX: 0, y: -distance * 2)
                }, completion: { _ in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.userSettingButton.transform = CGAffineTransform(translationX: 0, y: -distance)
                        self.historyButton.transform = CGAffineTransform(translationX: 0, y: -distance)
                    }, completion: { _ in
                        UIView.animate(withDuration: 0.1, animations: {
                            self.othersButton.transform = CGAffineTransform(translationX: 0, y: 0)
                            self.userSettingButton.transform = CGAffineTransform(translationX: 0, y: 0)
                            self.historyButton.transform = CGAffineTransform(translationX: 0, y: 0)
                            self.buttonState = .closed
                        })
                    })
                })
            }
        }
    }
}
