//
//  BaseViewController.swift
//  TwinnyPeopleApp
//
//  Created by νΈμλ on 2022/05/18.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        setViewConfig()
        navigationConfig()
    }
    
    func setViewConfig() {}
    func navigationConfig() {}
}
