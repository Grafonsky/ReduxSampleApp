//
//  CountReducer.swift
//  SwiftRedux
//
//  Created by Bohdan Hawrylyshyn on 29.10.2022.
//

import Foundation

struct CountReducer: ReduxReducer {
    
    func reduce(_ state: inout CountState, _ action: ReduxAction) {
        guard let action = action as? CountAction
        else { return }
        
        switch action {
        case .increase:
            state.count += 1
        case .decrease:
            state.count -= 1
        }
    }
    
}
