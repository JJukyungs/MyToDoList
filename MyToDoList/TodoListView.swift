//
//  ContentView.swift
//  MyToDoList
//
//  Created by 이주경 on 2022/09/26.
//

/*
    10월 4일 MyTodoList 시작
    Main Home View
    
    MVVM 사용
 
    View
    - NavigationView
    - TabView
    - List
    - PageView
    - scrollView
    
 */

import SwiftUI

struct TodoListView: View {
    
    // TodoList Items
    @State var items: [String] = [
        "first test",
        "second test",
        "third test"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("My TodoList")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodoListView()
        }
    }
}



