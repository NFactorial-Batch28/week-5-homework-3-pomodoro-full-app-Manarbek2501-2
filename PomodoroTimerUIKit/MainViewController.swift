//
//  MainViewController.swift
//  PomodoroTimerUIKit
//
//  Created by Manarbek Bibit on 08.05.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    var circularProgress = CircularProgressView(frame: CGRect(x: 71, y: 224, width: 248, height: 248))
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Work")
        return image
    }()
    private var timerText: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 56))
        label.text = "25:00"
        label.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        label.textColor = .white
        return label
    }()
    private var timerNameText: UILabel = {
        let label = UILabel()
        label.text = "Focus in your task"
        label.font = UIFont.systemFont(ofSize: 16 , weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private var focusCategoryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Focus Category", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 18
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        let config = UIImage.SymbolConfiguration(
            pointSize: 20, weight: .medium, scale: .default)
        let image = UIImage(systemName: "pencil", withConfiguration: config)
        button.tintColor = .white
        button.setImage(image, for: .normal)
        return button
    }()
    private var playPauseButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 28
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        let config = UIImage.SymbolConfiguration(
            pointSize: 25, weight: .medium, scale: .default)
        let image = UIImage(systemName: "play", withConfiguration: config)
        button.tintColor = .white
        button.setImage(image, for: .normal)
        return button
    }()
    private var resetButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 28
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        let config = UIImage.SymbolConfiguration(
            pointSize: 22, weight: .medium, scale: .default)
        let image = UIImage(systemName: "app.fill", withConfiguration: config)
        button.tintColor = .white
        button.setImage(image, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        circularProgress.progressColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        circularProgress.trackColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        circularProgress.tag = 101
        //animate progress
        self.perform(#selector(animateProgress), with: nil, afterDelay: 0.3)
    }
    @objc func animateProgress() {
        let cp = self.view.viewWithTag(101) as! CircularProgressView
        cp.setProgressWithAnimation(duration: 1.0, value: 0.8)
    }
    func configUI(){
        [timerText, timerNameText].forEach {
            circularProgress.addSubview($0)
        }
        [circularProgress,focusCategoryButton,playPauseButton,resetButton].forEach {
            image.addSubview($0)
        }
        view.addSubview(image)
        makeConstr()
    }
    func makeConstr(){
        image.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.right.equalToSuperview()
        }
        focusCategoryButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(136)
            $0.left.equalToSuperview().offset(110)
            $0.height.equalTo(36)
            $0.width.equalTo(170)
        }
        playPauseButton.snp.makeConstraints {
            $0.top.equalTo(circularProgress.snp.bottom).offset(60)
            $0.left.equalToSuperview().offset(99)
            $0.height.equalTo(56)
            $0.width.equalTo(56)
        }
        resetButton.snp.makeConstraints {
            $0.top.equalTo(circularProgress.snp.bottom).offset(60)
            $0.right.equalToSuperview().offset(-99)
            $0.height.equalTo(56)
            $0.width.equalTo(56)
        }
        timerText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(68)
        }
        timerNameText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(timerText.snp.bottom).offset(4)
        }
    }
}
