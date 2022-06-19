//
//  LabelTVC.swift
//  Weather-Clone
//
//  Created by Sojin Lee on 2022/06/19.
//

import UIKit
import SnapKit
import Then

class LabelTVC: UITableViewCell {
    static let identifier = "LabelTVC"
    
    let label = UILabel().then {
        $0.text = "오후 6시쯤 강우 예상"
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(label)
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
        }
    }
    
    func configure(text: String) {
        label.text = text
    }
}
