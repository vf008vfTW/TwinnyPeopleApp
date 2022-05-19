//
//  GameView.swift
//  TwinnyPeopleApp
//
//  Created by 트위니 on 2022/05/18.
//

import UIKit

import SnapKit
import Then

final class GameView: BaseView {
    
    let resetButton = UIButton().then {
        $0.setImage(UIImage(systemName: "arrow.triangle.2.circlepath"), for: .normal)
        $0.contentVerticalAlignment = .fill
        $0.contentHorizontalAlignment = .fill
        $0.tintColor = .white
    }
    let goalNumberLabel = UILabel().then {
        $0.textColor = .green
        $0.text = "77"
        $0.font = .boldSystemFont(ofSize: 50)
        $0.textAlignment = .center
    }
    let randomNumberView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 100
    }
    let randomNumberLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "11"
        $0.font = .boldSystemFont(ofSize: 60)
        $0.textAlignment = .center
    }
    let startAndStopButton = CustomButton().then {
        $0.buttonState = .start
    }
    let endButton = UIButton().then {
        $0.setTitle("그만하기", for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor.white.cgColor
        $0.setTitleColor(.black, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setUpView() {
        addSubview(goalNumberLabel)
        addSubview(randomNumberView)
        addSubview(startAndStopButton)
        addSubview(endButton)
        
        randomNumberView.addSubview(randomNumberLabel)
    }
    
    override func setUpConstraints() {
        resetButton.snp.makeConstraints { make in
            make.width.equalTo(28)
            make.height.equalTo(24)
        }
        goalNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(UIScreen.main.bounds.height / 10)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        randomNumberView.snp.makeConstraints { make in
            make.top.equalTo(goalNumberLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
        }
        randomNumberLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(80)
        }
        startAndStopButton.snp.makeConstraints { make in
            make.bottom.equalTo(endButton.snp.top).offset(-20)
            make.leading.equalTo(self.snp.leading).inset(10)
            make.trailing.equalTo(self.snp.trailing).inset(10)
            make.height.equalTo(60)
        }
        endButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(40)
            make.leading.equalTo(self.snp.leading).inset(10)
            make.trailing.equalTo(self.snp.trailing).inset(10)
            make.height.equalTo(60)
        }
    }
}
