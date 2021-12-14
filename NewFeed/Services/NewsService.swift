//
//  NewsService.swift
//  NewFeed
//
//  Created by Никита Троян on 14.12.2021.
//

import Foundation
import SwiftyJSON
import PromiseKit
import Alamofire
import PMKFoundation

final class NewsService {
    let token = Session.shared.token
    let userId = Session.shared.userId
    let urlString = "https://api.vk.com/method/newsfeed.get"
    
    private func makeUrlRequest() -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/newsfeed.get"
        components.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "userId", value: userId),
            URLQueryItem(name: "filters", value: "post"),
            URLQueryItem(name: "count", value: "1"),
            URLQueryItem(name: "v", value: "5.81"),
            URLQueryItem(name: "max_photos", value: "1"),
        ]
        
        var request = URLRequest(url: components.url!)
        request.method = .get
        return request
    }
    
    func getItems() -> Promise<[Items]> {
        return firstly{
                URLSession.shared.dataTask(.promise, with: makeUrlRequest())
            }.then(on: DispatchQueue.global(qos: .background)) { urlResponse in
                let itemsData = urlResponse.data["response"]["items"]
                return Promise.value(try JSONDecoder().decode(Items.self, from: itemsData))
            }
        }

        
        func getGroups() -> Promise<Groups> {
            return Promise { seal in
                
            }
        }
        
        func getProfiles() -> Promise<Profiles> {
            return Promise { seal in
                
            }
        }
    }

//func getGroups() -> Promise<[GroupModel]> {
//         return Promise<[GroupModel]> { resolver in
//
//             let method = "/groups.get"
//
//             let parameters: Parameters = [
//                 "user_id": userId,
//                 "access_token": token,
//                 "v": version,
//                 "extended": 1
//             ]

//             let url = baseURL + method
//
//             AF.request(url, method: .get, parameters: parameters).responseJSON { response in
//
//                 if let error = response.error {
//                     resolver.reject(error)
//                 }
//                 if let data = response.data {
//
//                     debugPrint(response.data?.prettyJSON as Any)
//
//                     do {
//                         let jsonContainer: Any = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//                         let object = jsonContainer as! [String: Any]
//                         let response = object["response"] as! [String: Any]
//                         let items = response["items"] as! [Any]
//
//                         let groups = items.map{GroupModel(item: $0 as! [String: Any])}
//                         resolver.fulfill(groups)
//
//                     } catch {
//                         print(error)
//                     }
//                 }
//             }
//         }
//     }
