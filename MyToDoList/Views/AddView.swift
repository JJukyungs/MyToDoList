//
//  AddView.swift
//  MyToDoList
//
//  Created by 이주경 on 2022/10/04.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alerTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type sometiong here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.lightGray))
                    .cornerRadius(10)
                    .opacity(0.7)
                
                Button(action: willSaveButtonPressed,
                       label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                
            }
            .padding(15)
        }
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlert) {
            willGetAlert()
        }
    }
    
    // MARK: - willSaveButtonPressed()
    func willSaveButtonPressed() {
        
        // TextField Count 가 3 이상일 때만 작동
        if willTextIsAppropriate() {
            listViewModel.didAddItem(title: textFieldText)
            // presentationMode 를 이용하여 View 전 계층으로 돌아갈 수 있게 함
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    // MARK: - willTextIsAppropriate
    /// TextField 안의 Text의 글자수를 판별하여 Save Button을 활성화 할 수 있도록함
    func willTextIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            // Alert 을 추가하여 보여줌
            alerTitle = "입력 글자수를 3자를 넘겨주세요"
            showAlert.toggle()
            return false
        }
        
        return true
    }
    
    func willGetAlert() -> Alert {
        return Alert(title: Text(alerTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
