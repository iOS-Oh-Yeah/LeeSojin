//
//  HourlyTempTVC.swift
//  Weather-Clone
//
//  Created by Sojin Lee on 2022/06/09.
//

import UIKit
import SnapKit
import Then

class HourlyTempTVC: UITableViewCell {
    static let identifier = "HourlyTempTVC"
    
    private let hourlyTempCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
        $0.collectionViewLayout = layout
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        registerCell()
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        contentView.addSubview(hourlyTempCollectionView)
        contentView.backgroundColor = UIColor.clear
        
        hourlyTempCollectionView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    private func registerCell() {
        hourlyTempCollectionView.register(HourlyTempCVC.self, forCellWithReuseIdentifier: HourlyTempCVC.identifier)
    }
    
    private func setUpCollectionView() {
        hourlyTempCollectionView.dataSource = self
        hourlyTempCollectionView.delegate = self
    }
}

extension HourlyTempTVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyTempCVC.identifier, for: indexPath) as? HourlyTempCVC else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (80/375)
        let cellHeight = cellWidth * (100/80)

        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}

