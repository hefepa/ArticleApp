//
//  ArchiveDetailsViewController.swift
//  ArticleApp
//
//  Created by WEMA on 19/01/2024.
//

import UIKit

class ArchiveDetailsViewController: UIViewController {
    
    var populateData: BookProperties?
    
    
    let imgView: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let titleLabel: UILabel = {
        var title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.font = .systemFont(ofSize: 20, weight: .semibold)
        title.numberOfLines = 0
        return title
    }()
    
    let descriptionLabel: UILabel = {
        var description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.numberOfLines = 0
        description.textAlignment = .justified
        return description
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(imgView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        title = "Books"
        
        NSLayoutConstraint.activate(
            [
                imgView.heightAnchor.constraint(equalToConstant: 200),
                imgView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
                imgView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                imgView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                
                
                titleLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 10),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                
                descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
                descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        let url = URL(string: (populateData?.book_image!)!)
        imgView.kf.setImage(with: url)
        
        
        //imgView.image = UIImage(systemName: (populateData?.book_image)!)
        titleLabel.text = populateData?.title
        descriptionLabel.text = populateData?.description
    }

}
