//
//  MainViewController.swift
//  PomodoroTimerUIKit
//
//  Created by Manarbek Bibit on 08.05.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Work")
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    func configUI(){
        view.addSubview(image)
        makeConstr()
    }
    func makeConstr(){
        image.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.right.equalToSuperview()
        }
    }
}
