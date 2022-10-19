//
//  ListRowView.swift
//  MyToDoList
//
//  Created by 이주경 on 2022/10/04.
//

import SwiftUI

// List Row View
/// List 안 분리된 뷰 (TableView Cell)
struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .black)
            Text(item.title)
            Spacer()
            
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "first item", isCompleted: false)
    static var item2 = ItemModel(title: "second item", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
