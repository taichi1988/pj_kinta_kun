//
//  HistoryDayListViewController.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/18.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//

import UIKit

final class HistoryDayListViewController: UIViewController {
    private let dismissButton = UIButton()
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
        view.addSubviews(tableView, dismissButton, backButton)
        
        dismissButton.setTitle("×", for: .normal)
        dismissButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        dismissButton.setTitleColor(.primary, for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
        
        backButton.setTitle("←", for: .normal)
        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        backButton.setTitleColor(.primary, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
        tableView.backgroundColor = .white
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(HistoryDayListCell.self)
        
        dismissButton.snp.makeConstraints { make in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            } else {
                make.top.equalToSuperview().inset(20)
            }
            make.right.equalToSuperview().inset(20)
        }
        backButton.snp.makeConstraints { make in
            make.centerY.equalTo(dismissButton)
            make.left.equalToSuperview().inset(20)
        }
        tableView.snp.makeConstraintsEqualToSuperview()
    }
    
    @objc
    private func dismissButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}

extension HistoryDayListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, as: HistoryDayListCell.self)
        cell.set(startTime: "10:00", breakTime: "1h", endTime: "19:00")
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HistoryDayListHeaderView()
        return headerView
    }
}

extension HistoryDayListViewController: UITableViewDelegate {
    
}
