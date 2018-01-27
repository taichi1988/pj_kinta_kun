//
//  TmpViewController.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2018/01/27.
//  Copyright © 2018年 ManhattanCode.Inc. All rights reserved.
//

import UIKit
import Charts

//TODO: tmp
private struct WorkTimeItem {
    var month: Int
    var hour: Double
}

class TmpViewController: UIViewController {
    private let lineChartView = LineChartView()
    private var items: [WorkTimeItem] = [] {
        didSet {
            guard !items.isEmpty else { return }
            reloadChart()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLayout()
        initChartView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchDate()
    }
    
    private func initLayout() {
        view.backgroundColor = .white
        
        view.addSubview(lineChartView)
        lineChartView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(350)
        }
    }
    
    private func initChartView() {
        lineChartView.leftAxis.drawGridLinesEnabled = false
        lineChartView.rightAxis.drawGridLinesEnabled = false
        lineChartView.xAxis.drawGridLinesEnabled = false
        lineChartView.rightAxis.enabled = false
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.chartDescription?.enabled = false
        lineChartView.animate(yAxisDuration: 1.0)
    }

    private func fetchDate() {
        let items: [WorkTimeItem] = [WorkTimeItem(month: 4, hour: 20),
                                     WorkTimeItem(month: 5, hour: 18),
                                     WorkTimeItem(month: 6, hour: 19),
                                     WorkTimeItem(month: 7, hour: 20),
                                     WorkTimeItem(month: 8, hour: 17),]
       self.items = items
    }
    
    private func reloadChart() {
        let entries = items.map { BarChartDataEntry(x: Double($0.month), y: $0.hour) }
        let dateSet = LineChartDataSet(values: entries, label: nil)
        dateSet.drawCirclesEnabled = false
        dateSet.drawFilledEnabled = true
//        dateSet.fillAlpha = 1
        dateSet.fillColor = .cyan
        lineChartView.data = LineChartData(dataSets: [dateSet])
    }
}
