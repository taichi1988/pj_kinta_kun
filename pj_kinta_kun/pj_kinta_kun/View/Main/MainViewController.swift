//
//  MainViewController.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/17.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet weak var floatingButtonView: ActiveFloatingButtonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        floatingButtonView.historyButton.addTarget(self, action: #selector(toHistoryView), for: .touchUpInside)
        floatingButtonView.userSettingButton.addTarget(self, action: #selector(toUserSettingView), for: .touchUpInside)
        floatingButtonView.othersButton.addTarget(self, action: #selector(toOthersView), for: .touchUpInside)
    }
    
    @objc private func toHistoryView() {
        let vc = HistoryMonthListViewController()
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func toUserSettingView() {
        let vc = UserSettingViewController()
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func toOthersView() {
        let vc = OthersViewController()
        present(vc, animated: true, completion: nil)
    }
}
