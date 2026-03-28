//
//  ContentView.swift
//  REF
//
//  Created by Tehnichka on 09.02.2026.
//

import SwiftUI

struct ContentViewREF: View {
    @State var showLoading = true
    
    var body: some View {
        ZStack {
            
            if showLoading {
                LoadingViewREF(showView: $showLoading)
            } else {
                // Main content
            }
        }
    }
}

#Preview {
    ContentViewREF()

}

