//
//  ContentView.swift
//  FinalProject
//
//  Created by Jasen Castillo on 5/3/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            TransactionView()
                .tabItem {
                    Image(systemName: "banknote")
                    Text("Transactions")
                }
            ReminderView()
                .tabItem {
                    Image(systemName: "tray")
                    Text("Reminders")
                }
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
