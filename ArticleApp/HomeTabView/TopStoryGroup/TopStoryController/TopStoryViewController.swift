//
//  TopStoryViewController.swift
//  ArticleApp
//
//  Created by WEMA on 18/01/2024.
//

import UIKit

class TopStoryViewController: UIViewController {
    let activityLoader = UIActivityIndicatorView(style: .large)
    var data: [TopStoriesProperties]?
    var storyModel: TopStoriesModel?
    
    
    @IBOutlet weak var myTableVIew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(activityLoader)
        activityLoader.hidesWhenStopped = true
        activityLoader.center = view.center
        
        myTableVIew.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        myTableVIew.register(UINib(nibName: "TopStoryTableViewCell", bundle: nil), forCellReuseIdentifier: "TopStoryTableViewCell")
        
        myTableVIew.dataSource = self
        myTableVIew.delegate = self
        
        Task{
            await getStories()
        }
    
    }
    func getStories() async {
        activityLoader.startAnimating()
        let networkCall = NetworkCall()
        do {
            storyModel = try await networkCall.fetchStories(url: URL(string: "https://api.nytimes.com/svc/topstories/v2/science.json?api-key=KG3MjLoQuGKVvfZr8wgqlGrgV4sWmjBW")!)
            //print("output is \(storyModel)")
            
            self.data = self.storyModel?.results
            activityLoader.hidesWhenStopped = true
            activityLoader.stopAnimating()
            self.myTableVIew.reloadData()
            
        }

        catch (let error){
            print(error.localizedDescription)
        }
    }
    
}

extension TopStoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableVIew.dequeueReusableCell(withIdentifier: "TopStoryTableViewCell", for: indexPath) as! TopStoryTableViewCell
        let storyProperties = data?[indexPath.item]
        cell.updateCell(with: storyProperties)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        230
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataRetrieval = data?[indexPath.item]
        let detailsPage = TopStoryDetailsViewController()
        detailsPage.populateData = dataRetrieval
        navigationController?.pushViewController(detailsPage, animated: true)
    }
    
}
