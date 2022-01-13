//
//  ImageView.swift
//  CombinePracite
//
//  Created by Irakli Sokhaneishvili on 13.01.22.
//

import SwiftUI

struct ImageView: View {
    
    @StateObject var loader: ImageLoadingViewModel
    
    init(url: String) {
        _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url))
    }
    
    var body: some View {
        if loader.isLoading {
            ProgressView()
        } else if let image = loader.image {
            Image(uiImage: image)
                .resizable()
                .clipShape(Circle())
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://via.placeholder.com/600/92c952")
            .frame(width: 70, height: 70)
            .previewLayout(.sizeThatFits)
    }
}
