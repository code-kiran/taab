//
//  HeadlineNews.swift
//  taab
//
//  Created by kiran on 9/5/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit

struct Welcome: Decodable {
    let status: String?
    let totalResults: Double?
    let articles: [Article]?
}

struct Article: Decodable {
    let source: Source?
    let author, title, description, url: String?
    let urlToImage: String?
    let publishedAt: Date?
}

struct Source: Decodable {
    let id, name: String?
}



class HeadlineNews: UIViewController {

    @IBOutlet weak var headlineTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        headlineTableView.delegate = self
        headlineTableView.dataSource = self
    let jsonStringUrl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=20d5805b80704399b088612693a0ce0a"
        guard let url = URL(string: jsonStringUrl) else {return print("invalid linke")  }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
            }
            print("do stuffs here")
            guard  let data = data else { return }
            
            do {
                let headlineData = try JSONDecoder().decode(Welcome.self, from: data)
                print(headlineData)
            } catch let jsonError {
                print("error \(jsonError)")
            }
            
        }.resume()
        
    }
}




extension HeadlineNews: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 373
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = headlineTableView.dequeueReusableCell(withIdentifier: "HeadlineCell", for: indexPath) as? HeadlineCell
        return cell!
    }
    

    
}
