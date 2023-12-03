//
//  DownloadingImgaesBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Yumin Chu on 2023/06/18.
//

import SwiftUI

// background threads
// weak self
// Combine
// Publishers and Subscribers
// FileManager
// NSCache

struct DownloadingImagesBootcamp: View {
    
    @StateObject var vm = DownloadingImagesVM()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray) { model in
                    DownloadingImagesRow(model: model)
                }
            }
            .navigationTitle("Downloading Imagees!")
        }
        .listStyle(.grouped)
    }
}

struct DownloadingImgaesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImagesBootcamp()
    }
}
