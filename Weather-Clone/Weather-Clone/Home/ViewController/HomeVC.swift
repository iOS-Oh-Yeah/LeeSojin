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
    var summaryHeaderView = SummaryHeaderView()
    var summaryStickyView = SummaryStickyView()
    var tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        registerCell()
        setUpTableView()
    }
}

// MARK: - custom method
extension HomeVC {
    private func configureUI(){
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        view.addSubview(summaryHeaderView)
        view.addSubview(summaryStickyView)
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor.clear
        tableView.contentInset = .zero

        summaryHeaderView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(83)
            $0.leading.equalToSuperview().offset(113)
            $0.trailing.equalToSuperview().offset(-113)
        }
        
        summaryStickyView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(43)
            $0.leading.equalToSuperview().offset(113)
            $0.trailing.equalToSuperview().offset(-113)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(summaryHeaderView.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        summaryStickyView.alpha = 0
    }
    
    private func registerCell() {
        tableView.register(HourlyTempTVC.self, forCellReuseIdentifier: HourlyTempTVC.identifier)
        tableView.register(LabelTVC.self, forCellReuseIdentifier: LabelTVC.identifier)
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - TableView delegate
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.black.withAlphaComponent(0.1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelTVC.identifier, for: indexPath) as? LabelTVC else { return UITableViewCell() }
                return cell
            } else  {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: HourlyTempTVC.identifier, for: indexPath) as? HourlyTempTVC else { return UITableViewCell() }
                return cell
            }
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                return 50
            } else {
                return 100
            }
        default:
            return 100
        }
    }
    
}

// MARK: - scrollview delegate
extension HomeVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var scrollViewOffset = scrollView.contentOffset.y
        
        scrollViewOffset = scrollViewOffset < 0 ? -scrollViewOffset : scrollViewOffset
        
        if scrollViewOffset < 125 {
            summaryHeaderView.snp.updateConstraints {
                $0.top.equalTo(83-scrollViewOffset)
            }
        }
        
        summaryHeaderView.alpha = (125-scrollViewOffset) / 125
        summaryStickyView.alpha = 1 - (125-scrollViewOffset) / 125
    }
}

