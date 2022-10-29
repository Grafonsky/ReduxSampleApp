//
//  Store.swift
//  SwiftRedux
//
//  Created by Bohdan Hawrylyshyn on 29.10.2022.
//

import Foundation
import Combine

typealias AppStore = Store<AppState, RootReducer>
typealias Middleware<ReduxState, ReduxAction> = (ReduxState, ReduxAction) -> AnyPublisher<ReduxAction, Never>?

final class Store<AppState, RootReducer>: ReduxStore where RootReducer: ReduxReducer, RootReducer.State == AppState {
    
    @Published private(set) public var state: AppState
    private let reducer: RootReducer
    private var middlewares: [Middleware<AppState, ReduxAction>]
    private var middlewaresStore: Set<AnyCancellable> = []
    
    init(state: AppState, rootReducer: RootReducer, middlewares: [Middleware<AppState, ReduxAction>] = []) {
        self.state = state
        self.reducer = rootReducer
        self.middlewares = middlewares
    }
    
    public func dispatch(_ action: ReduxAction) {
        reducer.reduce(&state, action)
        for mw in middlewares {
            guard let middleware = mw(state, action)
            else { break }
            middleware
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: dispatch(_:))
                .store(in: &middlewaresStore)
        }
    }
    
}
