//
//  HomeView.swift
//  FinalProject
//
//  Created by Jasen Castillo on 5/3/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("charts")
            .navigationTitle("Welcome")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
