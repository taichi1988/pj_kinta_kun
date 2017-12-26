//
//  HistoryMonthListViewController.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/18.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//

import UIKit

final class HistoryMonthListViewController: UIViewController {
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLayout()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func initLayout() {
        view.addSubviews(tableView)
        tableView.backgroundColor = .white
        tableView.rowHeight = 60
        tableView.register(HistoryMonthListCell.self)
        
        tableView.snp.makeConstraintsEqualToSuperview()
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
    }
}
