//
//  SideMenuViewController.swift
//  VinhomeReportApi
//
//  Created by Công on 1/21/21.
//

import UIKit
import Stevia

class HeaderView: UIView {

    let contentView: UIView = {
        let view = UIView()
       // view.backgroundColor = UIColor.groupTableViewBackground
        view.backgroundColor = UIColor.AppColor.pinkLight1
        return view
    }()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "quochuy")
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.tintColor = UIColor.mainColor()
        imageView.layer.borderColor = UIColor.mainColor().cgColor
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Phạm Thành Công"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "0336661996"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let rightView: UIView = {
        let view = UIView()
        return view
    }()
    
    func setupLayout(){
        self.sv(
            contentView.sv(
                photoImageView,
                rightView.sv(nameLabel, phoneLabel)
            ),
            lineView)
        
        self.layout(
            0,
            |-0-contentView-0-| ~ self.frame.height - 2,
            |-0-lineView.height(2)-0-|
        )
        
        contentView.layout(
            |-16-photoImageView.width(80).height(80)-16-rightView-0-|
        )
        
        photoImageView.centerVertically()
        
        photoImageView.layer.cornerRadius = 40
        photoImageView.layer.masksToBounds = true
        
        rightView.layout(
            5,
            |-0-nameLabel-0-|,
            8,
            |-0-phoneLabel-0-|
        )
        
        nameLabel.centerVertically(-16)
        phoneLabel.centerVertically(16)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init")
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

