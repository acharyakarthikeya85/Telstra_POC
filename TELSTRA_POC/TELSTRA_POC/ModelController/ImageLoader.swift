//
//  ImageLoader.swift
//  TELSTRA_POC
//
//  Created by Karthikeya  on 02/07/20.
//  Copyright © 2020 Karthikeya . All rights reserved.
//

import Foundation
import UIKit

class ImageLoader {
    
    var task: URLSessionDownloadTask!
    var session: URLSession!
    var cache: NSCache<NSString, UIImage>!
    
    init() {
        session = URLSession.shared
        task = URLSessionDownloadTask()
        self.cache = NSCache()
    }
    
    func obtainImageWithPath(imagePath: String, completionHandler: @escaping (UIImage) -> ()) {
        if let image = self.cache.object(forKey: imagePath as NSString) {
            DispatchQueue.main.async {
                completionHandler(image)
            }
        } else {
            let placeholder = UIImage(named:"placeHolder")
            DispatchQueue.main.async {
                completionHandler(placeholder!)
            }
            
            let url: URL? = URL(string: imagePath)
            if let baseUrl = url {
                task = session.downloadTask(with: baseUrl, completionHandler: { (location, response, error) in
                    if let data = try? Data(contentsOf: baseUrl) {
                        let img: UIImage! = UIImage(data: data)
                        self.cache.setObject(img, forKey: imagePath as NSString)
                        DispatchQueue.main.async {
                            completionHandler(img)
                        }
                    }
                })
                task.resume()
            } else {
                completionHandler(placeholder!)
            }
            
           
        }
    }
}
