//
//  BaseView.swift
//  TwinnyPeopleApp
//
//  Created by νΈμλ on 2022/05/18.
//

import UIKit

class BaseView: UIView, ViewRepresentable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUpView() {
        backgroundColor = .white
    }
    func setUpConstraints() {}
}
