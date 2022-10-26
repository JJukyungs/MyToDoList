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
    
 
    Method 명칭 정의
    - event 발생시키기 위해 사용되는 함수는 will
    - event 발생 후 사용하는 함수는 did
 */


/*
    Event 작업 목록
    List
    - CheckBox Image 변경 및 on/off 기능 추가
    - ListRowView 클릭 시 새로운 View 띄우고 수정 및 저장 기능 추가
    - Add 부분 NavigationBarItem 말고 아래 작은 + 원형 버튼으로 추가 (ZStack 사용)
    
    UI 부분 수정 및 추가할 부분
    View
    - MainView 인데 List만 보여주기가 좀..
    - List 부분 위에 나의 목표 달성량 ? 아니면 전날 TodoList 달성량 보여주기
    - Chart 부분 사용할 수 있으면 사용
    - TabView 사용하여 화면 분리(Main Home, 캘린더)
    - Add, Edit 부분 수정 후 MyPage Image 삽입 후 MyPageView 연결
 
    Empty View
    - TodoList Items이 없을 경우 보여줄 View
 
    데이터 저장
    - UserDefault 사용
    - Json 으로
 */

import SwiftUI

struct TodoListView: View {
    
    // ViewModel을 사용할 수 있게 한번 더 호출
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
        ZStack {
            if listViewModel.items.isEmpty {
                EmptyListView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.willUpdateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.willDeleteItem)
                    .onMove(perform: listViewModel.didMoveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
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
        .environmentObject(ListViewModel())
        // environmentObject 추가 이유: Canvas에서 확인을 하기 위해
    }
}



