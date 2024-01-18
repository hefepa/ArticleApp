//
//  TabHomeController.swift
//  ArticleApp
//
//  Created by WEMA on 18/01/2024.
//

import UIKit

class TabHomeController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .systemGray6
        let topStoryController = TopStoryViewController()
        let archiveController = ArchiveViewController()

        topStoryController.tabBarItem.title = "Top Story"
        archiveController.tabBarItem.title = "Books"     
        
       
        
        topStoryController.tabBarItem.image = UIImage(systemName: "newspaper")
        archiveController.tabBarItem.image = UIImage(systemName: "books.vertical")
        
        topStoryController.tabBarItem.selectedImage = UIImage(systemName: "newspaper.fill")
        archiveController.tabBarItem.selectedImage = UIImage(systemName: "books.vertical.fill")
        
        setViewControllers([topStoryController, archiveController], animated: true)
    }
}
