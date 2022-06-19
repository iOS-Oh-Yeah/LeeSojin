//
//  HomeView.swift
//  Weather-Clone
//
//  Created by Sojin Lee on 2022/06/06.
//

import UIKit
import SnapKit
import Then

class SummaryHeaderView: UIView {
    let regionLabel = UILabel().then {
        $0.text = "광진구"
        $0.font = .boldSystemFont(ofSize: 34)
        $0.textColor()
        $0.sizeToFit()
    }
    
    let tempLabel = UILabel().then {
        $0.text = "19º"
        $0.font = .systemFont(ofSize: 100)
        $0.textColor()
        $0.sizeToFit()
    }
    
    let summaryTempLabel = UILabel().then {
        $0.text = "흐림"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor()
        $0.sizeToFit()
    }
    
    let secondSummaryTempLabel = UILabel().then {
        $0.text = "최고 :25º 최저:16º"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor()
        $0.sizeToFit()
    }
    
    lazy var summaryStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.addArrangedSubview(regionLabel)
        $0.addArrangedSubview(tempLabel)
        $0.addArrangedSubview(summaryTempLabel)
        $0.addArrangedSubview(secondSummaryTempLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(summaryStackView)
        
        summaryStackView.snp.makeConstraints {
            $0.height.equalTo(200)
            $0.top.bottom.equalToSuperview()
        }
    }
}
