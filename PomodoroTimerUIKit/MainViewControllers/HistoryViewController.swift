//
//  HistoryViewController.swift
//  PomodoroTimerUIKit
//
//  Created by Manarbek Bibit on 08.05.2023.
//

import UIKit
import SnapKit

class HistoryViewController: UIViewController {
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "History"
        titleLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
        titleLabel.sizeToFit()
        return titleLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = titleLabel
        view.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)
        configUI()
    }
    private func configUI(){
//        view.addSubview(headerText)
        makeConstr()
    }
    private func makeConstr(){
//        headerText.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(60)
//            $0.centerX.equalToSuperview()
//        }
    }
}
