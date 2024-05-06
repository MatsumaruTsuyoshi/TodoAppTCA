//
//  TodoAppTCAApp.swift
//  TodoAppTCA
//
//  Created by tsuyoshi.matsumaru on 2024/05/06.
//

import ComposableArchitecture
import SwiftUI

@main
struct TodoAppTCAApp: App {
    var body: some Scene {
        WindowGroup {
            AppView(
                    store: Store(initialState: Todos.State()) {
                      Todos()
                    }
                  )
        }
    }
}
