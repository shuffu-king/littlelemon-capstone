//
//  UserProfileView.swift
//  Little Lemon
//
//  Created by Ayo Shafau on 4/16/24.
//

import SwiftUI

struct UserProfileView: View {
    let userFirstName = UserDefaults.standard.string(forKey: firstNameKey)
    let userLastName = UserDefaults.standard.string(forKey: lastNameKey)
    let userEmail = UserDefaults.standard.string(forKey: emailKey)
    @Environment(\.presentationMode) var presentation
        
    var body: some View {
        VStack {
            
            Text("Personal Information")
            Image("profile-image-placeholder")
                .resizable()
                .frame(width: 400, height: 400)
            Text(userFirstName ?? "No name provided")
            Text(userLastName ?? "No name provided")
            Text(userEmail ?? "No email provided")
            Button("Logout") {
                UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
        }
    }
}

#Preview {
    UserProfileView()
}
