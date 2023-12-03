//
//  FocusStateBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/14.
//

import SwiftUI

struct FocusStateBootcamp: View {
    
    enum OnboardingFields: Hashable {
        case username
        case password
    }
//    @FocusState private var usernameInfocus: Bool
    @State private var userName: String = ""
//    @FocusState private var passwordInfocus: Bool
    @State private var password: String = ""
    @FocusState private var fieldInFocus: OnboardingFields?
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("Add your name here", text: $userName)
//                .focused($usernameInfocus)
                .focused($fieldInFocus, equals: .username)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            SecureField("Add your password here", text: $password) // 입력하는 내용을 볼 수 없는 textfield
//                .focused($passwordInfocus)
                .focused($fieldInFocus, equals: .password)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            Button("SIGN UP 😄") {
                let usernameInValid = !userName.isEmpty
                let passwordIsValid = !password.isEmpty
                if usernameInValid && passwordIsValid {
                    print("SIGN UP")
                } else if usernameInValid {
                    fieldInFocus = .password
//                    usernameInfocus = false
//                    passwordInfocus = true
                } else {
                    fieldInFocus = .username
//                    usernameInfocus = true
//                    passwordInfocus = false
                }
            }
            
//            Button("TOGGLE FOCUS STATE") {
//                passwordInfocus.toggle()
//            }
        }
        .padding(40)
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                self.usernameInfocus = true
//            }
//        }
    }
}

struct FocusStateBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FocusStateBootcamp()
    }
}
