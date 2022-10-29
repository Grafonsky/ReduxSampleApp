//
//  RootReducer.swift
//  SwiftRedux
//
//  Created by Bohdan Hawrylyshyn on 29.10.2022.
//

import Foundation
import Combine

@MainActor
struct RootReducer: ReduxReducer {
    
    let countReducer: CountReducer = .init()
    
    func reduce(_ state: inout AppState, _ action: ReduxAction) {
        countReducer.reduce(&state.count, action)
    }
    
}
