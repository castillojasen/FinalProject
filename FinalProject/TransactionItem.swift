//
//  TransactionItem.swift
//  FinalProject
//
//  Created by Jasen Castillo on 5/3/23.
//

import Foundation

struct TransactionItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
