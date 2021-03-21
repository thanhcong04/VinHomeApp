//
//  CreatIssueViewController.swift
//  VinhomeReportApi
//
//  Created by Công on 3/10/21.
//

import UIKit

class CreatIssueViewController: UIViewController {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    @IBOutlet weak var titleTxt: UITextField!
    
    @IBOutlet weak var contenTxt: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    var items: [Media] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
        layout()
        CollectionView.delegate = self
        CollectionView.register(Media2CollectionViewCell.self, forCellWithReuseIdentifier: "Media2CollectionViewCell")
//        CollectionView.backgroundColor = .groupTableViewBackground
        
   
        
        let image1 = UIImage(named: "ic_camera")
        items.insert(Media(image: image1, isDelete: false), at: 0)
        
        let image2 = UIImage(named: "ic_camera")
        items.insert(Media(image: image2, isDelete: true), at: 0)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func setupNaviBar(){
        navigationItem.title = "Báo cáo"
        let signoutButton = UIBarButtonItem(image: UIImage.init(systemName: "chevron.backward"), style: .done, target: self, action: #selector(onBack))
        navigationItem.leftBarButtonItem = signoutButton
        navigationItem.leftBarButtonItem?.tintColor = UIColor.AppColor.pinkLight4
        
        //set màu cho navi bar
        navigationController?.navigationBar.barTintColor = UIColor.AppColor.pinkLight1
        navigationController?.navigationBar.isTranslucent = false
    }

    //Back lại màn hìn trươc
    @objc func onBack(){
        self.navigationController?.popViewController(animated: true)
//        let homeVC = HomeViewController()
//        navigationController?.pushViewController(homeVC, animated: true)

    }
    
    func layout(){
        // Sủa lại giao diện nút lưu
        saveButton.layer.borderWidth = 0.5
        saveButton.layer.borderColor = UIColor.AppColor.pinkLight1.cgColor
        saveButton.setTitle("Gửi", for: .normal)
        saveButton.setTitleColor(UIColor.AppColor.white, for: .normal)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        saveButton.backgroundColor = UIColor.AppColor.pinkLight2
        
        titleTxt.layer.borderWidth = 0.3
        titleTxt.layer.borderColor = UIColor.AppColor.grayLight2.cgColor
        titleTxt.textColor = UIColor.AppColor.grayLight3
        titleTxt.tintColor = UIColor.AppColor.grayLight3
        titleTxt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 3, height: titleTxt.frame.height)) // set cho text cách lề trái 3pxl
        titleTxt.leftViewMode = .always
        
        contenTxt.layer.borderWidth = 0.3
        contenTxt.layer.borderColor = UIColor.AppColor.grayLight2.cgColor
        contenTxt.textColor = UIColor.AppColor.grayLight3
        contenTxt.tintColor = UIColor.AppColor.grayLight3
        contenTxt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 3, height: titleTxt.frame.height)) // set cho text cách lề trái 3pxl
        contenTxt.leftViewMode = .always
    }
    
    @IBAction func saveData(_ sender: Any) {
       
        
        guard let title = titleTxt.text, !title.isEmpty else {
            AlertHelper.sorry(message: "Vui lòng nhập tên sự cố", viewController: self)
            return
        }
        guard let content = contenTxt.text, !content.isEmpty else {
            AlertHelper.sorry(message: "Vui lòng mô tả chi tiết sự cố", viewController: self)
            return
        }
        
        let issue = Issue()
        issue.title = title
        issue.content = content

        ApiManager.shared.createIssue(issue: issue, success: {
            AlertHelper.sorry(message: "Gửi sự cố thành công", viewController: self)
        }) { (error) in
            AlertHelper.sorry(message: error, viewController: self)
            print ("Lỗi cmnr")
        }
    }
    
}
extension CreatIssueViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Media2CollectionViewCell", for: indexPath) as! Media2CollectionViewCell
        cell.image = items[indexPath.row]
        cell.passAction = { [weak self] in
            guard let strongSelf = self else { return }
            print("tap delete")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size.height
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == items.count - 1 {
            print("select image")
        }
    }
    
    
}
