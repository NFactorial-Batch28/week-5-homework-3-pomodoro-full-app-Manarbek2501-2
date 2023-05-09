//
//  BottomSheetViewController.swift
//  PomodoroTimerUIKit
//
//  Created by Manarbek Bibit on 09.05.2023.
//

import UIKit
import SnapKit
class BottomSheetViewController: UIViewController {

    private var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        configUI()
        makeConstraints()
    }
    
    private func configUI() {
        self.view.addSubview(backgroundView)
    }
    private func makeConstraints() {
        backgroundView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(362)
        }
    }
}
