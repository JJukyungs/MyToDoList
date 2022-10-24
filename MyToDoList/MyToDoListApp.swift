//
//  MyToDoListApp.swift
//  MyToDoList
//
//  Created by 이주경 on 2022/09/26.
//

import SwiftUI

@main
struct MyToDoListApp: App {
    
    // App 전체에 ViewModel을 사용할 수 있게 처음 부분에 사용
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TodoListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
