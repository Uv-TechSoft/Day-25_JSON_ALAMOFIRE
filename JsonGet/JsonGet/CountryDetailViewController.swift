//
//  CountryDetailViewController.swift
//  JsonGet
//
//  Created by Yogesh Patel on 14/12/21.
//

import UIKit

class CountryDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var countryDict = [String: Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}

extension CountryDetailViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countryDict.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else{
            return UITableViewCell()
        }
       
        let sortDict = countryDict.sorted(by: { $0.key < $1.key })
        
        let key = sortDict.map{ $0.key }[indexPath.row]
        let value = sortDict.map{ $0.value }[indexPath.row]
        
//        let key = Array(sortDict.keys)[indexPath.row]
//        let value = Array(sortDict.values)[indexPath.row]
        cell.textLabel?.text = "\(key) : \(value)"
        /*
        let key = Array(countryDict.keys)[indexPath.row]
//        let value = Array(countryDict.values)[indexPath.row]
        if let value = countryDict[key]{
            
            cell.textLabel?.text = "\(key) : \(value)"
        }
        */
        return cell
    }
}
