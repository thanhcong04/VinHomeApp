//
//  RegisterViewController.swift
//  VinhomeReportApi
//
//  Created by Công on 12/13/20.
//

import UIKit

class RegisterViewController: UIViewController {


    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var hotlineLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layOut()
        registerButton.addTarget(self, action: #selector(onRegister), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }

    func layOut() {
        
        // layout txt số điện thoại
        phoneNumberTextField.borderStyle = .roundedRect
        phoneNumberTextField.textColor = UIColor.mainColor()
        phoneNumberTextField.tintColor = UIColor.mainColor()
        phoneNumberTextField.keyboardType = .numberPad
        phoneNumberTextField.placeholder = "Số điện thoại"
        
        // layout txt password
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.textColor = UIColor.mainColor()
        passwordTextField.tintColor = UIColor.mainColor()
        passwordTextField.keyboardType = .default
        passwordTextField.placeholder = "mật khẩu"
        
        //layout button register
        registerButton.setTitle("ĐĂNG KÝ", for: .normal)
        registerButton.setTitleColor(UIColor.white, for: .normal)
        registerButton.backgroundColor = UIColor.mainColor()
        registerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        registerButton.layer.cornerRadius = 5
        
        //layout hotline label
        let mainString = "Hotline: 033.1996"
        let stringToColor = "033.1996"
        let range = (mainString as NSString).range(of: stringToColor)
        
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.mainColor(), range: range)

        hotlineLabel.attributedText = mutableAttributedString
  
    }

    @objc func onRegister(){
        guard let name = userNameTextField.text, !name.isEmpty,
              let phone = phoneNumberTextField.text, !phone.isEmpty,
              let password = passwordTextField.text, !password.isEmpty
        else {
            AlertHelper.sorry(message: "Vui lòng nhập đầy đủ thông tin", viewController: self)
            return
        }
        
        ApiManager.shared.register(name: name, phone: phone, password: password) { [weak self] in
            guard let strongSelf = self else { return }
            let homeVC = ProfileViewController()
            strongSelf.navigationController?.pushViewController(homeVC, animated: false)
        } failure: { (msg) in
            AlertHelper.sorry(message: msg, viewController: self)
        }

}
}
