//
//  HeaderView.swift
//  Little Lemon
//
//  Created by Ayo Shafau on 5/2/24.
//

import SwiftUI

struct HeaderView: View {
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
                    VStack {
                        ZStack {
                            Text("Little lemon logo")
                            HStack {
                                Spacer()
                                if isLoggedIn {
                                    NavigationLink(destination: UserProfileView()) {
                                        Text("profile-image-placeholder")
                                            .frame(maxHeight: 50)
                                            .clipShape(Circle())
                                            .padding(.trailing)
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(maxHeight: 60)
                .padding(.bottom)
                .onAppear() {
                    if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                        isLoggedIn = true
                    } else {
                        isLoggedIn = false
                    }
                }
        
    }
}

#Preview {
    HeaderView()
}
