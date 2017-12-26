//
//  MainViewController.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/17.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    private let buttonAreaView = ButtonAreaView()
    private let floatingButtonView = ActiveFloatingButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLayout()
        initButtonAction()
    }
    
    private func initLayout() {
        let titleLabel = UILabel()
        titleLabel.text = "KINTA"
        titleLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        titleLabel.textColor = UIColor.primary
        let borderLine = UIView()
        borderLine.backgroundColor = UIColor.primary
        
        view.addSubviews(titleLabel, borderLine, buttonAreaView, floatingButtonView)
        
        titleLabel.snp.makeConstraints { make in
            if #available(iOS 11, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(22)
            } else {
                make.top.equalToSuperview().inset(22)
            }
            make.left.equalToSuperview().inset(22)
        }
        borderLine.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.firstBaseline).offset(3)
            make.left.equalTo(titleLabel)
            make.right.equalToSuperview()
            make.height.equalTo(1)
        }
        buttonAreaView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.right.equalTo(floatingButtonView.snp.left).offset(-20)
            if #available(iOS 11, *) {
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20)
            } else {
                make.bottom.equalToSuperview().inset(20)
            }
        }
        floatingButtonView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20)
            make.bottom.equalTo(buttonAreaView)
        }
    }
    
    private func initButtonAction() {
        buttonAreaView.startWorkButton.addTarget(self, action: #selector(startWorkButtonAction), for: .touchUpInside)
        buttonAreaView.breakTimeButton.addTarget(self, action: #selector(breakTimeButtonAction), for: .touchUpInside)
        buttonAreaView.endWorkButton.addTarget(self, action: #selector(endWorkButtonAction), for: .touchUpInside)
        floatingButtonView.historyButton.addTarget(self, action: #selector(toHistoryView), for: .touchUpInside)
        floatingButtonView.userSettingButton.addTarget(self, action: #selector(toUserSettingView), for: .touchUpInside)
        floatingButtonView.othersButton.addTarget(self, action: #selector(toOthersView), for: .touchUpInside)
    }
    
    @objc private func toHistoryView() {
        let vc = HistoryMonthListViewController()
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
    
    @objc private func toUserSettingView() {
        let vc = UserSettingViewController()
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func toOthersView() {
        let vc = OthersViewController()
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func startWorkButtonAction() {}
    @objc private func breakTimeButtonAction() {}
    @objc private func endWorkButtonAction() {}
}
