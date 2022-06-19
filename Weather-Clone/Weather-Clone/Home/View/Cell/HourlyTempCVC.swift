//
//  HourlyTempCVC.swift
//  Weather-Clone
//
//  Created by Sojin Lee on 2022/06/09.
//

import UIKit
import SnapKit
import Then

class HourlyTempCVC: UICollectionViewCell {
    static let identifier = "HourlyTempCVC"
    let hourlyLabel = UILabel().then {
        $0.text = "지금"
        $0.font = .systemFont(ofSize: 15)
        $0.textColor()
        $0.sizeToFit()
    }
    
    let tempIcon = UIImageView().then {
        $0.image = UIImage(systemName: "cloud.fill")
        $0.tintColor = UIColor.white
    }
    
    let tempLabel = UILabel().then {
        $0.text = "19º"
        $0.font = .boldSystemFont(ofSize: 15)
        $0.textColor()
        $0.sizeToFit()
    }
    
    lazy var hourlyTempStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.addArrangedSubview(hourlyLabel)
        $0.addArrangedSubview(tempIcon)
        $0.addArrangedSubview(tempLabel)
        $0.spacing = 15
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configureUI() {
        contentView.addSubview(hourlyTempStackView)
        contentView.backgroundColor = UIColor.clear
        
        hourlyTempStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        tempIcon.snp.makeConstraints {
            $0.width.height.equalTo(23)
        }
    }
}
