//
//  NetworkManager.swift
//  ShopetizersGHB
//
//  Created by Samit Koyom on 17/6/2568 BE.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://www.itgenius.co.th/sandbox_api/"
    static let shopetizerURL = baseURL + "shopetizers/"
    
    private init() {}
    
    // สร้าง method อ่านข้อมูลจาก API
    func getShopetizers(completed: @escaping(Result<[Shopetizer], NetworkError>) -> Void) {
        
        guard let url = URL(string: NetworkManager.shopetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, response,
            error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decoderResponse = try decoder.decode(ShopetizerResponse.self, from: data)
                completed(.success(decoderResponse.request))
                
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
        
    }
    
}
