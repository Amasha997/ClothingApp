//
//  HomeScreenView.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-17.
//

import SwiftUI

struct NavigationView: View {
    
    @State var currentTab: Tab = .Home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    
    var body: some View {
        TabView(selection: $currentTab) {
            Text("Home View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Home)
            
            Text("Search View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Search)
            
            Text("Notification View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Notifications)
            
            Text("Cart View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Cart)
            
            Text("Profile View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background()
                .tag(Tab.Profile)
        }
        .overlay(
            HStack(spacing:0){
                ForEach(Tab.allCases, id: \.rawValue){
                    tab in TabButton(tab: tab)
                }
                .padding(.vertical)
                .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
                .background(Color("Color 3"))
            }
            ,
            alignment: .bottom
        )
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    func TabButton(tab: Tab) -> some View {
        GeometryReader{
            proxy in
            Button(action: {
                withAnimation(.spring()){
                    currentTab = tab
                }
            },label: {
                VStack(spacing: 0){
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill": tab.rawValue)
                        .resizable()
                        .foregroundColor(Color("Color 1"))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(
                            ZStack{
                                if currentTab == tab {
                                    MaterialEffect(style: .light)
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                    
                                    Text(tab.TabName)
                                        .foregroundColor(Color("Color 1"))
                                        .font(.footnote)
                                        .padding(.top, 50)
                                }
                            }
                        )
                        .contentShape(Rectangle())
                        .offset(y: currentTab == tab ? -15 : 0)
                }
            })
        }
        .frame(height: 25)
    }
}

#Preview {
    NavigationView()
}

enum Tab: String, CaseIterable{
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Notifications = "bell"
    case Cart = "bag"
    case Profile = "person"
    
    var TabName: String{
        switch self{
        case .Home:
            return "Home"
        case .Search:
            return "Search"
        case .Notifications:
            return "Notifications"
        case .Cart:
            return "Cart"
        case .Profile:
            return "Profile"
        }
    }
}

struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style:style))
        
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}
