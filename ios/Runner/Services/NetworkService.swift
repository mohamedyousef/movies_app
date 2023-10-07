//
//  NetworkService.swift
//  Runner
//
//  Created by mohamed yousef on 07/10/2023.
//

import Foundation

class NetworkService {
    struct RequestOptions {
        let url: String
        let headers: [String: String]
        let method: String
    }

 
    static func enqueue(_ requestOptions: RequestOptions,completion: @escaping (NetworkResponse) -> Void,onFailure: @escaping ()->Void) {
        let url = URL(string: requestOptions.url)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestOptions.method
        for (key, value) in requestOptions.headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }

        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                onFailure();
                return
            }

            if let data = data, let httpResponse = response as? HTTPURLResponse {
                let responseString = String(data: data, encoding: .utf8) ?? ""
                let networkResponse = NetworkResponse(data: responseString, statusCode: httpResponse.statusCode)
                completion(networkResponse)
            }
        }

        task.resume()
    }
}

struct NetworkResponse {
    let data: String
    let statusCode: Int
}
