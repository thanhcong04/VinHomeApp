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
        
        view.backgroundColor = UIColor.white
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(selectedImage))
        avatarImage.addGestureRecognizer(tapImage)
        cameraImage.addGestureRecognizer(tapImage)
        
        // Xu ly button luu
        saveButton.addTarget(self, action: #selector(saveData), for: .touchUpInside)

   
    }
    
    
    
    func layOut() {
        
        //layout avatar
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        //avatarImage.image = UIImage(named: "add-photo")
        avatarImage.contentMode = .scaleAspectFill
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = 82
        avatarImage.layer.borderWidth = 2
        avatarImage.tintColor = UIColor.mainColor()
        avatarImage.layer.borderColor = UIColor.mainColor().cgColor
        
        
        //layout camera
        cameraImage.translatesAutoresizingMaskIntoConstraints = false
        //avatarImage.image = UIImage(named: "add-photo")
        cameraImage.contentMode = .scaleAspectFill
        cameraImage.clipsToBounds = true
        //cameraImage.layer.borderWidth = 1
        cameraImage.isUserInteractionEnabled = true
        cameraImage.tintColor = UIColor.mainColor()
        
        // layout txt số điện thoại
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.textColor = UIColor.mainColor()
        userNameTextField.tintColor = UIColor.mainColor()
        userNameTextField.keyboardType = .default
        userNameTextField.placeholder = "Họ và tên"
        
        // layout txt ngày sinh
        dayOfBirthTextField.borderStyle = .roundedRect
        dayOfBirthTextField.textColor = UIColor.mainColor()
        dayOfBirthTextField.tintColor = UIColor.mainColor()
        dayOfBirthTextField.keyboardType = .numberPad
        dayOfBirthTextField.placeholder = "Ngày sinh"
        
        // layout txt Điạ chỉ
        addressTextField.borderStyle = .roundedRect
        addressTextField.textColor = UIColor.mainColor()
        addressTextField.tintColor = UIColor.mainColor()
        addressTextField.keyboardType = .default
        addressTextField.placeholder = "Địa chỉ"
        
        // layout txt số điện thoại
        phoneNumberTextField.borderStyle = .roundedRect
        phoneNumberTextField.textColor = UIColor.mainColor()
        phoneNumberTextField.tintColor = UIColor.mainColor()
        phoneNumberTextField.keyboardType = .numberPad
        phoneNumberTextField.placeholder = "Số điện thoại"
        
        // layout txt Email
        EmailTextField.borderStyle = .roundedRect
        EmailTextField.textColor = UIColor.mainColor()
        EmailTextField.tintColor = UIColor.mainColor()
        EmailTextField.keyboardType = .default
        EmailTextField.placeholder = "Email"
        
        //layout button login
        saveButton.setTitle("Lưu", for: .normal)
        saveButton.setTitleColor(UIColor.white, for: .normal)
        saveButton.backgroundColor = UIColor.mainColor()
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
              let profile = profile else {
            return
        }
        
        profile.name = name
        profile.dateOfBirth = date
        profile.address = address
        profile.email = email
        // Check nếu không thay đổi gì ảnh thì giữ nguyên ảnh cũ làm avatar
        if newUrl == "" {
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
