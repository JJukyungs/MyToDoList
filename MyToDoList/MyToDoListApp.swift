//
//  MyToDoListApp.swift
//  MyToDoList
//
//  Created by 이주경 on 2022/09/26.
//

import SwiftUI

@main
struct MyToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TodoListView()
            }
        }
    }
}
