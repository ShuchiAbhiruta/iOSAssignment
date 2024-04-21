//
//  NetworkManager.swift
//  iOSAssignment
//
//  Created by Shuchi Abhiruta on 21/04/24.
//

import Foundation
import UIKit

final class NetworkManager{
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    private let endpointURL = "https://acharyaprashant.org/api/v2/content/misc/media-coverages?limit=100"
    
    private init() {}
    
    func getImageData(completed:@escaping (Result<[ImageDataResponse], ImageLoaderError>) -> Void){
        guard let url = URL(string: endpointURL) else{
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error{
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completed(.failure(.invalidResponse))
                return
            }
                   
            guard let data = data else{
                completed(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let decodeResponse = try decoder.decode([ImageDataResponse].self, from: data)
                completed(.success(decodeResponse))
            }catch{
                completed(.failure(.invalidData))
            }
        }
        task.resume()
        
    }
    
    
    func downloadImage(fromURLString urlString:String, completed:@escaping(UIImage?) -> Void){
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else{
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, response, error in
            guard let data = data, let image = UIImage(data: data) else{
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
        
    }
    
}
