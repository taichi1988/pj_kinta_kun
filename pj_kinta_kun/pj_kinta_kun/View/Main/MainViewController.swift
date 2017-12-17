//
//  MainViewController.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/17.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    private let floatingButtonView = ActiveFloatingButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initLayout()
    }
    
    private func initLayout() {
        view.addSubview(floatingButtonView)
        
        floatingButtonView.snp.makeConstraints { make in
            make.right.bottom.equalToSuperview().inset(20)
        }
    }
}
