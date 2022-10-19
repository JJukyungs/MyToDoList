//
//  ItemModel.swift
//  MyToDoList
//
//  Created by 이주경 on 2022/10/19.
//

import Foundation


// MARK: - ItemModel
/// TodoList Items 구조 선언

struct ItemModel: Identifiable {
    // UUID()로 바로 입력할 수 도 있지만 String Type으로 반환하기 위해 .uuidString 을 사용
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
