//
//  HttpClientApi.swift
//  MRestClient
//
//  Created by Afsar Ahamad on 18/02/20.
//


import Foundation

//HTTP Methods
enum HttpMethod : String {
    case  GET
    case  POST
    case  DELETE
    case  PUT
}


class HttpClientApi: NSObject{
    
    var request : URLRequest?
    var session : URLSession?
    
    static func instance() ->  HttpClientApi{
        return HttpClientApi()
    }
    
    func makeAPICall(url: String, requestBody: Data?, method: HttpMethod, success:@escaping ( Data? ,HTTPURLResponse?  , NSError? ) -> Void, failure: @escaping ( Data? ,HTTPURLResponse?  , NSError? )-> Void) {
        let curl =  url
                      request = URLRequest(url: URL(string: curl)!)
                      if let params = requestBody {
                          
                       let  jsonData = params
                          request?.setValue("application/json", forHTTPHeaderField: "Content-Type")
                          request?.httpBody = jsonData//?.base64EncodedData()
                      }
                      request?.httpMethod = method.rawValue
                      let configuration = URLSessionConfiguration.default
                      configuration.timeoutIntervalForRequest = 30
                      configuration.timeoutIntervalForResource = 30
                      session = URLSession(configuration: configuration)
                      session?.dataTask(with: request! as URLRequest) { (data, response, error) -> Void in
                          
                          if let data = data {
                              
                              if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                               success(data , response , error as NSError?)
                              } else {
                               failure(data , response as? HTTPURLResponse, error as NSError?)
                              }
                          }else {
                              
                           failure(data , response as? HTTPURLResponse, error as NSError?)
                              
                          }
                }.resume()
    }
}

