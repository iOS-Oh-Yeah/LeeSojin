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
    // MARK: - Properties
    private let regionLabel = UILabel().then {
        $0.text = "광진구"
        $0.font = .systemFont(ofSize: 30)
        $0.sizeToFit()
    }
    
    private let tempLabel = UILabel().then {
        $0.text = "19º"
        $0.font = .systemFont(ofSize: 60)
        $0.sizeToFit()
    }
    
    private let summaryTempLabel = UILabel().then {
        $0.text = "부분적으로 흐림"
        $0.font = .boldSystemFont(ofSize: 18)
    }
    
    private lazy var summaryStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.addArrangedSubview(regionLabel)
        $0.addArrangedSubview(tempLabel)
        $0.addArrangedSubview(summaryTempLabel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

}

extension HomeVC {
    private func configureUI(){
        view.backgroundColor = .white
        view.addSubview(summaryStackView)
        
        summaryStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
        }
    }
}
