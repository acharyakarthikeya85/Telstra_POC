//
//  ViewController.swift
//  TELSTRA_POC
//
//  Created by Karthikeya  on 29/06/20.
//  Copyright © 2020 Karthikeya . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, didFinishDownloadDelegate {

    var myTableView : UITableView = UITableView()
    let model = CanadaDataModel()
    var imageLoader = ImageLoader()

    var loading = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        setTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (loading) {
            return 1
        } else {
            return model.titleArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CanadaDataCell", for: indexPath) as! CanadaDataCell

        if(loading){
          // Loading in progress and data from api call not yet available.
        } else {
            cell.cellTitle.text = model.titleArray[indexPath.row]
            cell.cellDesc.text = model.descArray[indexPath.row]
            
            DispatchQueue.main.async {
                self.imageLoader.obtainImageWithPath(imagePath: self.model.imageArray[indexPath.row]) { (image) in
                    cell.cellImageHref.image = image
                }
            }
        }
        return cell
    }
    
    func setTableView(){
        view.backgroundColor = UIColor.red
        view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false

        myTableView.separatorColor = UIColor.blue
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(CanadaDataCell.self, forCellReuseIdentifier: "CanadaDataCell")
        
        myTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        myTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        myTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        model.fetchFirstPage()
    }

    func updateTable() {
        loading = false
        DispatchQueue.main.async {
            self.myTableView.reloadData()
        }
        
    }
    
}

