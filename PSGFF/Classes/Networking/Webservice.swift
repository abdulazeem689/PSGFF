//
//  Webservice.swift
//  PSGFF
//
//  Created by Abdul Azeem on 16/01/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import Foundation

class Webservice {
    
    //MARK:- generate request.
    
    class private func generateRequest(urlString: String, httpMethod: String)->URLRequest{
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = httpMethod
        return request
    }
    
    //MARK:- send request.
    
    class private func sendRequest(request: URLRequest, completion: @escaping (Data)->()){
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else{ return }
            completion(data)
        }.resume()
    }
    
    //MARK:- callApi method.
    
   class public func callApi(endPoint: String, httpMethod: String, completion: @escaping (Data)->()){
        let completeUrl = "\(kBaseUrl)\(endPoint)"
        let request = self.generateRequest(urlString: completeUrl, httpMethod: httpMethod)
        self.sendRequest(request: request, completion: completion)
    }
}
