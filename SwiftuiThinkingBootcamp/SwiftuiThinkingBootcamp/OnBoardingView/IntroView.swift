//
//  IntroView.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/15.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        
        ZStack {
            RadialGradient(
                colors: [Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))],
                center: .topLeading,
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height
            )
            .ignoresSafeArea()
            
            if currentUserSignedIn {
                ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            } else {
                OnBoardingView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
            }
            // if user is signed in
            // profile view
            // else
            // onboarding view
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
