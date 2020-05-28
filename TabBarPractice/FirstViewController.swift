//
//  FirstViewController.swift
//  TabBarPractice
//
//  Created by Ankur Baranwal on 18/10/2019.
//  Copyright © 2019 Ankur Baranwal. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    var student: [UserModel] = []
    var filteredData = [UserModel]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Student Department"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "DetailTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DetailTableViewCell")
        loadData()
        setUpSearchBar()
        
        searchBar.showsScopeBar = false
        searchBar.placeholder = "Search Student by Name"
        // Do any additional setup after loading the view.
    }
    func setUpSearchBar(){
        searchBar.delegate = self
    }
    
    func loadData(){
        let student1 = UserModel(name: "Ankur Baranwal", dept: "IOS")
        let student2 = UserModel(name: "Rohit Marwaha", dept: "Android")
        let student3 = UserModel(name: "Komal Sharma", dept: "IOS")
        let student4 = UserModel(name: "Harsh Chaurasiya", dept: "Frontent")
        let student5 = UserModel(name: "Krishna maurya", dept: "Backend")
        let student6 = UserModel(name: "Ankit Baranwal", dept: "Machine Learning")
        let student7 = UserModel(name: "Kuldeep Prashar", dept: "Devops")
        let student8 = UserModel(name: "Sarita Yadav", dept: "Cyber")

        student.append(student1)
        student.append(student2)
        student.append(student3)
        student.append(student4)
        student.append(student5)
        student.append(student6)
        student.append(student7)
        student.append(student8)

        filteredData = student

    }

}
extension FirstViewController: UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate{
    
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
        return "Student List"
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = student.filter({ (student) -> Bool in
            
            if searchText.isEmpty{
                return true
            }
            return student.name.lowercased().contains(searchText.lowercased()) || student.dept.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filteredData = student
    }
    
}
