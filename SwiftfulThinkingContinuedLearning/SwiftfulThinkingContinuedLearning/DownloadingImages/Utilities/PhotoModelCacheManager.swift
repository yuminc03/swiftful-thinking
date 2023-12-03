//
//  PhotoModelCacheManager.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Yumin Chu on 2023/06/19.
//

import Foundation
import SwiftUI

final class PhotoModelCacheManager {
    
    static let instance = PhotoModelCacheManager()
    private init() { }
    
    var photoCache: NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 200 // cache가 가질 수 있는 최대 객체 수
        cache.totalCostLimit = 1024 * 1024 * 200 // 200MB
        return cache
    }()
    
    func add(key: String, value: UIImage) {
        photoCache.setObject(value, forKey: key as NSString)
    }
    
    func get(key: String) -> UIImage? {
        return photoCache.object(forKey: key as NSString)
    }
}
