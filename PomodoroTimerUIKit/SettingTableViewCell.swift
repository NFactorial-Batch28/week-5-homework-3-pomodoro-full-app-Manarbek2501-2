//
//  SettingTableViewCell.swift
//  PomodoroTimerUIKit
//
//  Created by Manarbek Bibit on 08.05.2023.
//

import UIKit
import SnapKit

class SettingTableViewCell: UITableViewCell {
    
    private var focusTimeText: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    private var focusTime: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)
        configUI()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            contentView.backgroundColor = UIColor.gray
            focusTime.textColor = .white
        } else {
            contentView.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)
            focusTime.textColor = .gray
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI(){
        [focusTimeText, focusTime].forEach {
            contentView.addSubview($0)
        }
        makeConstr()
    }
    private func makeConstr(){
        focusTimeText.snp.makeConstraints {
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.left.equalTo(contentView.safeAreaLayoutGuide).offset(16)
        }
        focusTime.snp.makeConstraints {
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.right.equalToSuperview().offset(-16)
        }
    }
    
    func configure(time: TimesName ) {
        focusTimeText.text = time.timeName
        focusTime.text = time.time
    }
}
    
    
