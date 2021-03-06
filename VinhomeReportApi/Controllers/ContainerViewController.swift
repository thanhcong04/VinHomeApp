//
//  ContainerViewController.swift
//  VinhomeReportApi
//
//  Created by Công on 1/21/21.
//

//màn hình này đi coppy ở https://www.youtube.com/watch?v=dB-vB9uDRCI
import UIKit

class ContainerViewController: UIViewController {

    var menuController : UIViewController!
    var centerController: UIViewController!
    var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.AppColor.pinkLight1
        configMenuViewController()
        configSideMenuViewController()
    }
    
    // An nut back khi goi vao
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // mày sắc của statusBar
//    override var preferredStatusBarStyle: UIStatusBarStyle{
//        return .darkContent
//    }
    
    func configMenuViewController() {
        let homeController = HomeViewController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configSideMenuViewController() {
        if menuController == nil {
            menuController = SideMenuViewController()
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("Did add menu controller...")
        }
    }
    
    func showSideMenuViewController(shouldExpend : Bool) {
        if shouldExpend {
            //show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        }else{
            //hide menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }, completion: nil)
            
        }
    }

}
extension ContainerViewController: HomeViewControllerDelage {
    func handleMenuToggle() {
        
        if !isExpanded{
            configSideMenuViewController()
        }
        isExpanded = !isExpanded
        showSideMenuViewController(shouldExpend: isExpanded)
    }
    
    
}
