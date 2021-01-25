//
//  LoginViewController.swift
//  VinhomeReportApi
//
//  Created by Công on 12/13/20.
//

import UIKit

class LoginViewController: UIViewController {
    
 
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var hotLineLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var hiddenPasswordbutton: UIButton!
    
    var iconClickPassword = true
    
    
    
    deinit {
        print("Huỷ LoginViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layOut()
        self.scrollView = TPKeyboardAvoidingScrollView()
        //scrollView.backgroundColor = .white
        // xử lý button ẩn hiện mật khẩu
        
        
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
        passwordTextField.placeholder = "Mật khẩu"
        passwordTextField.isSecureTextEntry = true
        
        //layout button login
        logInButton.setTitle("ĐĂNG NHẬP", for: .normal)
        logInButton.setTitleColor(UIColor.white, for: .normal)
        logInButton.backgroundColor = UIColor.mainColor()
        logInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        logInButton.layer.cornerRadius = 5
        
        //layout hotline label
        let mainString = "Hotline: 033.1996"
        let stringToColor = "033.1996"
        let range = (mainString as NSString).range(of: stringToColor)
        
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.mainColor(), range: range)
        
        hotLineLabel.attributedText = mutableAttributedString
        
        //button Register
        registerButton.setTitle("ĐĂNG KÝ", for: .normal)
        registerButton.setTitleColor(UIColor.black, for: .normal)
        registerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        registerButton.layer.cornerRadius = 5
        
    }
    
    @IBAction func register(_ sender: Any) {
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        guard let phone = phoneNumberTextField.text, !phone.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            AlertHelper.sorry(message: "Vui lòng nhập đầy đủ thông tin", viewController: self)
            return
        }
        ApiManager.shared.login(phone: phone, password: password) { [weak self] in
            guard let strongSelf = self else { return }
            let profileVC = ProfileViewController()
            strongSelf.navigationController?.pushViewController(profileVC, animated: false)
        } failure: { (err) in
            AlertHelper.sorry(message: err, viewController: self)
        }
    }
    
    // xử lý ẩn hiện mật khẩu
    @IBAction func hiddenPasswordButton(_ sender: Any) {
        if(iconClickPassword == true) {
            passwordTextField.isSecureTextEntry = true
            hiddenPasswordbutton.setImage(UIImage(named: "iconpassword2"), for: .normal )
        }else {
            passwordTextField.isSecureTextEntry = false
            hiddenPasswordbutton.setImage(UIImage(named: "iconpassword"), for: .normal )
        }
        iconClickPassword = !iconClickPassword
    }
}
