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
struct Source {
   static func makeTime() -> [TimesName] {
       [
        .init(timeName: "Focus time", time: "25:00"),
        .init(timeName: "Break time", time: "05:00"),
       ]
    }
}

class SettingViewController: UIViewController {
    let times = Source.makeTime()
    var tableView: UITableView = .init()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Settings"
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let changeVC = ChangeSettingViewController(setTime: times[indexPath.row])
        navigationController?.pushViewController(changeVC, animated: true)
    }
}
extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingList", for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
        cell.configure(time: times[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
}

