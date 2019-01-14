//
//  NewsViewController.swift
//  MyTechNews
//
//  Created by Naoki Muroya on 2019/01/10.
//  Copyright © 2019 Naoki. All rights reserved.
//
    
import UIKit
import Alamofire
import SwiftyJSON

class NewsViewController: UITableViewController {
    
    @IBOutlet var newsTableView: UITableView!
    
    var urlForApi = ""
    
    var articleList = [Article]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        newsTableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "articleCell")
        configureTableView()
        updateNewsData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articleList.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell

        cell.titleBody.text = articleList[indexPath.row].title
        cell.url = articleList[indexPath.row].url
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToWKWebView", sender: indexPath.row)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! WKWebViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.targetUrl = articleList[indexPath.row].url
        }
    }

    func configureTableView() {
        newsTableView.rowHeight = UITableView.automaticDimension
        newsTableView.estimatedRowHeight = 80.0
    }
    
    
    
    func updateNewsData() {
        
        getNewsData() { (articles) in
            
            guard let articleArray = articles?.articles else
            {fatalError("cannot get articles.")}
            
            for article in articleArray {
                
                self.articleList.append(article)
                
            }
            self.tableView.reloadData()
//            print(articleArray)
            
        }
    }
    
    
    func getNewsData(completion: @escaping (ArticlesListResult?) -> Void) {
        Alamofire.request(urlForApi, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    if let data = response.data {
                        let articles = try? JSONDecoder().decode(ArticlesListResult.self, from: data)
                        completion(articles)
                    }
                } else {
                    print("Error: \(String(describing: response.result.error))")
                }
        }
    }
    
    
    
}



