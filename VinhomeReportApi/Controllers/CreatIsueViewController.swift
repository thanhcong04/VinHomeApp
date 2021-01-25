//
//  CreatIsueViewController.swift
//  VinhomeReportApi
//
//  Created by Công on 1/21/21.
//

import UIKit

class CreatIsueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
       
    }
    func setupNaviBar(){
        let signoutButton = UIBarButtonItem(image: UIImage.init(systemName: "return"), style: .done, target: self, action: #selector(onBack))
        navigationItem.leftBarButtonItem = signoutButton
    }

    //Back lại màn hìn trươc
    @objc func onBack(){
        //self.dismiss(animated: true, completion: nil)
        let homeVC = HomeViewController()
        navigationController?.pushViewController(homeVC, animated: true)

    }
}
