//
//  AppStorageBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/14.
//

import SwiftUI

struct AppStorageBootcamp: View {
    
    @AppStorage("name") var currentUserName: String? // 더 이상 UserDefault에서 변수를 가져올 필요가 없는 장점이 있음
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text(currentUserName ?? "Add Name Here")
            
            if let name = currentUserName {
                Text("AppStorage" + name)
            }
            
            if let name2 = UserDefaults.standard.string(forKey: "name") {
                Text("UserDefaults" + name2)
            }
            
            Button("Save".uppercased()) {
                let name = "Emily"
                currentUserName = name
                UserDefaults.standard.set(name, forKey: "name") // 사용자 이름을 UserDefaults에 저장
            }
        }
    }
}

struct AppStorageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBootcamp()
    }
}
