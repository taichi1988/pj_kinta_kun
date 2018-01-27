//
//  InitialSettingViewController.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2018/01/21.
//  Copyright © 2018年 ManhattanCode.Inc. All rights reserved.
//

import UIKit

final class InitialSettingViewController: UIViewController {
    private let nameFormView = FormView(title: "Name", placeholder: "Taichi")
    private let lowestTimeFormView = FormView(title: "Lowest time", placeholder: "140h")
    private let truncationTimeView = FormView(title: "Truncation time", placeholder: "30min")
    private let pushNotificationView = PushNotificationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLayout()
    }
    
    private func initLayout() {
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        let stackView = UIStackView(arrangedSubviews: [nameFormView, lowestTimeFormView, truncationTimeView])
        view.addSubviews(titleLabel, stackView, pushNotificationView)
        
        titleLabel.text = "Your Setting"
        titleLabel.textColor = .primary
        titleLabel.font = UIFont.boldSystemFont(ofSize: cgFloatResized(50))
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        titleLabel.snp.makeConstraints { make in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            } else {
                make.top.equalToSuperview().inset(10)
            }
            make.centerX.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
        }
        pushNotificationView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.left.right.equalTo(stackView)
        }
    }
}

extension InitialSettingViewController {
    final class FormView: UIView {
        private let titleLabel = UILabel()
        let textField = UITextField()
        
        init(title: String, placeholder: String) {
            super.init(frame: .zero)
            
            addSubviews(titleLabel, textField)
            
            titleLabel.text = title
            titleLabel.textColor = .primary
            titleLabel.font = UIFont.boldSystemFont(ofSize: cgFloatResized(18))
            textField.placeholder = placeholder
            textField.font = UIFont.systemFont(ofSize: 18)
            textField.textColor = .darkText
            textField.backgroundColor = UIColor.primary.withAlphaComponent(0.2)
            textField.borderStyle = .roundedRect
            
            titleLabel.snp.makeConstraints { make in
                make.left.centerY.equalToSuperview()
            }
            textField.snp.makeConstraints { make in
                make.top.right.bottom.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(0.5)
                make.height.equalTo(50)
            }
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    final class PushNotificationView: UIView {
        private let titleLabel = UILabel()
        private let toggleSwitch = UISwitch()
        private let expandableView = UIView()
        private let noticeTimeTitleLabel = UILabel()
        private let amTextField = UITextField()
        private let pmTextField = UITextField()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            addSubviews(titleLabel, toggleSwitch, expandableView)
            
            titleLabel.text = "Push notification"
            titleLabel.textColor = .primary
            titleLabel.font = UIFont.boldSystemFont(ofSize: cgFloatResized(18))
            toggleSwitch.isOn = true
            toggleSwitch.onTintColor = .primary
            toggleSwitch.addTarget(self, action: #selector(switchAction), for: .valueChanged)
            
            expandableView.addSubviews(noticeTimeTitleLabel, amTextField, pmTextField)
            noticeTimeTitleLabel.text = "Notification time"
            noticeTimeTitleLabel.textColor = .primary
            noticeTimeTitleLabel.font = UIFont.boldSystemFont(ofSize: cgFloatResized(18))
            amTextField.placeholder = "10:00"
            amTextField.font = UIFont.systemFont(ofSize: cgFloatResized(18))
            amTextField.textColor = .darkText
            amTextField.backgroundColor = UIColor.primary.withAlphaComponent(0.2)
            amTextField.borderStyle = .roundedRect
            pmTextField.placeholder = "19:00"
            pmTextField.font = UIFont.systemFont(ofSize: cgFloatResized(18))
            pmTextField.textColor = .darkText
            pmTextField.backgroundColor = UIColor.primary.withAlphaComponent(0.2)
            pmTextField.borderStyle = .roundedRect
            
            titleLabel.snp.makeConstraints { make in
                make.left.centerY.equalToSuperview()
            }
            toggleSwitch.snp.makeConstraints { make in
                make.top.right.bottom.equalToSuperview()
            }
            expandableView.snp.makeConstraints { make in
                make.top.equalTo(toggleSwitch.snp.bottom).offset(20)
                make.left.equalTo(titleLabel)
                make.right.equalTo(toggleSwitch)
            }
            noticeTimeTitleLabel.snp.makeConstraints { make in
                make.left.centerY.equalToSuperview()
            }
            amTextField.snp.makeConstraints { make in
                make.top.right.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(0.5)
                make.height.equalTo(50)
            }
            pmTextField.snp.makeConstraints { make in
                make.top.equalTo(amTextField.snp.bottom).offset(10)
                make.right.width.equalTo(amTextField)
                make.height.equalTo(50)
                make.bottom.equalToSuperview()
            }
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        @objc
        private func switchAction() {
            if toggleSwitch.isOn {
                expandableView.isUserInteractionEnabled = true
                UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut], animations: {
                    self.expandableView.transform = CGAffineTransform.identity
                    self.expandableView.alpha = 1
                })
            } else {
                expandableView.isUserInteractionEnabled = false
                UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn], animations: {
                    self.expandableView.transform = CGAffineTransform(translationX: 0, y: -self.expandableView.frame.height)
                    self.expandableView.alpha = 0
                })
            }
        }
    }
}

private func cgFloatResized(_ float: CGFloat) -> CGFloat {
    let value: CGFloat = 375 //iPhone8
    let rate = UIScreen.main.bounds.width / value
    return float * rate
}
