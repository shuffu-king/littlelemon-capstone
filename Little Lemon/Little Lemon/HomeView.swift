//
//  HomeView.swift
//  Little Lemon
//
//  Created by Ayo Shafau on 4/16/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            TabView{
                MenuView()
                    .tabItem {
                        Text("Menu")
                        Image(systemName: "list.dash")
                    }
                UserProfileView()
                    .tabItem {
                        Text("Profile")
                        Image(systemName: "square.and.pencil")
                    }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    HomeView()
}
