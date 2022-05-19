//
//  GameViewController.swift
//  TwinnyPeopleApp
//
//  Created by 트위니 on 2022/05/18.
//

import UIKit

import ReactorKit
import RxCocoa
import RxSwift

final class GameViewController: BaseViewController, View {
    
    private let mainView = GameView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setViewConfig() {
        
    }
    
    override func navigationConfig() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: mainView.resetButton)
    }
    
    // MARK: - ReactorKit
    
    func bind(reactor: GameViewReactor) {
        
        switch mainView.startAndStopButton.buttonState {
        case .start:
            mainView.startAndStopButton.rx.tap
                .map { Reactor.Action.startButtonTap }
                .bind(to: reactor.action)
                .disposed(by: disposeBag)
        case .stop:
            mainView.startAndStopButton.rx.tap
                .map { Reactor.Action.stopButtonTap }
                .bind(to: reactor.action)
                .disposed(by: disposeBag)
        }
        
        mainView.endButton.rx.tap
            .map { Reactor.Action.endButtonTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        mainView.resetButton.rx.tap
            .map { Reactor.Action.resetButtonTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.randomNumberValue }
            .bind { [weak self] in
                self?.mainView.randomNumberLabel.text = "\($0)"
            }
            .disposed(by: disposeBag)
    }
}
