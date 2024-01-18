//
//  TopStoryDetailsViewController.swift
//  ArticleApp
//
//  Created by WEMA on 19/01/2024.
//

import UIKit

class TopStoryDetailsViewController: UIViewController {
    var populateData: TopStoriesProperties?

    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Stories"
        
        titleLabel.text = populateData?.title
        contentLabel.text = populateData?.abstract
    }
}
