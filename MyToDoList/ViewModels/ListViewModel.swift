//
//  ListViewModel.swift
//  MyToDoList
//
//  Created by 이주경 on 2022/10/24.
//
//  Method 명 정의 방식
//  - will : 특정 행위가 일어나기 직전을 의미
//  - did  : 특정 행위가 일어난 직후를 의미

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        willGetItems()
    }
    
    // MARK: - willGetItems
    /// View에서 사용할 수 있도록 Items을 입력 추가 해줄 수 있도록하는 Method
    func willGetItems() {
        let newItems = [
            ItemModel(title: "first title", isCompleted: false),
            ItemModel(title: "second title", isCompleted: true),
            ItemModel(title: "third title", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    // MARK: - List Method
    
    // List 삭제 기능
    func willDeleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    // Edit 버튼을 클릭 시 List 삭제, 이동
    func didMoveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    // AddView 안에서 TodoList Item을 추가하기 위한 함수
    func didAddItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    // ItemUpdate를 위해 사용되는 함수 (항목 체킹용)
    func willUpdateItem(item: ItemModel) {
        // 내가 선택한 항목의 Index를 판별하기 위해 작성 if let을 사용하여 안정성을 올림
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.willUpdateCompletion()
        }
    }
}
