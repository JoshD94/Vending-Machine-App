//
//  user.swift
//  A4
//
//  Created by Library User on 11/29/23.
//

import Foundation

struct Use: Codable {
    let id: Int
    let name: String
    let balance: Float
    let transactions: [Transaction]
    
}
