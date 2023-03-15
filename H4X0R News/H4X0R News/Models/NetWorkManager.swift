//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by dxd on 2023/3/15.
//

import Foundation

class NetworkManager: ObservableObject {
//    初始化一个新的post数组对象
    @Published var posts = [Post]()
//   网络管理器
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
//            URLSession创建一个会话对象设置默认
            let session = URLSession(configuration: .default)
//            设置一个session的任务
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Resluts.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                       
                    }
                }
            }
            task.resume()
            
        }
    }
 }

