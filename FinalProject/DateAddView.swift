//
//  DateAddView.swift
//  FinalProject
//
//  Created by Jasen Castillo on 5/3/23.
//

import SwiftUI

struct DateAddView: View {
    @ObservedObject var reminders: Reminders
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var date = Date.now

    let types = ["Business", "Personal", "Bills", "Food", "Gas", "Groceries", "Entertainment"]

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                DatePicker("pick a date", selection: $date)
                
            }
            .navigationTitle("Add new transaction")
            .toolbar {
                Button("Save") {
                    let ritem = ReminderItem(name: name, type: type, amount: amount, date: date)
                    reminders.ritems.append(ritem)
                    dismiss()
                }
            }
        }
    }
}

struct DateAddView_Previews: PreviewProvider {
    static var previews: some View {
        DateAddView(reminders: Reminders())
    }
}
