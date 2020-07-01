//
//  CanadaDataModel.swift
//  TELSTRA_POC
//
//  Created by Karthikeya  on 29/06/20.
//  Copyright © 2020 Karthikeya . All rights reserved.
//

import Foundation
import UIKit

protocol didFinishDownloadDelegate {
    func updateTable()
}

class CanadaDataModel: NSObject {
    
    var pageCount : Int = 0
    
    var delegate : didFinishDownloadDelegate?
    var titleArray = [String]()
    var descArray = [String]()
    var imageArray = [String]()
    
    func fetchFirstPage(){
        serviceCallForData()
    }
    
    func fetchNextPage(){
        
    }
    
    func serviceCallForData(){
        
        let session  = URLSession.shared
        guard let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") else { return  }
        
        let task = session.dataTask(with: url, completionHandler: {
         data, response, error in
            if((error) != nil){
                print(error as Any)
            } else {
                print("D type of data \(type(of: data))")
                
                do{
                    let utf8Data = String(decoding: data!, as: UTF8.self).data(using: .utf8)
                    print(utf8Data as Any)
                    
                    let json : Dictionary = try JSONSerialization.jsonObject(with: utf8Data!, options: []) as! Dictionary<String, Any>
                    
                    print(json["rows"] as Any)
                    let rowData : NSArray = json["rows"] as! NSArray
                    
                    for dictionary in rowData {
                        let dict = dictionary as! NSDictionary
                        
                        if let title : String = (dict.value(forKey: "title") as? String){
                           self.titleArray.append(title)
                        } else {
                            self.titleArray.append("")
                        }
                        
                        if let desc = (dict.value(forKey: "description") as? String) {
                             self.descArray.append(desc)
                        } else {
                            self.descArray.append("")
                        }
                        
                        if let imgData = (dict.value(forKey: "imageHref") as? String) {
                             self.imageArray.append(imgData)
                        } else {
                            self.imageArray.append("")
                        }
                    
                    }
                    
                    print(self.titleArray.count)
                    print(self.descArray.count)
                    print(self.imageArray.count)
                    self.delegate?.updateTable()
                    
                } catch let error {
                    print(error)
                }
            }
        })
        task.resume()
        
    }
}
