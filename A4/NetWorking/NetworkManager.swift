//
//  NetworkManager.swift
//  A4
//
//  Created by 张天逸 on 2023/11/11.
//

import Foundation
import Alamofire

private let apiURL = "http://35.245.126.74/api/machines/"
private let createpostlink = "http://35.245.126.74/api/trxns/"
private let userLink = "http://35.245.126.74/api/users/1/"
private let tranLink = "http://35.245.126.74/api/trxns/1/"
private let itemLink = "http://35.245.126.74/api/items/"
private let machineLink = "http://35.245.126.74/api/machines/"
private let addMoneyLink = "http://35.245.126.74/api/users/1/"


private let decoder = JSONDecoder()

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {
        //        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    
    func fetchMachines(completion: @escaping ([machine]?) -> Void) {
        
        AF.request(apiURL, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: MachineResponse.self, decoder: decoder) { response in
                switch response.result {
                case .success (let r):
                    completion(r.machines)
                case .failure(let error):
                    print("Error fetching machines: \(error)")
                    completion(nil)
                }
            }
    }
    
    func fetchUser(completion: @escaping (Use?) -> Void) {
        
        AF.request(userLink, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Use.self, decoder: decoder) { response in
                switch response.result {
                case .success (let r):
                    completion(r)
                case .failure(let error):
                    print("Error fetching machines: \(error)")
                    completion(nil)
                }
            }
    }
    
    //    func fetchTrans(completion: @escaping ([Transaction]?) -> Void) {
    //
    //        AF.request(tranLink, method: .get)
    //            .validate(statusCode: 200..<300)
    //            .responseDecodable(of: TranResponse.self, decoder: decoder) { response in
    //                switch response.result {
    //                case .success (let r):
    //                    completion(r.transsss)
    //                case .failure(let error):
    //                    print("Error fetching machines: \(error)")
    //                    completion(nil)
    //                }
    //            }
    //    }
    
    //    func fetchItes(with: String, completion: @escaping(item?) -> Void){
    //
    //    }
    
    func fetchItem(with: String, completion: @escaping (item?) -> Void) {
        
        var link = itemLink+"\(with)/"
        //    print(with)
        
        AF.request(link, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: item.self, decoder: decoder) { response in
                switch response.result {
                case .success (let r):
                    completion(r)
                case .failure(let error):
                    print("Error fetching machines: \(error)")
                    completion(nil)
                }
            }
    }
    
    func fetchMachine(machineN: String, completion: @escaping (machine?) -> Void) {
        
        var linkM = machineLink+"\(machineN)/"
        //        print(with)
        
        AF.request(linkM, method: .get)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: machine.self, decoder: decoder) { response in
                //  print(String(data: response.data ?? Data(), encoding: .utf8) ?? "")
                
                switch response.result {
                case .success (let r):
                    completion(r)
                case .failure(let error):
                    print("Error fetching machines: \(error)")
                    completion(nil)
                }
            }
    }
    
    func createPost33(post: CreatePost, completion: @escaping (Bool) -> Void) {
        
        let parameters: Parameters = [
            "user_id" : post.user_id,
            "machine_id" : post.machine_id,
            "item_id" : post.item_id
        ]
        //        print("\(parameters.user_id)+\(parameters.machine_id)")
        print("\(parameters)")
        AF.request(createpostlink, method: .post, parameters: parameters, encoding: JSONEncoding.default)
        //            .validate(statusCode: 200..<600)
            .validate()
            .responseDecodable(of: Transaction.self, decoder: decoder) { response in
                switch response.result {
                case .success(let transaction):
                    //                    if let data = response.data {
                    //                                        print("Response Data: \(String(data: data, encoding: .utf8) ?? "")")
                    //                                    } else {
                    //                                        print("Response Data is nil")
                    //                                    }
                    completion(true)
                    // completion(true)
                case .failure(let error):
                    print("Insufficient funds.")
                    completion(false)
                    //                    completion(false) // Failed to create the post
                }
            }
    }
    
    func addMM(money1: Addmoney, completion: @escaping (Bool) -> Void) {
        
        let parameters: Parameters = [
            "amount": money1.amount
        ]
        print(money1.amount)
        AF.request(addMoneyLink, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Use.self, decoder: decoder) { response in
                switch response.result {
                case .success(let transaction):
                    completion(true)
                case .failure(let error):
                    print(error)
                    completion(false)
                }
                
            }
        
        //            .responseDecodable(of: CreatePost.self, decoder: decoder) { response in
        //                // 5. Handle the response
        //                switch response.result {
        //                case .success(let r):
        //                    print("Successfully added item \(r.item_id)")
        //                    completion(r)
        //                case .failure(let error):
        //                    print(error)
        //                }
        //            }
    }
    
    //    func addRoster(it: item, completion: @escaping (item) -> Void){
    //        let parameters : Parameters = [
    //            "user_id" : 1,
    //            "machine_id" : it.machine_id,
    //            "item_id" : it.id
    //        ]
    //
    //        AF.request(createpostlink, method: .post, parameters: parameters)
    //            .validate()
    //            .responseDecodable(of: item.self, decoder: decoder ){ response in
    //                switch response.result {
    //                case .success(let it):
    //                    print("Successfully added \(it.id) to roster")
    //                    completion(it)
    //                case .failure(let error):
    //                    print("Error: \(error.localizedDescription)")
    //
    //                }
    //            }
    //
    //    }
    //
    
}

