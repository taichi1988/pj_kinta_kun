//
//  HistoryDayListViewController.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/18.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//

import UIKit

final class HistoryDayListViewController: UIViewController {
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
        tableView.snp.makeConstraintsEqualToSuperview()
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
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HistoryDayListHeaderView()
        return headerView
    }
}

extension HistoryDayListViewController: UITableViewDelegate {
    
}
