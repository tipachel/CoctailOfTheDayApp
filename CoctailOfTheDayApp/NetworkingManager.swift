//
//  NetworkingManager.swift
//  CoctailOfTheDayApp
//
//  Created by Tipachel on 26.11.2021.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init () {}
    
    func fetchData(from url: String?, with completition: @escaping(Cocktail) -> Void) {
        
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) {data, _,error in
            guard let data = data else {
                print(error ?? "unexpectable error")
                return
            }
            
            do {
                let cocktails = try JSONDecoder().decode(Cocktail.self, from: data)
                DispatchQueue.main.async {
                    completition(cocktails)
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
        
        
    }
    
}


