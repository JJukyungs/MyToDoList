//
//  ContentView.swift
//  MyToDoList
//
//  Created by 이주경 on 2022/09/26.
//

/*
    Main Home View
    
    MVVM 사용
 
    Add View
    - NavigationView
    - TabView
    - List
    - PageView
    - scrollView
 
 */

import SwiftUI

struct TodoListView: View {
    var body: some View {
        NavigationView {
            Text("homeView")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
