//
//  ImageServices.swift
//  PSGFF
//
//  Created by Abdul Azeem on 07/02/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class ImageService {
    
    let cache = NSCache<NSString,UIImage>()
    
    private func downloadImage(url: URL, completion: @escaping (UIImage)->()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else { return }
            if let image = UIImage(data: data) {
                self.cache.setObject(image, forKey: url.absoluteString as NSString)
                completion(image)
            }
        }.resume()
    }
    
    public func getImage(urlString: String, completion: @escaping (UIImage)->()) {
        guard let url = URL(string: urlString) else { return }
        if let image = self.cache.object(forKey: url.absoluteString as NSString){
            completion(image)
        } else {
            self.downloadImage(url: url, completion: completion)
        }
    }
}
