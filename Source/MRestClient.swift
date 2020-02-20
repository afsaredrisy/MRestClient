//
//  MRestClient.swift
//  MRestClient
//
//  Created by Afsar Ahamad on 18/02/20.
//

import Foundation

public class None: Codable{
    
}

public class MRestClient<T: Codable, S: Codable>{
    
    public var base_url: String
    
    public init(base_url: String) {
        self.base_url = base_url
    }
    //MARK: HTTP Post request with Request data in body
    public func post(url: String, requestData: T, sucess: @escaping (S,HTTPURLResponse?)->(), fail: @escaping (Error?) -> ()){
        do{
            let requestJson = try JSONEncoder().encode(requestData)
            HttpClientApi.instance().makeAPICall(url: (base_url+url), requestBody: requestJson, method: .POST, success: {(data, response, error) in
                do{
                    let responseData = try JSONDecoder().decode(S.self, from: data!)
                    sucess(responseData, response)
                }catch{
                    fail(error)
                }
            }, failure: {(data, response, error) in
                fail(error)
            })
        }catch{
            fail(error)
        }
    }
    
    //MARK: HTTP Post request with request body nil
    public func post(url: String, sucess: @escaping (S,HTTPURLResponse?)->(), fail: @escaping (Error?) -> ()){
               HttpClientApi.instance().makeAPICall(url: (base_url+url), requestBody: nil, method: .POST, success: {(data, response, error) in
                   do{
                       let responseData = try JSONDecoder().decode(S.self, from: data!)
                       sucess(responseData, response)
                   }catch{
                       fail(error)
                   }
               }, failure: {(data, response, error) in
                   fail(error)
               })
           
       }
    //MARK: HTTP GET request
    public func get(uri: String, sucess: @escaping (S,HTTPURLResponse?)->(), fail: @escaping (Error?) -> ()){
           HttpClientApi.instance().makeAPICall(url: (base_url+uri), requestBody:nil, method: .GET, success: {(data, response, error ) in
                     do{
                         let responseData = try JSONDecoder().decode(S.self, from: data!)
                         sucess(responseData, response)
                     }catch{
                         fail(error)
                     }
                      
                  }, failure: {(data, response, error) in
                      fail(error)
               })
         }
       
    // MARK: HTTP Delete request
    public func delete(url: String, requestData: T, sucess: @escaping (S,HTTPURLResponse?)->(), fail: @escaping (Error?) -> ()){
         do{
            let requestJson = try JSONEncoder().encode(requestData)
            HttpClientApi.instance().makeAPICall(url: (base_url+url), requestBody: requestJson, method: .DELETE, success: {(data, response, error) in
                       do{
                           let responseData = try JSONDecoder().decode(S.self, from: data!)
                           sucess(responseData, response)
                       }catch{
                           fail(error)
                       }
                   }, failure: {(data, response, error) in
                       fail(error)
                   })
               }catch{
                   fail(error)
               }
    }
    //MARK: HTTP PUT request
    public func put(url: String, requestData: T, sucess: @escaping (S,HTTPURLResponse?)->(), fail: @escaping (Error?) -> ()){
         do{
        let requestJson = try JSONEncoder().encode(requestData)
        HttpClientApi.instance().makeAPICall(url: (base_url+url), requestBody: requestJson, method: .PUT, success: {(data, response, error) in
                    do{
                        let responseData = try JSONDecoder().decode(S.self, from: data!)
                           sucess(responseData, response)
                       }catch{
                           fail(error)
                       }
                   }, failure: {(data, response, error) in
                       fail(error)
                   })
               }catch{
                   fail(error)
               }
    
    }
}
