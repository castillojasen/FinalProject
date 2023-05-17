//
//  Reminders.swift
//  FinalProject
//
//  Created by Jasen Castillo on 5/16/23.
//

import Foundation

class Reminders: ObservableObject {
    @Published var ritems = [ReminderItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(ritems) {
                UserDefaults.standard.set(encoded, forKey: "Ritems")
            }
        }
    }

    init() {
        if let savedReminders = UserDefaults.standard.data(forKey: "Ritems") {
            if let decodedItems = try? JSONDecoder().decode([ReminderItem].self, from: savedReminders) {
                ritems = decodedItems
                return
            }
        }

        ritems = []
    }
}
