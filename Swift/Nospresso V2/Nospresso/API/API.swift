//
//  API.swift
//  Nospresso
//
//  Created by Treinamento on 22/07/22.
//

import Foundation

protocol APIProtocol {
    
}

class API {
    
    func request(success: () -> Void) {
        let url = URL(string: "http://localhost:3000/cafes")
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode([Coffee].self, from: data!)
                print(decodedData)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func requestMachines(success: () -> Void) {
        let url = URL(string: "http://localhost:3000/maquinas")
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode([Machine].self, from: data!)
                print(decodedData)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func requestCapsule(success: () -> Void) {
        let url = URL(string: "http://localhost:3000/capsulas")
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode([Capsule].self, from: data!)
                print(decodedData)
            } catch {
                print(error)
            }
        }.resume()
    }
    
}
