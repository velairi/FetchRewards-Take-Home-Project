//
//  Client.swift
//  Fetch Rewards Take Home Project
//
//  Created by Valerie Don on 9/8/20.
//  Copyright © 2020 Valerie Don. All rights reserved.
//

import Foundation

class Client {

    class func fetchData(completion: @escaping ([Applicant]) -> Void) {
        guard let url = URL(string: "https://fetch-hiring.s3.amazonaws.com/hiring.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let object = try decoder.decode([Applicant].self, from: data)
                completion(object)
            } catch {
                print("Error", error)
            }
        }.resume()
    }
}
