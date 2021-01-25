//
//  ProfileViewController.swift
//  VinhomeReportApi
//
//  Created by Công on 12/13/20.
//

import UIKit
import Kingfisher

class ProfileViewController: UIViewController {
    deinit {
        print("Huỷ HomeViewController")
    }

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var dayOfBirthTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!

    
    var userProfile: User?
    // tạo một biến kiểm tra màn hình profile có phải là màn đầu tiên khi vào app hay không
    // giá trị là true thì là màn đầu tiên
    var isFirst: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layOut()
        setupNaviBar()
        getProfile()

    }
    
    // gọi lại hàm lấy dữ liệu profile sau khi update
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getProfile()
     
    }
    
    //cấu hình thanh navibar
    func setupNaviBar(){
        let editButton = UIBarButtonItem(image: UIImage(systemName: "pencil"), style: .done, target: self, action: #selector(onEdit))
        
        let changePasswordButton = UIBarButtonItem(image: UIImage(systemName: "lock"), style: .done, target: self, action: #selector(changePassword))
        
        navigationItem.rightBarButtonItems = [editButton, changePasswordButton]
        
        let signoutButton = UIBarButtonItem(image: UIImage.init(systemName: "return"), style: .done, target: self, action: #selector(onLogout))
        navigationItem.leftBarButtonItem = signoutButton
    }

    func layOut() {
        
        //layout avatar
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
//        avatarImage.image = UIImage(named: "add-photo")
        avatarImage.contentMode = .scaleAspectFill
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = 60
        avatarImage.layer.borderWidth = 1
        avatarImage.layer.borderColor = UIColor.AppColor.pinkLight4.cgColor
        
        // layout txt số điện thoại
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.textColor = UIColor.AppColor.pinkLight4
        userNameTextField.tintColor = UIColor.AppColor.pinkLight4
        userNameTextField.keyboardType = .numberPad
        userNameTextField.placeholder = "Họ và tên"
        userNameTextField.isUserInteractionEnabled = false
        
        // layout txt ngày sinh
        dayOfBirthTextField.borderStyle = .roundedRect
        dayOfBirthTextField.textColor = UIColor.AppColor.pinkLight4
        dayOfBirthTextField.tintColor = UIColor.AppColor.pinkLight4
        dayOfBirthTextField.keyboardType = .default
        dayOfBirthTextField.placeholder = "Ngày sinh"
        dayOfBirthTextField.isUserInteractionEnabled = false
        
        // layout txt Điạ chỉ
        addressTextField.borderStyle = .roundedRect
        addressTextField.textColor = UIColor.AppColor.pinkLight4
        addressTextField.tintColor = UIColor.AppColor.pinkLight4
        addressTextField.keyboardType = .numberPad
        addressTextField.placeholder = "Địa chỉ"
        addressTextField.isUserInteractionEnabled = false
        
        
        // layout txt số điện thoại
        phoneNumberTextField.borderStyle = .roundedRect
        phoneNumberTextField.textColor = UIColor.AppColor.pinkLight4
        phoneNumberTextField.tintColor = UIColor.AppColor.pinkLight4
        phoneNumberTextField.keyboardType = .default
        phoneNumberTextField.placeholder = "Số điện thoại"
        phoneNumberTextField.isUserInteractionEnabled = false
        
        // layout txt Email
        EmailTextField.borderStyle = .roundedRect
        EmailTextField.textColor = UIColor.AppColor.pinkLight4
        EmailTextField.tintColor = UIColor.AppColor.pinkLight4
        EmailTextField.keyboardType = .default
        EmailTextField.placeholder = "Email"
        EmailTextField.isUserInteractionEnabled = false
        
//        //layout button login
//        saveButton.setTitle("Lưu", for: .normal)
//        saveButton.setTitleColor(UIColor.white, for: .normal)
//        saveButton.backgroundColor = UIColor.mainColor()
//        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
//        saveButton.layer.cornerRadius = 5
    }
    @objc func onLogout(){
        UserDefaults.standard.removeObject(forKey: "token")
//        if isFirst {
            // Nếu chưa có màn login trước đó, thì khởi tạo và show lên màn login
            let loginVC = LoginV2ViewController()
            let navigationController = UINavigationController(rootViewController: loginVC)
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true, completion: nil)
//        } else {
//            // Nếu đã có màn login trước đó, thì quay về màn đầu tiên
//            navigationController?.popToRootViewController(animated: true)
//        }
    }
    
    @objc func onEdit(){
        let backItem = UIBarButtonItem()
        backItem.title = "Cập nhật hồ sơ"
        navigationItem.backBarButtonItem = backItem
        
        let editVC = EditProfileViewController()
        // gửi profile sang màn account để chỉnh sửa
        editVC.profile = userProfile
        navigationController?.pushViewController(editVC, animated: true)
    }
    
    @objc func changePassword() {
        let editVC = ChangePasswordViewController()
        
        let backItem = UIBarButtonItem()
        backItem.title = "Đổi mật khẩu"
        navigationItem.backBarButtonItem = backItem
        AlertHelper.confirmOrCancel(message: "Bạn muốn thay đổi mật khẩu?", viewController: self) {
            self.navigationController?.pushViewController(editVC, animated: true)
        }
    }
    func getProfile(){
        ApiManager.shared.getProfile { [weak self] (data) in
            guard let strongSelf = self else { return }
            strongSelf.userProfile = data
            strongSelf.setupData(data)
        } failure: { (msg) in
            AlertHelper.sorry(message: msg, viewController: self)
        }
    }
    
    func setupData(_ data: User?){
        guard let data = data else { return }
        if data.avatar.isEmpty {
            avatarImage.image = UIImage(named: "logo")
        }else{
            avatarImage.setImage(urlString: data.avatar)
        }
        
        userNameTextField.text = data.name
        dayOfBirthTextField.text = data.dateOfBirth
        addressTextField.text = data.address
        phoneNumberTextField.text = data.phoneNumber
        EmailTextField.text = data.email
        
    }
}
