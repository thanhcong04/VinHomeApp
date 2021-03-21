//
//  ListIssueCell.swift
//  VinhomeReportApi
//
//  Created by Công on 3/21/21.
//

import Foundation
import Stevia

class ListIssueCell: UITableViewCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Vỡ ống nước"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        
        label.text = "CT07 - Hoa phượng 6 chung cư Bắc Hà"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "08:52"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let CreatByLabel: UILabel = {
        let label = UILabel()
        
        label.text = "20/10/2019"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    var issue: Issue? {
        didSet {
            if let issue = issue {
                titleLabel.text = issue.title
                contentLabel.text = issue.content
                CreatByLabel.text = issue.createdBy
                timeLabel.text = issue.createdAt
            }
        }
    }
    func setupLayout(){
        self.sv(
            titleLabel, contentLabel, CreatByLabel, titleLabel
        )
        
        self.layout(
            16,
            |-16-titleLabel-(>=5)-timeLabel-16-|,
            16,
            |-16-contentLabel.width(self.frame.size.width/2)-(>=5)-CreatByLabel-16-|,
            16
        )
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

