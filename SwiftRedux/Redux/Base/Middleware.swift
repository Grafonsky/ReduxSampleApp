//
//  Middleware.swift
//  SwiftRedux
//
//  Created by Bohdan Hawrylyshyn on 29.10.2022.
//

import Foundation
import Combine

func logMiddleware() -> Middleware<AppState, ReduxAction> {
    return { _, action in
        #if DEBUG
        print("♿️ Triggered action: \(action)")
        #endif
        return Empty().eraseToAnyPublisher()
    }
}
