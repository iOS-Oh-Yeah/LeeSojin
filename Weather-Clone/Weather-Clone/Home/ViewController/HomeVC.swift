//
//  HomeVC.swift
//  Weather-Clone
//
//  Created by Sojin Lee on 2022/06/06.
//

import UIKit
import SnapKit
import Then

class HomeVC: UIViewController {
    private let homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

extension HomeVC {
    private func configureUI(){
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        view.addSubview(homeView)

        homeView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
    }
}
