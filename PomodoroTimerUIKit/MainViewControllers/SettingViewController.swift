//
//  SettingViewController.swift
//  PomodoroTimerUIKit
//
//  Created by Manarbek Bibit on 08.05.2023.
//

import UIKit
import SnapKit

struct TimesName {
    let timeName: String
    let time: String
}

class SettingViewController: UIViewController {
    var didSelectedTime: ((String) -> Void)?
    var times = [TimesName(timeName: "Focus time", time: "25:00"), TimesName(timeName: "Break time", time: "05:00")]
    var tableView: UITableView = .init()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Settings"
        titleLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
        titleLabel.sizeToFit()
        return titleLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = titleLabel
        view.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: "SettingList")
        tableView.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)
        tableView.dataSource = self
        tableView.delegate = self
        configUI()
    }
    private func configUI() {
        [tableView].forEach{
            view.addSubview($0)
        }
        makeConstr()
    }
    private func makeConstr() {
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.left.right.equalToSuperview()
        }
    }
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let changeVC = ChangeSettingViewController(setTime: times[indexPath.row])
        changeVC.didSelectedTime = { [weak self] time in
            self?.times[indexPath.row] = .init(timeName: self?.times[indexPath.row].timeName ?? "", time: time)
            self?.tableView.reloadData()
        }
        navigationController?.pushViewController(changeVC, animated: true)
    }
}
extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingList", for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
        cell.configure(time: times[indexPath.row])
        return cell
    }
}
