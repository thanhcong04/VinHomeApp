//
//  MediaCollectionViewCell.swift
//  VinhomeReportApi
//
//  Created by Công on 3/20/21.
//

import UIKit

class MediaCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photeImageView: UIImageView!
    @IBOutlet weak var deleteButton: UIButton!
    
  
    
    
    var image: Media? {
        didSet {
            if let image = image {
                photeImageView.image = image.image
                deleteButton.isHidden = !image.isDelete
            }
        }
    }
    var passAction: (() -> Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
//        photeImageView.image = UIImage(named: "ic_camera")
       
        
    }
    @IBAction func onTabDelete(_ sender: Any) {
        passAction?()
        print("onTapDelete")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Lỗi: Chưa làm kiểu khởi tạo này")
    }
    
}

