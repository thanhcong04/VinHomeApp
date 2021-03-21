//
//  SideMenuViewController.swift
//  VinhomeReportApi
//
//  Created by Công on 1/21/21.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //    var tableView:UITableView = UITableView()
    //    let tableView: UITableView = {
    //        let tableView = UITableView()
    //        tableView.translatesAutoresizingMaskIntoConstraints = false
    //        return tableView
    //
    //    }()
    var userProfile: User?
    var menus = [Menu]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        createData()
        view.backgroundColor = UIColor.AppColor.pinkLight1
        tableView.backgroundColor = UIColor.AppColor.pinkLight1
        //regisster cell menu
        
        tableView.register(MenuCell.self, forCellReuseIdentifier: "MenuCell")
        
        //xóa các line giữa các tableview
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        // Do any additional setup after loading the view.
    }
    
    
    func createData(){
        let cell1 = Menu(icon: "ic_report", name: "Báo sự cố")
      //  let cell2 = Menu(icon: "ic_outden", name: "Danh sách sự cố")
        let cell3 = Menu(icon: "ic_user", name: "Hồ sơ")
        let cell4 = Menu(icon: "ic_settings", name: "Cập nhật hồ sơ")
        let cell5 = Menu(icon: "ic-key", name: "Đổi mật khẩu")
        let cell6 = Menu(icon: "ic_logout", name: "Đăng xuất")
        
        menus = [cell1, cell3, cell4, cell5, cell6]
    }
    
}
@available(iOS 13.0, *)
extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 150))
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.photoIcon.image = UIImage(named: menus[indexPath.row].icon)
        cell.titleLabel.text = menus[indexPath.row].name

        // Set màu cho cell
        cell.contentView.backgroundColor = UIColor.AppColor.pinkLight1
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = menus[indexPath.row].name
        
        switch name {
        case "Báo sự cố":
            let mainVC = CreatIssueViewController()
            self.navigationController?.pushViewController(mainVC, animated: true)

//        case "Danh sách sự cố":
//            let mainVC = HomeViewController()
////            self.navigationController?.pushViewController(mainVC, animated: true)
//            self.navigationController?.popViewController(animated: true)
//           
//          
//            self.navigationController?.isNavigationBarHidden = false
//           //        self.slideMenuController()?.changeMainViewController(mainVC, close: true)
        case "Hồ sơ":
            let mainVC = ProfileViewController()
            self.navigationController?.pushViewController(mainVC, animated: true)
        case "Cập nhật hồ sơ":
            let mainVC = EditProfileViewController()
            self.navigationController?.pushViewController(mainVC, animated: true)
        case "Đổi mật khẩu":
            let mainVC = ChangePasswordViewController()
            AlertHelper.confirmOrCancel(message: "Bạn muốn thay đổi mật khẩu?", viewController: self) {
                self.navigationController?.pushViewController(mainVC, animated: true)
            }
//            self.navigationController?.pushViewController(mainVC, animated: true)
        case "Đăng xuất":
            print("Đăng xuất")
            AlertHelper.confirmOrCancel(message: "Bạn có chắc chắn muốn đăng xuất?", viewController: self) {
                UserDefaults.standard.removeObject(forKey: "token")
                let loginVC = LoginV2ViewController()
                let navigationController = UINavigationController(rootViewController: loginVC)
                navigationController.modalPresentationStyle = .fullScreen
                self.present(navigationController, animated: false, completion: nil)
            }
        default:
            return
        }
    }
    
}
