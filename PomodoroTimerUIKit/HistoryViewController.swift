//
//  HistoryViewController.swift
//  PomodoroTimerUIKit
//
//  Created by Manarbek Bibit on 08.05.2023.
//

import UIKit
import SnapKit

class HistoryViewController: UIViewController {
//    private var headerText: UILabel = {
//        let label = UILabel()
//        label.text = "History"
//        label.textColor = .white
//        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
//        return label
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)
        navigationItem.title = "History" 
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
