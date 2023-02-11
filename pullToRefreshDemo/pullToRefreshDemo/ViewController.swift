//
//  ViewController.swift
//  pullToRefreshDemo
//
//  Created by Mac on 09/02/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{


    @IBOutlet weak var myTableView: UITableView!
    
    var dataArray: [String] = []
    
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        refreshControl.attributedTitle = NSAttributedString(string: "Loading...")
        refreshControl.addTarget(self, action: #selector(pullToRefresh(sender:)), for: .valueChanged)
        myTableView.refreshControl = refreshControl
    }
    
    
    @objc func pullToRefresh(sender: UIRefreshControl) {
        let elementCount = dataArray.count
        dataArray.append("Element \(elementCount)")
        sender.endRefreshing()
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = dataArray[indexPath.row]
        return cell!
    }
}



