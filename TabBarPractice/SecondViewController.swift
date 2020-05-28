//
//  SecondViewController.swift
//  TabBarPractice
//
//  Created by Ankur Baranwal on 18/10/2019.
//  Copyright © 2019 Ankur Baranwal. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var teacher: [UserModel] = []
    var filteredData = [UserModel]()
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Teacher Department"
        searchBar.delegate = self
        searchBar.showsScopeBar = false
        searchBar.placeholder = "Search Teacher by Name"
        
        tableView.delegate = self
        tableView.dataSource = self

        let nib = UINib(nibName: "DetailTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DetailTableViewCell")
        
        loadData()
        // Do any additional setup after loading the view.
    }
 
    func loadData(){
        let teac1 = UserModel(name: "Hardeep Singh", dept: "IOS")
        let teac2 = UserModel(name: "Neeraj Chawla", dept: "IOS")
        let teac3 = UserModel(name: "Rahul Dhiman", dept: "Android")
        let teac4 = UserModel(name: "Nazish Ali", dept: "Android")
        let teac5 = UserModel(name: "Madhurdeep Singh", dept: "Frontent")
        let teac6 = UserModel(name: "Akshat", dept: "Backend")
        let teac7 = UserModel(name: "Shubham garg", dept: "Frontent")
        let teac8 = UserModel(name: "Gonic", dept: "Everything")
        
        teacher.append(teac1)
        teacher.append(teac2)
        teacher.append(teac3)
        teacher.append(teac4)
        teacher.append(teac5)
        teacher.append(teac6)
        teacher.append(teac7)
        teacher.append(teac8)
        
        filteredData = teacher
    }


}
extension SecondViewController: UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as? DetailTableViewCell else{
            fatalError("Cell is not laoded")
        }
        cell.nameLabel.text = filteredData[indexPath.row].name
        cell.departmentLabel.text = filteredData[indexPath.row].dept
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Teacher List"
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = teacher.filter({ (teacher) -> Bool in
            
            if searchText.isEmpty{
                return true
            }
            return teacher.name.lowercased().contains(searchText.lowercased()) || teacher.dept.lowercased().contains(searchText.lowercased())
            
        })
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {

        filteredData = teacher
 
    }
    
}
