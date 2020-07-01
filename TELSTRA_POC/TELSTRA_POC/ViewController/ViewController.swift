//
//  ViewController.swift
//  TELSTRA_POC
//
//  Created by Karthikeya  on 29/06/20.
//  Copyright © 2020 Karthikeya . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var myTableView : UITableView = UITableView()
    let model = CanadaDataModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false

        myTableView.dataSource = self
        myTableView.register(CanadaDataCell.self, forCellReuseIdentifier: "CanadaDataCell")
        
        myTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        myTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        myTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        model.fetchFirstPage()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CanadaDataCell", for: indexPath) as! CanadaDataCell
//        let rowNum : Int = indexPath.row
//        print(" Total title items \(model.titleArray.count)")
//        print("Total description items \(model.descArray.count)")
//        cell.title.text = model.titleArray[rowNum]
//        cell.desc.text =  model.descArray[rowNum]
        // Need to handle sync between model and vc class.
        return cell
    }


}

