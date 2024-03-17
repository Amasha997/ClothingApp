//
//  ContentView.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-17.
//

import SwiftUI

struct ContentView: View {
    
    @State var endAnimation: Bool = false
    
    var body: some View {
        ZStack {
            
            NavigationView()
            
            SplashScreenView(endAnimation: $endAnimation)
        }
    }
}

#Preview {
    ContentView()
}
