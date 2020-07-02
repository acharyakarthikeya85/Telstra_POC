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
    let cellTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let cellDesc : UILabel = {
        let descr = UILabel()
        descr.translatesAutoresizingMaskIntoConstraints = false
        return descr
    }()
    
    lazy var cellImageHref : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let cellContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(cellTitle)
        self.contentView.addSubview(cellDesc)
        self.contentView.addSubview(cellImageHref)
        self.contentView.addSubview(cellContainerView)
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpConstraints(){
        cellImageHref.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        cellImageHref.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        cellImageHref.widthAnchor.constraint(equalToConstant:50).isActive = true
        cellImageHref.heightAnchor.constraint(equalToConstant:50).isActive = true
        
        cellContainerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        cellContainerView.leadingAnchor.constraint(equalTo:self.cellImageHref.trailingAnchor, constant:10).isActive = true
        cellContainerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        cellContainerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        cellTitle.topAnchor.constraint(equalTo:self.cellContainerView.topAnchor).isActive = true
        cellTitle.leadingAnchor.constraint(equalTo:self.cellContainerView.leadingAnchor).isActive = true
        cellTitle.trailingAnchor.constraint(equalTo:self.cellContainerView.trailingAnchor).isActive = true
        
        cellDesc.topAnchor.constraint(equalTo:self.cellTitle.bottomAnchor).isActive = true
        cellDesc.leadingAnchor.constraint(equalTo:self.cellContainerView.leadingAnchor).isActive = true
    }
    
}
