//
//  ArchiveViewController.swift
//  ArticleApp
//
//  Created by WEMA on 18/01/2024.
//

import UIKit

class ArchiveViewController: UIViewController {
    
    var data: [BookProperties]?
    var bookModel: BookModel?
    @IBOutlet weak var tableView:  UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "BookTableViewCell")
        
        tableView?.dataSource = self
        tableView.delegate = self
        
        Task {
            await getBooks()
        }

    }
    
    func getBooks() async {
        let networkCallTwo = NetworkCallTwo()
        do {
            bookModel = try await networkCallTwo.fetch(url: URL(string: "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=KG3MjLoQuGKVvfZr8wgqlGrgV4sWmjBW")!)
            print("output is \(bookModel)")
            
            self.data = self.bookModel?.results?.books
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
}
