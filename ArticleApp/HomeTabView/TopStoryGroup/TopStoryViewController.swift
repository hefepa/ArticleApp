//
//  TopStoryViewController.swift
//  ArticleApp
//
//  Created by WEMA on 18/01/2024.
//

import UIKit

class TopStoryViewController: UIViewController {
    
    var data: [TopStoriesProperties]?
    var storyModel: TopStoriesModel?
    
    
    @IBOutlet weak var myTableVIew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableVIew.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        myTableVIew.register(UINib(nibName: "TopStoryTableViewCell", bundle: nil), forCellReuseIdentifier: "TopStoryTableViewCell")
        
        myTableVIew.dataSource = self
        myTableVIew.delegate = self
        
        Task{
            await getStories()
        }
    
    }
    func getStories() async {
        let networkCall = NetworkCall()
        do {
            storyModel = try await networkCall.fetch(url: URL(string: "https://api.nytimes.com/svc/topstories/v2/science.json?api-key=KG3MjLoQuGKVvfZr8wgqlGrgV4sWmjBW")!)
            //print("output is \(storyModel)")
            
            self.data = self.storyModel?.results
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        230
    }
    
    
}
