//
//  AppState.swift
//  SwiftRedux
//
//  Created by Bohdan Hawrylyshyn on 29.10.2022.
//

import Foundation

struct AppState: ReduxState {
    var count: CountState = .init()
}
