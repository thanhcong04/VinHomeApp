//
//  MenuCell.swift
//  VinhomeReportApi
//
//  Created by Công on 1/29/21.
//

// Các sử dụng thư viện steiva : https://techmaster.vn/posts/35191/layout-giao-dien-bang-thu-vien-stevia
import UIKit
import Stevia

class MenuCell: UITableViewCell {
    
    let photoIcon: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    func setupLayout(){
        self.sv(photoIcon, titleLabel)
        self.layout(
            |-16-photoIcon.width(28).height(28)-16-titleLabel-8-|
        )
        
        photoIcon.centerVertically()
        titleLabel.centerVertically()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        setupLayout()
    }
    
}

