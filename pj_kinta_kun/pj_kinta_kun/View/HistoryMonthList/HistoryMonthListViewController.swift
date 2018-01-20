//
//  HistoryMonthListViewController.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/18.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//

import UIKit

final class HistoryMonthListViewController: UIViewController {
    private let backButton = UIButton()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLayout()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let statusBarBackView = UIView()
        statusBarBackView.backgroundColor = .white
        statusBarBackView.frame = UIApplication.shared.statusBarFrame
        view.addSubview(statusBarBackView)
    }
    
    private func initLayout() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        view.addSubviews(tableView, backButton)
        
        tableView.backgroundColor = .white
        tableView.rowHeight = 60
        tableView.register(HistoryMonthListCell.self)
        
        backButton.setTitle("×", for: .normal)
        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        backButton.setTitleColor(.primary, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
        backButton.snp.makeConstraints { make in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            } else {
                make.top.equalToSuperview().inset(20)
            }
            make.right.equalToSuperview().inset(20)
        }
        tableView.snp.makeConstraintsEqualToSuperview()
    }
    
    @objc
    private func backButtonAction() {
        dismiss(animated: true, completion: nil)
    }
}

extension HistoryMonthListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, as: HistoryMonthListCell.self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HistoryMonthListHeaderView()
        return headerView
    }
}

extension HistoryMonthListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = HistoryDayListViewController()
        show(vc, sender: nil)
    }
}
