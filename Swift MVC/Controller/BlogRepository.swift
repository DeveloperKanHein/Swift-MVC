//
//  BlogRepository.swift
//  Swift MVC
//
//  Created by Kan Hein on 15/02/2023.
//

import Foundation

protocol UpdateBlogUIDelegate {
    func update(_ repository: BlogRepository, blogs: [Blog])
}

struct BlogRepository {
    var delegate: UpdateBlogUIDelegate?
    func request() {
        if let url = URL(string: ApiRoutes.baseURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let safeData = data {
                    if let blogs = self.parseJSON(safeData) {
                        self.delegate?.update(self, blogs: blogs)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ blogs: Data) -> [Blog]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([Blog].self, from: blogs)
            return decodedData
        } catch {
            return nil
        }
    }
}

