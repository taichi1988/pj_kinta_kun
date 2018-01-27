//
//  SplashViewController.swift
//  pj_kinta_kun
//
//  Created by 行木太一 on 2017/12/17.
//  Copyright © 2017年 ManhattanCode.Inc. All rights reserved.
//

import UIKit

/// スプラッシュ画面
final class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let vc = InitialSettingViewController()
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            if let vc = R.storyboard.main.instantiateInitialViewController() {
//                vc.modalTransitionStyle = .crossDissolve
//                self.present(vc, animated: true, completion: nil)
//            }
//        }
    }
}
