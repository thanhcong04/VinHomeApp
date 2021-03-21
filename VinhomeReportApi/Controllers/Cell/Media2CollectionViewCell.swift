//
//  Media2CollectionViewCell.swift
//  VinhomeReportApi
//
//  Created by Công on 3/20/21.
//

import UIKit
import Stevia

class Media2CollectionViewCell: UICollectionViewCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_camera")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let iconButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "ic_x"), for: .normal)
        return button
    }()
    
    var image: Media? {
        didSet {
            if let image = image {
                photoImageView.image = image.image
                iconButton.isHidden = !image.isDelete
            }
        }
    }
    
    func setupLayout(){
        self.sv(
            containerView.sv(
                photoImageView.sv(iconButton)
            )
        )
        
        self.layout(
            4,
            |-0-containerView-2-|,
            4
        )
        
        containerView.layout(
            0,
            |-0-photoImageView-0-|,
            0
        )
        photoImageView.Height == photoImageView.Width
        
        photoImageView.layout(
            4,
            |-iconButton.width(photoImageView.frame.size.width/10)-(4)-|
        )
        
    }
   
    
    var passAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        iconButton.addTarget(self, action: #selector(onTapDelete), for: .touchUpInside)
    }
    
    @objc func onTapDelete(){
        passAction?()
        print("onTapDelete")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Lỗi: Chưa làm kiểu khởi tạo này")
    }
    
}
