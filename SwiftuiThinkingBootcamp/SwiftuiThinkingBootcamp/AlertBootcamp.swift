//
//  AlertBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/03.
//

import SwiftUI

struct AlertBootcamp: View {
    
    @State var showAlert: Bool = false
    @State var alertType: MyAlerts? = nil
    @State var backgroundColor: Color = Color.yellow
//    @State var alertTitle: String = ""
//    @State var alertMessage: String = ""
    
    enum MyAlerts {
        case success
        case error
    }
    
    var body: some View {
        
        // 경고를 표시
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack {
                Button("BUTTON 1") {
                    alertType = .error
//                    alertTitle = "ERROR UPLOADING VIDEO ❗️"
//                    alertMessage = "The video could not be uploaded"
                    showAlert.toggle()
                }
                
                Button("BUTTON 2") {
                    alertType = .success
//                    alertTitle = "Successfully uploaded video 🥳"
//                    alertMessage = "Your video is now public!"
                    showAlert.toggle()
                }
            }
            // destructive() - 파괴적인, 삭제 버튼
            .alert(isPresented: $showAlert, content: {
    //            Alert(title: Text("There was an error!"))
                getAlert()
            })
        }
    }
    
    private func getAlert() -> Alert {
        switch alertType {
        case .error:
            return Alert(title: Text("There was an error!"))
        case .success:
            return Alert(title: Text("This was a success!"), message: nil, dismissButton: .default(Text("OK"), action: {
                backgroundColor = .green
            }))
        default:
            return Alert(title: Text("ERROR"))
        }
//        return Alert(
//            title: Text(alertTitle),
//            message: Text(alertMessage),
//            dismissButton: .default(Text("OK"))
//        )
//        return Alert(
//            title: Text("This is the title"),
//            message: Text("Here we will describe the error."),
//            primaryButton: .destructive(Text("Delete"), action: {
//                backgroundColor = .red
//            }),
//            secondaryButton: .cancel()
//        )
    }
}

struct AlertBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AlertBootcamp()
    }
}
