//
//  Onboarding.swift
//  LoveCare
//
//  Created by Mohammad Dawoud on 2024-04-04.
//

import SwiftUI

struct Onboarding: View {
    // Properties
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    @State var isAnimating : Bool = false
    @State var imageOffset : CGSize = CGSize(width: 0.0, height: 0.0)
    @State var buttonOffset : CGFloat = 0.0
    @State var buttonWidth : Double = UIScreen.main.bounds.width - 80
    let feedback = UINotificationFeedbackGenerator()
    
    // Body
    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all)
            
            VStack{
                
                //MARK: - Header
                VStack{
                    Text(abs(imageOffset.width) > 0 ? "Care" : "Love")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                    Text("Live doesn't come with manua, it comes with a mother")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .multilineTextAlignment(.center)
                } //: VStack
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                Spacer()
                
                
                
                //MARK: - Center
                ZStack{
                    CircleGroupView(circleGroupColor: .white)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width) / 5, opaque: false)
                    Image("happy-pregnant")
                         .resizable()
                         .scaledToFit()
                         .offset(x: imageOffset.width, y: 0)
                         .rotationEffect(.degrees(imageOffset.width / 15))
                         .scaleEffect(isAnimating ? 1 : 0.8)
                         .animation(.easeOut(duration: 0.5), value: isAnimating)
                         .shadow(
                            color: Color(red: 0, green: 0, blue: 0, opacity: 0.5),
                            radius: 8,
                            x: 3,
                            y: 30
                         )
                         .overlay(
                            Image(systemName: "arrow.left.and.right.circle")
                                .font(.system(size: 40, weight: .ultraLight, design: .rounded))
                                .foregroundStyle(.white)
                                .opacity(abs(imageOffset.width) > 0 ? 0 : 1)
                            , alignment: .bottom
                         )
                         .frame(width: 300, alignment: .center)
                         .gesture(DragGesture()
                            .onChanged({ gesture in
                                if abs(gesture.translation.width) <= 150 {
                                    imageOffset = gesture.translation
                                }
                            })
                            .onEnded({ _ in
                                withAnimation(.easeOut(duration: 0.5)) {
                                    imageOffset = .zero
                                }
                            })
                         )
                } //: ZStack
                Spacer()
                
                
                
                //MARK: - Footer
                ZStack {
                    // 1. Background
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. Text
                    Text("Start")
                        .font(.system(size: 30, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    // 3. Capsule Dynamice
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80 + buttonOffset)
                        Spacer()
                    }
                    
                    // 4. Dragable Circle
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.2))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                        } //: ZStack (End of dragable circle)
                        .frame(width: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(DragGesture()
                            .onChanged({ gesture in
                                if gesture.translation.width > 0.0 && buttonOffset <= buttonWidth - 80 {
                                    buttonOffset = gesture.translation.width
                                }
                            })
                            .onEnded({ _ in
                                if (buttonOffset >= buttonWidth / 2){
                                    isOnboarding = false
                                    playSound(soundFile: "chimeup", soundType: "mp3")
                                    feedback.notificationOccurred(.success)
                                } else {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        buttonOffset = 0.0
                                        feedback.notificationOccurred(.error)
                                    }
                                }
                            })
                        )
                        Spacer()
                    }
                    
                
                } //: ZStack (End of footer)
                .frame(height: 80, alignment: .center)
                .padding(.horizontal, 40)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            } //: VStack
        } //: ZStack
        .onAppear(perform: {
            isAnimating.toggle()
        })
    }
}

#Preview {
    Onboarding()
}
