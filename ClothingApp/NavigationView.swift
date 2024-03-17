//
//  HomeScreenView.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-17.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NavigationView()
}

enum Tab: String, CaseIterable{
    case Home = "house"
    case Search = "magnifyingglass.circle"
}
