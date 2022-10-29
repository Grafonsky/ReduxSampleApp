//
//  SwiftReduxApp.swift
//  SwiftRedux
//
//  Created by Bohdan Hawrylyshyn on 29.10.2022.
//

import SwiftUI

@MainActor
@main
struct SwiftReduxApp: App {
    
    var store: AppStore = .init(
        state: AppState(),
        rootReducer: RootReducer())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
