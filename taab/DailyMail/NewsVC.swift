//
//  NewsVC.swift
//  taab
//
//  Created by kiran on 9/4/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit

class NewsVC: UIViewController {
    @IBOutlet weak var newsTableView: UITableView!
    var articles:[ArticlesObject]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.delegate = self
        newsTableView.dataSource = self
        fetchArticles()
    }
    
    func fetchArticles() {
        self.articles = [ArticlesObject]()
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?sources=daily-mail&apiKey=20d5805b80704399b088612693a0ce0a")!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as!  [String: AnyObject]
                
                if let articlesFromJson = json["articles"] as? [[String: AnyObject]] {
                    
                    for articleFromJson in articlesFromJson {
                        let article = ArticlesObject()
                        if let title = articleFromJson["title"] as? String{
                            article.titleHeading = title
                        }
                        if let description = articleFromJson["description"] as? String {
                            article.desc = description
                        }
                        
                        if let author = articleFromJson["author"] as? String {
                            article.author?.name = author
                          //  print(article.author?.name)
                        }
                        if let url = articleFromJson["url"] as? String {
                            article.url = url
                        }
                        if let imageToUrl = articleFromJson["urlToImage"] as? String {
                            article.imageToUrl = imageToUrl
                            
                        }
                        
//                        if let date = articleFromJson["publishedAt"] as? String {
//                            let formatter = DateFormatter()
//                            formatter.dateFormat = "dd-MM"
//                            if   let formatteddate = formatter.string(from: date) as? Date {
//                                article.pubishedAt = (formatteddate)
//
//                            }
//                           // print(formatteddate)
//                        }
                        self.articles?.append(article)
                    }
                }
                DispatchQueue.main.async {
                    self.newsTableView.reloadData()
                    
                }
            } catch let error {
                print(error)
            }
        }
        task.resume()
        
    }
    
}


extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 153
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellVC
        cell.newsTitle.text = self.articles?[indexPath.row].titleHeading
        cell.newsDescription.text = self.articles?[indexPath.row].desc
        cell.newsAuthor.text = self.articles?[indexPath.row].author?.name
       // cell.newsReadMore.text = self.articles?[indexPath.row].pubishedAt
        cell.newsImage.downloadImages(from: (articles?[indexPath.row].imageToUrl)!)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "NewsLandingVC") as? NewsLandingVC {
            if let url = self.articles?[indexPath.row].url {
                vc.url1 = url
            }
            self.navigationController?.present(vc, animated: true, completion: nil)
        }
    }
    
}

//for downloading image from url
extension UIImageView {
    func downloadImages(from url: String) {
        let urlRequest = URLRequest.init(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()

    }

}

