//
//  AddView.swift
//  TodoList
//
//  Created by Yumin Chu on 2023/05/15.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode // 화면 위치 모니터링
    @EnvironmentObject var viewModel: ListViewModel
    @State private var textFieldText: String = ""
    
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            TextField("Type Something There...", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
            
            Button(action: didTapSaveButton) {
                Text("Save".uppercased()).foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
        }
        .padding(14)
        .navigationTitle("Add on Item. 🖋️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    private func didTapSaveButton() {
        if textIsAppropriate() {
            viewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    private func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    private func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
        }
    }
}
