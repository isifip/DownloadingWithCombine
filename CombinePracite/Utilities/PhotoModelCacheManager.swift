//
//  PhotoModelCacheManager.swift
//  CombinePracite
//
//  Created by Irakli Sokhaneishvili on 13.01.22.
//

import Foundation
import UIKit

class PhotoModelCacheManager {
    static let instance = PhotoModelCacheManager()
    
    private init() {
        
    }
    var photoCache: NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 200
        cache.totalCostLimit = 1024 * 1024 * 200 // 200mb approximately
        return cache
    }()
    
    func add(key: String, value: UIImage) {
        photoCache.setObject(value, forKey: key as NSString)
    }
    func get(key: String) -> UIImage? {
        return photoCache.object(forKey: key as NSString)
    }
}
