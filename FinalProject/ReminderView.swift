//
//  ReminderView.swift
//  FinalProject
//
//  Created by Jasen Castillo on 5/3/23.
//

import SwiftUI

struct ReminderView: View {
    @StateObject var reminders = Reminders()
    @State private var showingAdd = false

    var body: some View {
        NavigationView {
            List {
                ForEach(reminders.ritems) { ritem in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(ritem.name)
                                .font(.headline)
                            Text(ritem.type)
                        }

                        Spacer()
                        VStack {
                            Text(ritem.amount, format: .currency(code: "USD"))
                            Text(ritem.date, format: .dateTime.day().month().year())
                        }
                    }

                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Reminders")
            .toolbar {
                Button {
                    showingAdd = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAdd) {
                DateAddView(reminders: reminders)
            }
        }
    }

    func removeItems(at offsets: IndexSet) {
        reminders.ritems.remove(atOffsets: offsets)
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}
