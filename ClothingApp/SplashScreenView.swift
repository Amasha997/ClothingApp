//
//  SplashScreen.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-17.
//

import SwiftUI

struct SplashScreenView: View {
    
    // Animation Properties
    @State var startAnimation: Bool = false
    
    @State var circleAnimation1: Bool = false
    @State var circleAnimation2: Bool = false
    
    // End
    @Binding var endAnimation: Bool
    

    var body: some View {
        
        
        ZStack {
            Color("Color 2")
            
            //Custom Shape with Animation
            Group{
                SplashShape()
                
                // trimming
                    .trim(from: 0, to: startAnimation ? 1 : 0)
                
                // stroke to get outline
                    .stroke(Color.white,style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                
                // two circles
                Circle()
                    .fill(.white)
                    .frame(width: 35, height: 35)
                    .scaleEffect(circleAnimation1 ? 1 : 0)
                    .offset(x: -80, y: 22)
                
                Circle()
                    .fill(.white)
                    .frame(width: 35, height: 35)
                    .scaleEffect(circleAnimation2 ? 1 : 0)
                    .offset(x: 80, y: -22)
            }
            //Default Frame
            .frame(width: 220, height: 130)
            .scaleEffect(endAnimation ? 0.15 : 0.9)
            .rotationEffect(.init(degrees: endAnimation ? 85 :0))
            

        }
        
        .offset(y: endAnimation ? -(getRect().height * 1.5) : 0)
        .ignoresSafeArea()
        .onAppear {
            
            // delay start
            withAnimation(.spring().delay(0.15)) {
                //first circle
                circleAnimation1.toggle()
            }
            
            // next shape
            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 1.05, blendDuration: 1.05).delay(0.3)) {
                startAnimation.toggle()
            }
            
            //second circle
            withAnimation(.spring().delay(0.7)) {
                //first circle
                circleAnimation2.toggle()
            }
            
            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 1.05, blendDuration: 1.05).delay(1.2)) {
                endAnimation.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}

//Extending View to get Screen Frame
extension View {
    func getRect ()-> CGRect{
        return UIScreen.main.bounds
    }
    
    // SafeArea
    func getSafeArea()->UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}

struct SplashShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {path in
            let mid = rect.width / 2
            let height = rect.height
            
            // Logo Design
            path.move(to: CGPoint(x: mid - 80, y:height))
            
            path.addArc(center: CGPoint(x: mid - 40, y: height), radius: 40, startAngle: .init(degrees: 180), endAngle: .zero, clockwise: true)
            
            path.move(to: CGPoint(x: mid, y: height))
            path.addLine(to: CGPoint(x: mid, y: 0))
            
            path.addArc(center: CGPoint(x: mid + 40, y: 0), radius: 40, startAngle: .init(degrees: -180), endAngle: .zero, clockwise: false)
        }
    }
}
