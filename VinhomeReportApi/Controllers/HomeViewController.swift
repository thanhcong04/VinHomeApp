//
//  HomeViewController.swift
//  VinhomeReportApi
//
//  Created by Công on 1/21/21.
//

import UIKit
 

class HomeViewController: UIViewController {
    
    var delegate : HomeViewControllerDelage?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = UIColor.AppColor.white
        

        // Do any additional setup after loading the view.
    }
    
    @objc func handleMenuToggle(){
        delegate?.handleMenuToggle()
        print("äbcbcbcbc")
    }
    
    
    func setupNavigationBar(){
        navigationItem.title = "Danh sách sự cố"
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic-menu"), style: .plain, target: self, action: #selector(handleMenuToggle))

        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToCreateIssue))
     //   let searchBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(search))
        navigationItem.rightBarButtonItems = [addBarButtonItem]
        //addBarButtonItem.tintColor = UIColor.AppColor.pinkLight4
       // searchBarButtonItem.tintColor = UIColor.white
        //navigationController?.navigationBar.barTintColor = UIColor.AppColor.black
    
        //self.setupSlideMenuItem()
    }

    @objc func goToCreateIssue(){
        let createVC = CreatIsueViewController()
        navigationController?.pushViewController(createVC, animated: true)
    }
    
    
}
