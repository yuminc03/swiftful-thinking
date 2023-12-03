//
//  SubscriberBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Yumin Chu on 2023/06/18.
//

import SwiftUI
import Combine

final class SubscriberVM: ObservableObject {
    @Published var count: Int = 0
    @Published var textFieldText: String = ""
    @Published var textIsValid = false
    @Published var showButton = false
//    var timer: AnyCancellable?
    var cancellables = Set<AnyCancellable>() // publisher들을 여기에 저장함, 취소할 수 있는 모든 것을 여기에 저장
    
    init() {
        addTimerPublisher()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func addTextFieldSubscriber() {
        $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { text -> Bool in
                if text.count > 3 {
                    return true
                }
                return false
            }
//            .assign(to: \.textIsValid, on: self)
            .sink { [weak self] isValid in
                self?.textIsValid = isValid
            }
            .store(in: &cancellables)
    }
    
    func addTimerPublisher() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self else { return }
                count += 1
                
//                if count >= 10 {
//                    for item in cancellables {
//                        item.cancel()
//                    }
//                }
            }
            .store(in: &cancellables)
    }
    
    func addButtonSubscriber() {
        $textIsValid
            .combineLatest($count)
            .sink { [weak self] isValid, count in
                guard let self else { return }
                if isValid && count >= 10 {
                    showButton = true
                } else {
                    showButton = false
                }
            }
            .store(in: &cancellables)
    }
}

struct SubscriberBootcamp: View {
    
    @StateObject var vm = SubscriberVM()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
//            Text(vm.textIsValid.description)
            
            TextField("type something here...", text: $vm.textFieldText)
                .padding(.leading)
                .frame(height: 55)
                .font(.headline)
                .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                .cornerRadius(10)
                .overlay(
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .opacity(
                                vm.textFieldText.count < 1 ? 0.0 :
                                vm.textIsValid ? 0.0 : 1.0
                            )
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .opacity(vm.textIsValid ? 1.0 : 0.0)
                    }
                    .font(.title)
                    .padding(.trailing)
                    
                    , alignment: .trailing)
            Button {
                
            } label: {
                Text("Submit".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .opacity(vm.showButton ? 1.0 : 0.5)
            }
            .disabled(!vm.showButton)

        }
        .padding()
    }
}

struct SubscriberBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SubscriberBootcamp()
    }
}
