//
//  transaction.swift
//  A4
//
//  Created by Library User on 11/29/23.
//

import Foundation

struct Transaction: Codable {
    let id: Int
    let user_id: Int
    let machine_id: Int
    let item_id: Int
    let time: String
}

