//
//  PostData.swift
//  H4X0R News
//
//  Created by dxd on 2023/3/15.
//

import Foundation

struct Resluts: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable{
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}

