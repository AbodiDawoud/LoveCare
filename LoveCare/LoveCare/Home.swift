//
//  Home.swift
//  LoveCare
//
//  Created by Mohammad Dawoud on 2024-04-04.
//

import SwiftUI

struct Home: View {
    // Properties
    @AppStorage("isOnboarding") var isOnboarding : Bool = false
    @State var isAnimating : Bool = false
    let feedback = UINotificationFeedbackGenerator()
    
    // Body
    var body: some View {
        VStack (alignment: .center, spacing: 30) {
            
            // MARK: - Header
            ZStack {
                CircleGroupView(circleGroupColor: .gray)
                Image("baby-boy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, alignment: .center)
                    .offset(y: isAnimating ? 30 : -30)
                    .animation(.easeOut(duration: 2.5).repeatForever(autoreverses: true), value: isAnimating)
            } //: ZStack
            
            
            //MARK: - Center
            Text("Having children just puts the hole world into perspictive, Everything else just disappers")
                .padding()
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .font(.title3)

            
            //MARK: - Footer
            Button {
                isOnboarding.toggle()
                playSound(soundFile: "success", soundType: "m4a")
                feedback.notificationOccurred(.success)
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(size: 25, design: .rounded))
                    .fontWeight(.bold)
                    .padding(6)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            
        } //: VStack
 
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isAnimating.toggle()
            }
        })
    }
}

#Preview {
    Home()
}
