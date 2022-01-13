//
//  Photo.swift
//  CombinePracite
//
//  Created by Irakli Sokhaneishvili on 13.01.22.
//

import Foundation

struct Photo: Identifiable, Codable {
    var albumId: Int
    var id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
