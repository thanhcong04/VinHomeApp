//
//  ChangePasswordViewController.swift
//  VinhomeReportApi
//
//  Created by Công on 12/22/20.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var oldPasswordTextFiled: UITextField!
    
    @IBOutlet weak var newPasswordTextFiled: UITextField!
    
    @IBOutlet weak var confirmPassWorldTextFiled: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        layOut()
        setupNaviBar()
        //navigationItem.leftBarButtonItem?.tintColor = UIColor.AppColor.pinkLight4
        // Do any additional setup after loading the view.
    }
    func setupNaviBar(){
        navigationItem.title = "Đổi mật khẩu"
        let signoutButton = UIBarButtonItem(image: UIImage.init(systemName: "chevron.backward"), style: .done, target: self, action: #selector(onBack))
        navigationItem.leftBarButtonItem = signoutButton
        navigationItem.leftBarButtonItem?.tintColor = UIColor.AppColor.pinkLight4
    }
    
    @objc func onBack(){
        self.navigationController?.popViewController(animated: true)
    }
    //hien thi thanh navibar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }

    func layOut() {
        // layout txt mật khẩu cũ
        oldPasswordTextFiled.borderStyle = .roundedRect
        oldPasswordTextFiled.textColor = UIColor.AppColor.pinkLight4
        oldPasswordTextFiled.tintColor = UIColor.AppColor.pinkLight4
        oldPasswordTextFiled.keyboardType = .default
        oldPasswordTextFiled.placeholder = "Mật khẩu cũ"
        
        // layout txt mật khẩu mới
        newPasswordTextFiled.borderStyle = .roundedRect
        newPasswordTextFiled.textColor = UIColor.AppColor.pinkLight4
        newPasswordTextFiled.tintColor = UIColor.AppColor.pinkLight4
        newPasswordTextFiled.keyboardType = .default
        newPasswordTextFiled.placeholder = "Mật khẩu mới"
        
        // layout txt Xác nhận mật khẩu
        confirmPassWorldTextFiled.borderStyle = .roundedRect
        confirmPassWorldTextFiled.textColor = UIColor.AppColor.pinkLight4
        confirmPassWorldTextFiled.tintColor = UIColor.AppColor.pinkLight4
        confirmPassWorldTextFiled.keyboardType = .default
        confirmPassWorldTextFiled.placeholder = "Xác nhận mật khẩu"
        
        //layout button Lưu
        saveButton.setTitle("Lưu", for: .normal)
        saveButton.setTitleColor(UIColor.white, for: .normal)
        saveButton.backgroundColor = UIColor.mainColor()
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        saveButton.layer.cornerRadius = 5
    }
    
    @IBAction func SaveButton(_ sender: Any) {
        //check ký tự trống của cac textfiled
        guard let oldPassword = oldPasswordTextFiled.text, !oldPassword.isEmpty,
              let newPassowrd = newPasswordTextFiled.text, !newPassowrd.isEmpty,
              let confirmPassword = confirmPassWorldTextFiled.text, confirmPassword == newPassowrd else {
            AlertHelper.sorry(message: "Vui lòng nhập đầy đủ thông tin", viewController: self)
            return
        }
        UserDefaults.standard.removeObject(forKey: "password")
        ApiManager.shared.changePassword(oldPassword: oldPassword, newPassword: confirmPassword) {
            AlertHelper.confirmOrCancel(message: "Đổi mật khẩu thành công", viewController: self) {
                self.navigationController?.popToRootViewController(animated: true)
            }
        } failure: { (msg) in
            AlertHelper.sorry(message: msg, viewController: self)
        }
        
    }
    
}
