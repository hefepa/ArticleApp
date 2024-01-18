//
//  BookTableViewCell.swift
//  ArticleApp
//
//  Created by WEMA on 18/01/2024.
//

import UIKit
import Kingfisher

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewContainer.layer.cornerRadius = 20
        viewContainer.layer.shadowColor = UIColor.black.cgColor
        viewContainer.layer.shadowOpacity = 0.1
        viewContainer.layer.shadowOffset = CGSize(width: 2, height: 2)
        viewContainer.layer.shadowRadius = 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func updateCell(with data: BookProperties?){
        titleLabel.text = data?.title
        authorLabel.text = data?.author
        descriptionLabel.text = data?.description
        
        let url = URL(string: (data?.book_image!)!)
        img.kf.setImage(with: url)
    }
}

