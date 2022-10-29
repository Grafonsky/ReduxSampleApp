//
//  CountMiddleware.swift
//  SwiftRedux
//
//  Created by Bohdan Hawrylyshyn on 29.10.2022.
//

import Foundation
import Combine

struct CountMiddleware {
    
    static func middleware() -> Middleware<AppState, ReduxAction> {
        return { _, action in
            guard let action = action as? CountAction
            else { return Empty().eraseToAnyPublisher() }
            
            switch action {
            case .increase:
                return .none
            case .decrease:
                return .none
            }
        }
    }
    
}
