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
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic-menu"), style: .plain, target: self, action: #selector(handleMenuToggle))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.AppColor.pinkLight4
        
        
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToCreateIssue))
        navigationItem.rightBarButtonItems = [addBarButtonItem]
        addBarButtonItem.tintColor = UIColor.AppColor.pinkLight4
        navigationController?.navigationBar.barTintColor = UIColor.AppColor.black
        
        //set màu cho navi bar
        navigationController?.navigationBar.barTintColor = UIColor.AppColor.pinkLight1
        navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc func goToCreateIssue(){
        let createVC = CreatIssueViewController()
        navigationController?.pushViewController(createVC, animated: true)
    }
 
}
