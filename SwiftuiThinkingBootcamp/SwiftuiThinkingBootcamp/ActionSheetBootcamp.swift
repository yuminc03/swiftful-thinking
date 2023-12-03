//
//  ActionSheetBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/03.
//

import SwiftUI

struct ActionSheetBootcamp: View {
    
    @State var showActionSheet: Bool = false
    @State var actionSheetOption: ActionSheetOptions = .isOtherPost
    
    enum ActionSheetOptions {
        case isMyPost
        case isOtherPost
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Circle()
                    .frame(width: 30, height: 30)
                Text("@username")
                Spacer()
                Button(action: {
                    actionSheetOption = .isOtherPost
                    showActionSheet.toggle()
                }, label: {
                    Image(systemName: "ellipsis")
                })
            }
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
        }
        
//        Button("Click Me!", action: {
//            showActionSheet.toggle()
//        })
        .actionSheet(isPresented: $showActionSheet, content: getActionSheet)
    }
    
    private func getActionSheet() -> ActionSheet {
        
        let shareButton: ActionSheet.Button = .default(Text("Share")) {
            
        }
        let reportButton: ActionSheet.Button = .destructive(Text("Report")) {
            
        }
        let deleteButton: ActionSheet.Button = .destructive(Text("Delete")) {
            
        }
        let cancelButton: ActionSheet.Button = .cancel()
        
        switch actionSheetOption {
        case .isMyPost:
            return ActionSheet(
                title: Text("What would you like to do?"),
                message: nil,
                buttons: [shareButton, reportButton, cancelButton]
            )
        case .isOtherPost:
            return ActionSheet(
                title: Text("What would you like to do?"),
                message: nil,
                buttons: [shareButton, reportButton, deleteButton, cancelButton]
            )
        }
        
//        let button1: ActionSheet.Button = .default(Text("DEFAULT"))
//        let button2: ActionSheet.Button = .destructive(Text("DESTRUCTIVE"))
//        let button3: ActionSheet.Button = .cancel()
//
//        return ActionSheet(
//            title: Text("This is the title!"),
//            message: Text("This is the message."),
//            buttons: [button1, button2, button3]
//        )
//        return ActionSheet(title: Text("This is the Title!"))
    }
}

struct ActionSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetBootcamp()
    }
}
