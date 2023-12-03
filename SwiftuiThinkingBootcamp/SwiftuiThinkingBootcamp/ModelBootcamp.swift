//
//  ModelBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/09.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
}

struct ModelBootcamp: View {
    
    @State private var users: [UserModel] = [
        UserModel(displayName: "RM", userName: "김남준", followerCount: 710, isVerified: true),
        UserModel(displayName: "Jin", userName: "김석진", followerCount: 712, isVerified: false),
        UserModel(displayName: "Suga", userName: "민윤기", followerCount: 711, isVerified: true),
        UserModel(displayName: "J-Hope", userName: "정호석", followerCount: 710, isVerified: false)
    ]
//    @State private var users: [String] = [
//        "Yumin", "Emily", "Samantha", "chris"
//    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    HStack(spacing: 15) {
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(Color.blue)
                                .padding(.vertical, 10)
                        }
                        
                        VStack {
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Follswers")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Users")
        }
    }
}

struct ModelBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ModelBootcamp()
    }
}
