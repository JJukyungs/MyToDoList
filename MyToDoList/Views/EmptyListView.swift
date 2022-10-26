//
//  EmptyListView.swift
//  MyToDoList
//
//  Created by 이주경 on 2022/10/26.
//


import SwiftUI


// TodoList가 비어있을 때 보여주기 위한 View
// 맨 처음 앱을 시작하여 데이터가 없거나 TodoList 목록을 전부 지웠을 때 보여줌

struct EmptyListView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("TodoList 목록이 없습니다!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 10)
                Text("TodoList에 저장된 메모가 없습니다. \n아래의 버튼을 눌러 TodoList를 추가해주세요")
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("TodoList 추가하기")
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(10)

                })
                .padding(.horizontal, 50)
                .scaleEffect(1.0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: willAddAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
    // MARK: - willAddAnimation
    // TodoList 가 비어있을 때 보여주는 emptyListView를 animation 효과를 주기 위한 함수
    // animate 가 fasle일 때 DispatchQueue를 이용하여 먼저 작업을 진행을 함
    func willAddAnimation() {
        
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeIn) {
                animate.toggle()
            }
        }
        
    }
    
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            EmptyListView()
                .navigationTitle("Title")
        }
    }
}
