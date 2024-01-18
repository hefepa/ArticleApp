//
//  TopStoryTableViewCell.swift
//  ArticleApp
//
//  Created by WEMA on 18/01/2024.
//

import UIKit

class TopStoryTableViewCell: UITableViewCell {

    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var titleTable: UILabel!
    @IBOutlet weak var subsectionLabel: UILabel!
    @IBOutlet weak var viewContainer: UIView!
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
    
    func updateCell(with data: TopStoriesProperties?){
        
        if (data?.subsection == ""){
            subsectionLabel.text = "General News"
        }else{
            subsectionLabel.text = data?.subsection
        }

        if (data?.title == ""){
                titleTable.text = "Opportunities for you"
        }else{
                titleTable.text = data?.title
            }
            
        if (data?.abstract == ""){
                abstractLabel.text = "Click here to see opportunities for you"
        }else{
            abstractLabel.text = data?.abstract
        }
    }
}
