//
//  TransactionView.swift
//  FinalProject
//
//  Created by Jasen Castillo on 5/3/23.
//

import SwiftUI

struct TransactionView: View {
    @StateObject var transactions = Transactions()
    @State private var showingAdd = false

    var body: some View {
        NavigationView {
            List {
                ForEach(transactions.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()

                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Recent Transactions")
            .toolbar {
                Button {
                    showingAdd = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAdd) {
                AddView(transactions: transactions)
            }
        }
    }

    func removeItems(at offsets: IndexSet) {
        transactions.items.remove(atOffsets: offsets)
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
