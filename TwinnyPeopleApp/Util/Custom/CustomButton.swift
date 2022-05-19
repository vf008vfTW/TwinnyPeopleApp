//
//  CustomButton.swift
//  TwinnyPeopleApp
//
//  Created by 트위니 on 2022/05/18.
//

import UIKit

enum ButtonState: String {
    case start
    case stop
}

final class CustomButton: UIButton {

    var buttonState: ButtonState = .stop {
        didSet {
            setUpConfig()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setUpConfig()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setUpConfig() {

        backgroundColor = .white
        layer.cornerRadius = 5
        layer.borderColor = UIColor.white.cgColor
        setTitleColor(.black, for: .normal)

        switch buttonState {
        case .start: setTitle("시작", for: .normal)
        case .stop: setTitle("정지", for: .normal)
        }
    }
}
