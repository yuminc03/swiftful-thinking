//
//  OnBoardingView.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/15.
//

import SwiftUI

struct OnBoardingView: View {
    
    /// Onboarding Status:
    /// 0 - welcome screen
    /// 1 - Add name
    /// 2 - Add age
    /// 3 - Add gender
    @State var onboardingState: Int = 0
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    // onboarding inputs
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    
    // for the alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    // app storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            // content
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.green)
                }
            }
            
            // buttons
            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)
        }
        .alert(isPresented: $showAlert) {
            return Alert(title: Text(alertTitle))
        }
    }
}

// MARK: - COMPONENTS

extension OnBoardingView {
    
    private var bottomButton: some View {
        Text(onboardingState == 0 ? "SIGN UP" : onboardingState == 3 ? "FINISH" : "NEXT")
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
                handleNextButtonPressed()
            }
    }
    
    private var welcomeSection: some View {
        VStack {
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(Color.white)
            Text("Find your match.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay (
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundColor(.white)
                    , alignment: .bottom
                )
            Text("This is the #1 app for finding your match online! In this tutorial we are practicin using AppStorage and other SwiftUI techniques.")
                .fontWeight(.medium)
                .foregroundColor(.white)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    
    private var addNameSection: some View {
        VStack {
            Spacer()
            Text("Find your match.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            TextField("Your name here...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Slider(value: $age, in: 18 ... 100, step: 1)
                .accentColor(.white)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Picker(
                selection: $gender,
                label: Text(gender.count > 1 ? gender : "Select a gender")
                    .font(.headline)
                    .foregroundColor(.purple)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10),
                content: {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                    Text("Non-Binary").tag("Non-Binary")
                })
            .pickerStyle(MenuPickerStyle())
            
            Spacer()
            Spacer()
        }
        .padding(30)
    }
}

// MARK: - FUNCTIONS

extension OnBoardingView {
    
    func handleNextButtonPressed() {
        
        // check inputs
        switch onboardingState {
        case 1:
            guard name.count >= 3 else {
                showAlert(title: "Your name must be at least 3 characters long! 🙂")
                return
            }
            
        case 3:
            guard gender.count > 1 else {
                showAlert(title: "Please select a gender gefore moving forward! 🙁")
                return
            }
            
        default:
            break
        }
        
        // go to next section
        if onboardingState == 3 {
            signin()
        } else {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
    }
    
    private func signin() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }
    }
    
    private func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
            .background(Color.purple)
    }
}
