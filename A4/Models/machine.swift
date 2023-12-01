//
//  machine.swift
//  A4
//
//  Created by 张天逸 on 2023/11/28.
//

import Foundation

struct machine: Codable {
    let id: Int
    let location: String
    let takes_brbs: Bool
    let takes_card: Bool
    let takes_cash: Bool
    let items: [item]
    let transactions: [Transaction]
    let image_url: String
    
    //let transactions: Float;
}
