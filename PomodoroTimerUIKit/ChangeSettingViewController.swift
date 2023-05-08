//
//  ChangeSettingViewController.swift
//  PomodoroTimerUIKit
//
//  Created by Manarbek Bibit on 08.05.2023.
//

import UIKit
import SnapKit

class ChangeSettingViewController: UIViewController {
    
    var setTime: TimesName
    
    lazy var focusTimeText: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    lazy var focusTime: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Settings"
        view.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(savedTime))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(goBack))
        self.navigationItem.setHidesBackButton(true, animated: true)
        configUI()
        setup(setTimes: setTime)
    }
    init(setTime: TimesName) {
        self.setTime = setTime
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configUI() {
        [focusTimeText, focusTime].forEach {
            view.addSubview($0)
        }
        makeConst()
    }
    private func makeConst() {
        focusTimeText.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.equalToSuperview().offset(16)
        }
        focusTime.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.right.equalToSuperview().offset(-16)
        }
    }
    @objc func savedTime() {
        navigationController?.popViewController(animated: true)
    }
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
extension ChangeSettingViewController {
    func setup(setTimes: TimesName) {
        self.focusTimeText.text = setTimes.timeName
        self.focusTime.text = setTimes.time
    }
}
