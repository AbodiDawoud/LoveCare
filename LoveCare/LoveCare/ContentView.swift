//
//  ContentView.swift
//  LoveCare
//
//  Created by Mohammad Dawoud on 2024-04-04.
//

import SwiftUI

struct ContentView: View {
    // Properties
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    
    
    // Body
    var body: some View {
        if (isOnboarding){
            Onboarding()
        } else {
            Home()
        }
    }
}


// Preview
#Preview {
    ContentView()
}
