//
//  ItemModel.swift
//  MyToDoList
//
//  Created by 이주경 on 2022/10/19.
//

import Foundation


// MARK: - ItemModel
/// TodoList Items 구조 선언
///  Json 으로 파싱할 수 있도록 Codable 추가

struct ItemModel: Identifiable, Codable {
    // UUID()로 바로 입력할 수 도 있지만 String Type으로 반환하기 위해 .uuidString 을 사용
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    // MARK: - willUpdateCompletion()
    // - Item의 isCompleted 를 Update 하기 위해 사용하는 Method
    // - ItemModel을 참조하도록 구조체에 선언
    func willUpdateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
