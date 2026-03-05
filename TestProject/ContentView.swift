//
//  ContentView.swift
//  AVRRMIEM300404K44F
//
//  Created by Tehnichka on 09.02.2026.
//

import SwiftUI

struct ContentViewAVRRMIEM300404K44F: View {
    @State var showLoading = true
    
    var body: some View {
        ZStack {
            
            if showLoading {
                LoadingViewAVRRMIEM300404K44F(showView: $showLoading)
            } else {
                // Main content
            }
        }
    }
}

#Preview {
    ContentViewAVRRMIEM300404K44F()

}

