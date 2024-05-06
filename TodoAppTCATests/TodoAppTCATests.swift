//
//  TodoAppTCATests.swift
//  TodoAppTCATests
//
//  Created by tsuyoshi.matsumaru on 2024/05/06.
//

import ComposableArchitecture
import XCTest

@testable import TodoAppTCA

final class TodoAppTCATests: XCTestCase {
    let clock = TestClock()
    
    //ActionしたときにStateの値が一致するかどうか
    @MainActor
    func testAddTodo() async {
        let store = TestStore(initialState: Todos.State()) {
            Todos()
        } withDependencies: {
            $0.uuid = .incrementing
        }
        
        //　１回目のAddタップ
        await store.send(.addTodoButtonTapped) {
            
            $0.todos = [
                Todo.State(
                description: "",
                id: UUID(0),
                isComplete: false
              ),
            ]
            
            // official
            $0.todos.insert(
                Todo.State(
                    description: "",
                    id: UUID(0),
                    isComplete: false),
                at: 0
            )
        }
        
        // ２回目のAddタップ
        await store.send(.addTodoButtonTapped) {
            $0.todos = [
                Todo.State(
                    description: "",
                    id: UUID(1),
                    isComplete: false
                ),
                Todo.State(
                    description: "",
                    id: UUID(0),
                    isComplete: false
                ),
            ]
        }
        
    }
    

}
