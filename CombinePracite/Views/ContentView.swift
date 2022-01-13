//
//  ContentView.swift
//  CombinePracite
//
//  Created by Irakli Sokhaneishvili on 13.01.22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = DownloadImagesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray) { model in
                    Text(model.title)
                }
            }
            .navigationTitle("Downloading")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
