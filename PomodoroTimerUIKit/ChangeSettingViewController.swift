//
//  ChangeSettingViewController.swift
//  PomodoroTimerUIKit
//
//  Created by Manarbek Bibit on 08.05.2023.
//

import UIKit
import SnapKit

protocol ChangedValueTime {
    func time(time: String)
}

class ChangeSettingViewController: UIViewController {
    var delegate: ChangedValueTime?
    var setTime: TimesName
    var didSelectedTime: ((String) -> Void)?
    lazy var focusTimeText: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.datePickerMode = .time
        datePicker.timeZone = TimeZone(identifier: "Asia/Almaty")
        datePicker.locale = NSLocale(localeIdentifier: "ru_RU") as Locale
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_: )), for: .valueChanged)
        return datePicker
    }()
    
    var pickerView = UIPickerView()
    
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
        [focusTimeText, datePicker].forEach {
            view.addSubview($0)
        }
        makeConst()
    }
    private func makeConst() {
        focusTimeText.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.equalToSuperview().offset(16)
        }
        datePicker.snp.makeConstraints {
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
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss"
        dateFormatter.locale = NSLocale.current
        dateFormatter.timeZone = NSTimeZone.local
        let selectedDate: String = dateFormatter.string(from: sender.date)
        delegate?.time(time: selectedDate)
        didSelectedTime?(selectedDate)
        print("Selected value \(selectedDate)")
    }
}
extension ChangeSettingViewController {
    func setup(setTimes: TimesName) {
        self.focusTimeText.text = setTimes.timeName
        //        self.focusTime.text = setTimes.time
    }
}

