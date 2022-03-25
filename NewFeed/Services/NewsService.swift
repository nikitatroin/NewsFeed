//
//  NewsService.swift
//  NewFeed
//
//  Created by Никита Троян on 14.12.2021.
//

import Foundation
import PromiseKit
import PMKFoundation

final class NewsService {
    let token = Session.shared.token
    let userId = Session.shared.userId
    let decoder = JSONDecoder()
    
    private func makeUrlRequest() -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = "/method/newsfeed.get"
        components.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "userId", value: userId),
            URLQueryItem(name: "filters", value: "post"),
            URLQueryItem(name: "count", value: "5"),
            URLQueryItem(name: "v", value: "5.81"),
            URLQueryItem(name: "max_photos", value: "1"),
        ]
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        return request
    }
    
    func getItems() -> Promise<[NewsItems]> {
        return Promise<[NewsItems]> { resolver in
            firstly{
                URLSession.shared.dataTask(.promise, with: makeUrlRequest())
            }.tap { result in
                //debugPrint(result)
            }.compactMap { data, response in
                //debugPrint(data.prettyJSON as Any)
                let items = try self.decoder.decode(Feed.self, from: data)
                let newsItem = items.response.items
                resolver.fulfill(newsItem)
            }.catch { error in
                resolver.reject(error)
            }
        }
    }
    
    func getGroups() -> Promise<[Group]> {
        return Promise<[Group]> { resolver in
            firstly{
                URLSession.shared.dataTask(.promise, with: makeUrlRequest())
            }.tap { result in
                //debugPrint(result)
            }.compactMap { data, response in
                //debugPrint(data.prettyJSON as Any)
                let items = try self.decoder.decode(Feed.self, from: data)
                let groups = items.response.groups
                resolver.fulfill(groups)
            }.catch { error in
                resolver.reject(error)
            }
        }
    }
    
    func getProfiles() -> Promise<[Profile]> {
        return Promise<[Profile]> { resolver in
            firstly{
                URLSession.shared.dataTask(.promise, with: makeUrlRequest())
            }.tap { result in
                //debugPrint(result)
            }.compactMap { data, response in
                //debugPrint(data.prettyJSON as Any)
                let items = try self.decoder.decode(Feed.self, from: data)
                let profiles = items.response.profiles
                resolver.fulfill(profiles)
            }.catch { error in
                resolver.reject(error)
            }
        }
    }
}

