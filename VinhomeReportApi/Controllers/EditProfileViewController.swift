//
//  EditProfileViewController.swift
//  VinhomeReportApi
//
//  Created by Công on 12/22/20.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    deinit {
        print("Huỷ HomeViewController")
    }
    

    
    @IBOutlet weak var cameraImage: UIImageView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var dayOfBirthTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!

    var profile: User?
    var userProfile: User?
    var imagePicker: UIImagePickerController!
    var newUrl: String?
   
    // Chen them scroll view
    let scrollView: TPKeyboardAvoidingScrollView = {
        let scrollView = TPKeyboardAvoidingScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layOut()
        setupData(profile)
        getProfile()
        
        setupNaviBar()
        view.backgroundColor = UIColor.white
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(selectedImage))
        avatarImage.addGestureRecognizer(tapImage)
        cameraImage.addGestureRecognizer(tapImage)
        
        // Xu ly button luu
        saveButton.addTarget(self, action: #selector(saveData), for: .touchUpInside)
        navigationItem.leftBarButtonItem?.tintColor = UIColor.AppColor.pinkLight4

   
    }
    func setupNaviBar(){
        navigationItem.title = "Cập nhật hồ sơ"
        let signoutButton = UIBarButtonItem(image: UIImage.init(systemName: "chevron.backward"), style: .done, target: self, action: #selector(onBack))
        navigationItem.leftBarButtonItem = signoutButton
        navigationItem.leftBarButtonItem?.tintColor = UIColor.AppColor.pinkLight4
        
        //set màu cho navi bar
        navigationController?.navigationBar.barTintColor = UIColor.AppColor.pinkLight1
        navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc func onBack(){
        self.navigationController?.popViewController(animated: true)
    }
    // hien thi thanh navibar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    
    func layOut() {
        
        //layout avatar
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        //avatarImage.image = UIImage(named: "add-photo")
        avatarImage.contentMode = .scaleAspectFill
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = 60
        avatarImage.layer.borderWidth = 2
        avatarImage.tintColor = UIColor.AppColor.pinkLight4
        avatarImage.layer.borderColor = UIColor.mainColor().cgColor
        
        
        //layout camera
        cameraImage.translatesAutoresizingMaskIntoConstraints = false
        //avatarImage.image = UIImage(named: "add-photo")
        cameraImage.contentMode = .scaleAspectFill
        cameraImage.clipsToBounds = true
        //cameraImage.layer.borderWidth = 1
        cameraImage.isUserInteractionEnabled = true
        cameraImage.tintColor = UIColor.AppColor.pinkLight4
        
        // layout txt số điện thoại
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.textColor = UIColor.AppColor.pinkLight4
        userNameTextField.tintColor = UIColor.AppColor.pinkLight4
        userNameTextField.keyboardType = .default
        userNameTextField.placeholder = "Họ và tên"
        
        // layout txt ngày sinh
        dayOfBirthTextField.borderStyle = .roundedRect
        dayOfBirthTextField.textColor = UIColor.AppColor.pinkLight4
        dayOfBirthTextField.tintColor = UIColor.AppColor.pinkLight4
        dayOfBirthTextField.keyboardType = .numberPad
        dayOfBirthTextField.placeholder = "Ngày sinh"
        
        // layout txt Điạ chỉ
        addressTextField.borderStyle = .roundedRect
        addressTextField.textColor = UIColor.AppColor.pinkLight4
        addressTextField.tintColor = UIColor.AppColor.pinkLight4
        addressTextField.keyboardType = .default
        addressTextField.placeholder = "Địa chỉ"
        
        // layout txt số điện thoại
        phoneNumberTextField.borderStyle = .roundedRect
        phoneNumberTextField.textColor = UIColor.AppColor.pinkLight4
        phoneNumberTextField.tintColor = UIColor.AppColor.pinkLight4
        phoneNumberTextField.keyboardType = .numberPad
        phoneNumberTextField.placeholder = "Số điện thoại"
        
        // layout txt Email
        EmailTextField.borderStyle = .roundedRect
        EmailTextField.textColor = UIColor.AppColor.pinkLight4
        EmailTextField.tintColor = UIColor.AppColor.pinkLight4
        EmailTextField.keyboardType = .default
        EmailTextField.placeholder = "Email"
        
        //layout button login
        saveButton.setTitle("Lưu", for: .normal)
        saveButton.setTitleColor(UIColor.white, for: .normal)
        saveButton.backgroundColor = UIColor.AppColor.pinkLight4
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        saveButton.layer.cornerRadius = 5
    }
    
    func setupData(_ data: User?){
        guard let data = data else { return }
        if data.avatar.isEmpty {
            avatarImage.image = UIImage(named: "add-photo")
        }else{
            avatarImage.setImage(urlString: data.avatar)
        }
        userNameTextField.text = data.name
        dayOfBirthTextField.text = data.dateOfBirth
        addressTextField.text = data.address
        phoneNumberTextField.text = data.phoneNumber
        EmailTextField.text = data.email
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
    
    @objc func selectedImage(){
        let alert = UIAlertController(title: "Report App", message: "Chọn ảnh từ", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
        let camera = UIAlertAction(title: "Máy ảnh", style: .default, handler: { (_) in
            self.fromCamera(self.imagePicker, target: self)
        })
        let libray = UIAlertAction(title: "Thư viện", style: .default, handler: { (_) in
            self.fromLibrary(self.imagePicker, target: self)
        })
        
        alert.addAction(camera)
        alert.addAction(libray)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
   
    @objc func saveData(){
        guard let name = userNameTextField.text,
              let date = dayOfBirthTextField.text,
              let address = addressTextField.text,
              let email = EmailTextField.text,
              let profile = userProfile else {
            return
        }
        
        profile.name = name
        profile.dateOfBirth = date
        profile.address = address
        profile.email = email
        // Check nếu không thay đổi gì ảnh thì giữ nguyên ảnh cũ làm avatar
        if newUrl != nil {
            profile.avatar = newUrl ?? ""
        }
        
        
        ApiManager.shared.updateProfile(userProfile: profile) {
            AlertHelper.sorry(message: "Cập nhật thành công", viewController: self)
        } failure: { (msg) in
            AlertHelper.sorry(message: msg, viewController: self)
        }

    }
    
}
extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("error: \(info)")
            return
        }
        
        ApiManager.shared.upload(image: selectedImage) { [weak self] (url) in
            guard let strongSelf = self, let path = url?.path else { return }
//            strongSelf.cameraImage.setImage(urlString: path)
            strongSelf.avatarImage.setImage(urlString: path)
            strongSelf.newUrl = path
        } failure: { (msg) in
            AlertHelper.sorry(message: msg, viewController: self)
        }

        dismiss(animated: true, completion: nil)
    }
}
