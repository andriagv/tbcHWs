//
//  TabBarView.swift
//  Gestures
//
//  Created by Apple on 18.12.24.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: Tab = .spin
    
    var body: some View {
        TabView(selection: $selectedTab) {
            SpinView()
                .tabItem {
                    Image(selectedTab == .spin ? "Spin.fill" : "Spin")
                }
                .tag(Tab.spin)
            
            HoldView()
                .tabItem {
                    Image(selectedTab == .hold ? "Hold.fill" : "Hold")
                }
                .tag(Tab.hold)
            
            RotateView()
                .tabItem {
                    Image(selectedTab == .rotate ? "Rotate.fill" : "Rotate")
                }
                .tag(Tab.rotate)
            
            TrashView()
                .tabItem {
                    Image(selectedTab == .trash ? "Trash.fill" : "Trash")
                }
                .tag(Tab.trash)
        }
        .background(.white)
    }
    
    enum Tab {
        case hold, rotate, spin, trash
    }
}

#Preview {
    TabBarView()
}
