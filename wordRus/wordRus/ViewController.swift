//
//  ViewController.swift
//  wordRus
//
//  Created by Komal Kainth on 2022-04-16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // URL
        let url = URL(string: "https://random-words5.p.rapidapi.com/getMultipleRandom?count=1&wordLength=4")
        
        guard url != nil else {
            print ("Error creating url object")
            return
        }
        
        // URL Request
        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        
        // Specify the Header
        let header = ["X-RapidAPI-Host": "random-words5.p.rapidapi.com",
                       "X-RapidAPI-Key": "2375510fbemsh1e714d8d34bd7b3p1f5c70jsn41e12b66880a"]
        
        request.allHTTPHeaderFields = header
        
        
        
        // Set the request type
            
        request.httpMethod = "GET"
        
        // Get the URLSession
        
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })
        // Fire off the data task
        
        dataTask.resume()
    }

}
// Source
// https://www.youtube.com/watch?v=3nwcNLM3KOU&t=334s
