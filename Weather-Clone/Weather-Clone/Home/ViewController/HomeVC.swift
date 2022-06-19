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
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        registerCell()
        setUpTableView()
    }
}

extension HomeVC {
    private func configureUI(){
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        view.addSubview(summaryHeaderView)
        view.addSubview(summaryStickyView)
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor.clear

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
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HourlyTempTVC.identifier, for: indexPath) as? HourlyTempTVC else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

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
