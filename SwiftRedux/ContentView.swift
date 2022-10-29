//
//  ContentView.swift
//  SwiftRedux
//
//  Created by Bohdan Hawrylyshyn on 29.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        VStack {
            Text("Current value: \(store.state.count.count)")
            HStack {
                Button("Increase") {
                    store.dispatch(CountAction.increase)
                }
                Button("Decrease") {
                    store.dispatch(CountAction.decrease)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(
                AppStore.init(
                    state: AppState(),
                    rootReducer: RootReducer()))
    }
}
