//
//  SummaryStickyView.swift
//  Weather-Clone
//
//  Created by Sojin Lee on 2022/06/09.
//

import Foundation
import UIKit
import SnapKit
import Then

class SummaryStickyView : UIView {
    private let regionLabel = UILabel().then {
        $0.text = "광진구"
        $0.font = .boldSystemFont(ofSize: 34)
        $0.textColor()
        $0.sizeToFit()
    }
    
    private let summaryLabel = UILabel().then {
        $0.text = "19º | 흐림"
        $0.font = .systemFont(ofSize: 28)
        $0.textColor()
        $0.sizeToFit()
    }
    
    private lazy var summaryStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.addArrangedSubview(regionLabel)
        $0.addArrangedSubview(summaryLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(summaryStackView)
        
        summaryStackView.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
