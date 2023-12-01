//
//  item.swift
//  A4
//
//  Created by 张天逸 on 2023/11/28.
//

import Foundation

struct item: Codable {
    let id: Int
    let name: String
    let price: Float
    let quantity: Int
    let machine_id: Int
    let image_url: String
    
}
