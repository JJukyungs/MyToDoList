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
    
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
            
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "firest test")
    }
}
