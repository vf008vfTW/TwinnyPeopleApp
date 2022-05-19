//
//  GameViewReactor.swift
//  TwinnyPeopleApp
//
//  Created by 트위니 on 2022/05/19.
//

import Foundation

import ReactorKit

final class GameViewReactor: Reactor {
    
    enum Action {
        case startButtonTap
        case stopButtonTap
        case endButtonTap
        case resetButtonTap
    }

    enum Mutation {
        case startRandomizingRandomValue
        case stopRandomizingRandomValue
        case resetAllValue
        case moveResultView
    }

    struct State {
        var goalNumberValue: Int
        var randomNumberValue: Int
        var randomNumberList: [Int]
    }
    
    var initialState: State = .init(
        goalNumberValue: 0,
        randomNumberValue: 0,
        randomNumberList: []
    )
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .startButtonTap:
            return .just(.startRandomizingRandomValue)
        case .stopButtonTap:
            return .just(.stopRandomizingRandomValue)
        case .endButtonTap:
            return .just(.moveResultView)
        case .resetButtonTap:
            return .just(.resetAllValue)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .startRandomizingRandomValue:
            print("start")
            let randomNumber = Int.random(in: 1...100)
            state.randomNumberValue = randomNumber
            state.randomNumberList.append(randomNumber)
        case .stopRandomizingRandomValue:
            print("stop")
        case .resetAllValue:
            print("reset")
        case .moveResultView:
            state.randomNumberList.removeAll()
            print("move")
        }
        return state
    }
}
