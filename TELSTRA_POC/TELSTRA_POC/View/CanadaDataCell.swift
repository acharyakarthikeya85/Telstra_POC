//
//  CanadaDataCell.swift
//  TELSTRA_POC
//
//  Created by Karthikeya  on 29/06/20.
//  Copyright © 2020 Karthikeya . All rights reserved.
//

import Foundation
import UIKit

class CanadaDataCell : UITableViewCell{
    let title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let desc : UILabel = {
        let descr = UILabel()
        descr.translatesAutoresizingMaskIntoConstraints = false
        return descr
    }()
    
    let imageHref : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
}
