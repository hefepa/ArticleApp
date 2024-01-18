//
//  ArchiveViewController.swift
//  ArticleApp
//
//  Created by WEMA on 18/01/2024.
//

import UIKit

class ArchiveViewController: UIViewController {
    
    let activityloader = UIActivityIndicatorView(style: .large)
    var data: [BookProperties]?
    var bookModel: BookModel?
    @IBOutlet weak var tableView:  UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityloader.hidesWhenStopped = true
        activityloader.center = view.center
        
        view.addSubview(activityloader)
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "BookTableViewCell")
        
        tableView?.dataSource = self
        tableView.delegate = self
        
        Task {
            await getBooks()
        }

    }
    
    func getBooks() async {
        activityloader.startAnimating()
        let networkCall = NetworkCall()
        do {
            bookModel = try await networkCall.fetchBooks(url: URL(string: "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=KG3MjLoQuGKVvfZr8wgqlGrgV4sWmjBW")!)
            print("output is \(bookModel)")
            
            self.data = self.bookModel?.results?.books
            activityloader.isHidden = true
            activityloader.stopAnimating()
            self.tableView.reloadData()
        }

        catch (let error){
            print(error.localizedDescription)
        }
    }

}
extension ArchiveViewController
: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data?.count ?? 0
//        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        let bookProperties = data?[indexPath.item]
        cell.updateCell(with: bookProperties)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        230
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataRetrieval = data?[indexPath.item]
        let detailPage = ArchiveDetailsViewController()
        detailPage.populateData = dataRetrieval
        navigationController?.pushViewController(detailPage, animated: true)
  }
}
