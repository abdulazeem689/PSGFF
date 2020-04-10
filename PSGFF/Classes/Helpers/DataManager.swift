//
//  DataManager.swift
//  PSGFF
//
//  Created by Abdul Azeem on 15/01/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import Foundation

class  DataManager {
        
    //MARK:- parse getTutorials API data.
    
    class func getTutorialsData(completion: @escaping ([DataStruct])->()) {
        let endpoint = EndpointEnum.tutorialsEndpoint
        Webservice.callApi(endPoint: endpoint.rawValue, httpMethod: kHttpMethod) { (data) in
            do{
                let response = try JSONDecoder().decode(TutorialStruct.self, from: data)
                DispatchQueue.main.async {
                    completion(response.data ?? [])
                }
                completion(response.data ?? [])
            }catch{
                print(error)
            }
        }
    }
    
    //MARK:- parse getTrendingAtPSGFF API data.
    
    class func getTrendingData(completion: @escaping ([TrendingData])->()) {
        let endpoint = EndpointEnum.trendingEndpoint
        Webservice.callApi(endPoint: endpoint.rawValue, httpMethod: kHttpMethod) { (data) in
            do{
                let response = try JSONDecoder().decode(TrendingStruct.self, from: data)
                completion(response.data ?? [])
            }catch{
                print(error)
            }
        }
    }
    
    //MARK:- parse getContributorsList API.
    
    class func getContributorsList(completion: @escaping ([ContributorsData])->()) {
        let endpoint = EndpointEnum.contributorsEndpoint
        Webservice.callApi(endPoint: endpoint.rawValue, httpMethod: kHttpMethod) { (data) in
            do{
                let response = try JSONDecoder().decode(ContributorStruct.self, from: data)
                completion(response.data ?? [])
            }catch{
                print(error)
            }
        }
    }
    
    //MARK:- parse getMessages API.
    
    class func getMessages(completion: @escaping ([MessageData])->()) {
        let endpoint = EndpointEnum.messagesEndpoint
        Webservice.callApi(endPoint: endpoint.rawValue, httpMethod: kHttpMethod) { (data) in
            do{
                let response = try JSONDecoder().decode(MessageStruct.self, from: data)
                completion(response.data ?? [])
            }catch{
                print(error)
            }
        }
    }
}
