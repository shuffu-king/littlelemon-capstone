//
//  OnboardView.swift
//  Little Lemon
//
//  Created by Ayo Shafau on 4/15/24.
//
import SwiftUI

let firstNameKey = "FNK"
let lastNameKey = "LNK"
let emailKey = "EK"
let kIsLoggedIn = "kIsLoggedIn"

struct OnboardView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var isLoggedin = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView()
                HeroView()
                    .padding()
                    .background(Color.primaryColor1)
                    .frame(maxWidth: .infinity, maxHeight: 240)
                NavigationLink(destination: HomeView(), isActive: $isLoggedin) { }
                VStack {
                    TextField("first name", text: $firstName)
                    TextField("last name", text: $lastName)
                    TextField("email", text: $email)
                }
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .padding()
                
                Button("Register"){
                    if firstName.isEmpty || lastName.isEmpty {
                        isLoggedin = false
                    }
                    else {
                        UserDefaults.standard.set(firstName, forKey: firstNameKey)
                        UserDefaults.standard.set(lastName, forKey: lastNameKey)
                        UserDefaults.standard.set(email, forKey: emailKey)
                        isLoggedin = true
                        UserDefaults.standard.setValue(isLoggedin, forKey: kIsLoggedIn)
                    }
                }
            }
            .onAppear(){
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) == true {
                    isLoggedin = true
                }
                
            }
        }
    }
}

#Preview {
    OnboardView()
}
