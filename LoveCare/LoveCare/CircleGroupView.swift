//
//  CircleGroupView.swift
//  LoveCare
//
//  Created by Mohammad Dawoud on 2024-04-04.
//

import SwiftUI

struct CircleGroupView: View {
    @State var isAnimating : Bool = false
    var circleGroupColor : Color = .red
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(circleGroupColor.opacity(0.2), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(circleGroupColor.opacity(0.2), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //: ZStack
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating.toggle()
        })
    }
}

#Preview {
    CircleGroupView()
}
