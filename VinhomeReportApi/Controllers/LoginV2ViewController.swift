//
//  LoginV2ViewController.swift
//  VinhomeReportApi
//
//  Created by Công on 1/14/21.
//

import UIKit


class LoginV2ViewController: UIViewController {
    @IBOutlet weak var view21: UIView!
    @IBOutlet weak var view22: UIView!
    @IBOutlet weak var view2: UIView!

    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var titleLogin: UIButton!
    @IBOutlet weak var imageBanner: UIImageView!
    @IBOutlet weak var titleRegister: UIButton!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var userNameTextFieldRegister: UITextField!
    
    @IBOutlet weak var hotlineLabel: UILabel!
    
    @IBOutlet weak var phoneNumberTextFieldRegister: UITextField!
    @IBOutlet weak var passwordTextFieldRegister: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view21.isHidden = true
        view22.isHidden = false
        phoneNumberTextField.text = "0336661996"
        passwordTextField.text = "123456"
        layout()
   
    }
//    // An nut back khi goi vao
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = true
//        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
//        UINavigationBar.appearance().backgroundColor = UIColor.AppColor.grayLight1
        
    }

    func layout() {
        
        view2.layer.borderWidth = 1
        //view2.layer.borderColor = UIColor.systemGray5.cgColor
        view2.layer.borderColor = UIColor.AppColor.grayLight1.cgColor
        
        
        phoneNumberTextField.layer.borderWidth = 0.3
        //phoneNumberTextField.layer.cornerRadius = 4
        phoneNumberTextField.layer.borderColor = UIColor.AppColor.grayLight3.cgColor
        phoneNumberTextField.textColor = UIColor.AppColor.grayLight3
        phoneNumberTextField.tintColor = UIColor.AppColor.grayLight3
        phoneNumberTextField.keyboardType = .numberPad
        phoneNumberTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: phoneNumberTextField.frame.height)) // set cho text cách lề trái 10pxl
        phoneNumberTextField.leftViewMode = .always
        
        
        passwordTextField.layer.borderWidth = 0.3
        //passwordTextField.layer.cornerRadius = 4
        passwordTextField.layer.borderColor = UIColor.AppColor.grayLight2.cgColor
        passwordTextField.textColor = UIColor.AppColor.grayLight3
        passwordTextField.tintColor = UIColor.AppColor.grayLight3
        passwordTextField.isSecureTextEntry = true
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextField.frame.height)) // set cho text cách lề trái 10pxl
        passwordTextField.leftViewMode = .always
        
        //CGColor(red: 239, green: 238, blue: 238, alpha: 100)
        userNameTextFieldRegister.layer.borderWidth = 0.3
        //userNameTextFieldRegister.layer.cornerRadius = 4
        userNameTextFieldRegister.layer.borderColor = UIColor.AppColor.grayLight2.cgColor
        userNameTextFieldRegister.textColor = UIColor.AppColor.grayLight3
        userNameTextFieldRegister.tintColor = UIColor.AppColor.grayLight3
        userNameTextFieldRegister.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: userNameTextFieldRegister.frame.height)) // set cho text cách lề trái 10pxl
        userNameTextFieldRegister.leftViewMode = .always
        
        phoneNumberTextFieldRegister.layer.borderWidth = 0.3
        //phoneNumberTextFieldRegister.layer.cornerRadius = 4
        phoneNumberTextFieldRegister.layer.borderColor = UIColor.AppColor.grayLight2.cgColor
        phoneNumberTextFieldRegister.textColor = UIColor.AppColor.grayLight3
        phoneNumberTextFieldRegister.tintColor = UIColor.AppColor.grayLight3
        phoneNumberTextFieldRegister.keyboardType = .numberPad
        phoneNumberTextFieldRegister.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: phoneNumberTextFieldRegister.frame.height)) // set cho text cách lề trái 10pxl
        phoneNumberTextFieldRegister.leftViewMode = .always
        
        passwordTextFieldRegister.layer.borderWidth = 0.3
        //passwordTextFieldRegister.layer.cornerRadius = 4
        passwordTextFieldRegister.layer.borderColor = UIColor.AppColor.grayLight2.cgColor
        passwordTextFieldRegister.textColor = UIColor.AppColor.grayLight3
        passwordTextFieldRegister.tintColor = UIColor.AppColor.grayLight3
        passwordTextFieldRegister.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextFieldRegister.frame.height)) // set cho text cách lề trái 10pxl
        passwordTextFieldRegister.leftViewMode = .always
        
        //titleLogin.layer.borderWidth = 1.2
       // titleLogin.layer.borderColor = UIColor.AppColor.pinkLight1.cgColor
        titleLogin.setTitle("Đăng nhập", for: .normal)
        titleLogin.setTitleColor(UIColor.AppColor.grayLight3, for: .normal)
       // titleLogin.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
       // titleRegister.layer.borderWidth = 1.2
        //titleRegister.layer.borderColor = UIColor.AppColor.pinkLight1.cgColor
        titleRegister.setTitle("Đăng ký", for: .normal)
        titleRegister.setTitleColor(UIColor.AppColor.grayLight3, for: .normal)
        //titleRegister.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        loginButton.layer.borderWidth = 0.3
        loginButton.layer.borderColor = UIColor.AppColor.pinkLight1.cgColor
        loginButton.setTitle("Đăng nhập", for: .normal)
        loginButton.setTitleColor(UIColor.AppColor.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        registerButton.layer.borderWidth = 0.3
        registerButton.layer.borderColor = UIColor.AppColor.pinkLight1.cgColor
        registerButton.setTitle("Đăng ký", for: .normal)
        registerButton.setTitleColor(UIColor.AppColor.white, for: .normal)
        registerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        
        
        //layout hotline label
        let mainString = "Hotline: 033.1996"
        let stringToColor = "033.1996"
        let range = (mainString as NSString).range(of: stringToColor)
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.AppColor.pinkLight3, range: range)
        hotlineLabel.attributedText = mutableAttributedString
        
    }

    
    @IBAction func titleLogin(_ sender: Any) {
        view22.isHidden = false
        view21.isHidden = true
        imageBanner.image = UIImage(named: "visuaicon1")
        titleLogin.backgroundColor = UIColor.AppColor.white
        titleRegister.backgroundColor = UIColor.AppColor.grayLight1
        
    
        //(red: 241, green: 241, blue: 241, alpha: 100)
        
    }
    
    @IBAction func titleRegister(_ sender: Any) {
        view21.isHidden = false
        view22.isHidden = true
        imageBanner.image = UIImage(named: "visuaicon3")
        titleRegister.backgroundColor = UIColor.AppColor.white
        titleLogin.backgroundColor = UIColor.AppColor.grayLight1 //(red: 241, green: 241, blue: 241, alpha: 100)
    }
    
    @IBAction func clearDataButton(_ sender: Any) {
        phoneNumberTextField.text = ""
      //  phoneNumberTextField.isFocused = true
        passwordTextField.text = ""

    }
    
    @IBAction func login(_ sender: Any) {
        
        guard let phone = phoneNumberTextField.text, !phone.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            AlertHelper.sorry(message: "Vui lòng nhập đầy đủ thông tin", viewController: self)
            return
        }
        ApiManager.shared.login(phone: phone, password: password) { [weak self] in
            guard let strongSelf = self else { return }
            let profileVC = ContainerViewController()
            strongSelf.navigationController?.pushViewController(profileVC, animated: false)
        } failure: { (err) in
            AlertHelper.sorry(message: err, viewController: self)
        }
    }
    
    // Xử lý đăng ký tài khoản
        @IBAction func onRegister(_ sender: Any) {

    // Check điều kiện không bỏ trống thông tin nhập
        guard let name = userNameTextFieldRegister.text, !name.isEmpty,
              let phone = phoneNumberTextFieldRegister.text, !phone.isEmpty,
              let password = passwordTextFieldRegister.text, !password.isEmpty
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


