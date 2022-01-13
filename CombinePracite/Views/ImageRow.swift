//
//  ImageRow.swift
//  CombinePracite
//
//  Created by Irakli Sokhaneishvili on 13.01.22.
//

import SwiftUI

struct ImageRow: View {
    
    let model: Photo
    
    var body: some View {
        HStack {
            ImageView(url: model.url, key: "\(model.id)")
                .frame(width: 50, height: 50)
            VStack(alignment:.leading) {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundColor(.secondary)
                    .italic()
            }
            .padding(.leading, 5)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct ImageRow_Previews: PreviewProvider {
    static var previews: some View {
        ImageRow(model: Photo(albumId: 1, id: 1, title: "Title", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/600/92c952"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
