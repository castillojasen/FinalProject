//
//  Transactions.swift
//  FinalProject
//
//  Created by Jasen Castillo on 5/3/23.
//

import Foundation

class Transactions: ObservableObject {
    @Published var items = [TransactionItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }

    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([TransactionItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}
