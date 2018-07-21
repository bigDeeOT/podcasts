//
//  APIService.swift
//  PodcastCourseLBTA
//
//  Created by Dewayne Perry on 6/24/18.
//  Copyright © 2018 The United States of America. All rights reserved.
//

import Foundation
import Alamofire
import FeedKit

class APIService {
    
    static let shared = APIService()
    
    func fetchEpisodes(feedUrl: String, completionHandler: @escaping ([Episode]) -> ()) {
        let securedUrl = feedUrl.toSecureHTTPS()
        guard let url = URL(string: securedUrl) else {return}
        DispatchQueue.global(qos: .background).async {
            let parser = FeedParser(URL: url)
            parser?.parseAsync { (result) in
                print("succesfully parsed feed:", result.isSuccess)
                guard let feed = result.rssFeed else {return}
                completionHandler(feed.toEpisodes())
            }
        }
    }
    
    func fetchPodcast(searchText: String, completionHandler: @escaping ([Podcast]) -> ()) {
        let url = "https://itunes.apple.com/search"
        let parameters = ["term" : searchText, "media" : "podcast"]
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).response { (dataResponse) in
            if let err = dataResponse.error {
                print(err)
                return
            }
            guard let data = dataResponse.data else {return}
            do {
                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
                guard let results = searchResult.results else {return}
                completionHandler(results)
            } catch let err {
                print("fail to decode: ", err)
            }
        }
    }
    
    struct SearchResults: Decodable {
        let resultCount: Int?
        let results: [Podcast]?
    }
}
