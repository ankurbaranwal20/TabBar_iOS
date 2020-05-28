//
//  ViewController.swift
//  TabBarPractice
//
//  Created by Ankur Baranwal on 18/10/2019.
//  Copyright © 2019 Ankur Baranwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        tabBar()
    }
    
    func tabBar(){
        
        let tabBarController = UITabBarController()
        
        let firstViewController = storyboard?.instantiateViewController(withIdentifier: "FirstViewControllerNav") as! UINavigationController
        firstViewController.tabBarItem = UITabBarItem(title: "Student", image: UIImage(named: "name"), tag: 0)
        
        let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewControllerNav") as! UINavigationController
        secondViewController.tabBarItem = UITabBarItem(title: "Teacher", image: UIImage(named: "name"), tag: 1)
        
        tabBarController.viewControllers = [firstViewController,secondViewController]
        tabBarController.modalPresentationStyle = .pageSheet
        self.present(tabBarController, animated: true, completion: nil)
    }


}

