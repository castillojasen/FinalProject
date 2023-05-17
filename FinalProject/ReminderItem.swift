//
//  ReminderItem.swift
//  FinalProject
//
//  Created by Jasen Castillo on 5/16/23.
//

import Foundation

struct ReminderItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let date: Date
}
