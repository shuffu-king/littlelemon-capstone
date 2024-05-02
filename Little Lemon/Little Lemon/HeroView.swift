//
//  HeroView.swift
//  Little Lemon
//
//  Created by Ayo Shafau on 5/1/24.
//

import SwiftUI

struct HeroView: View {
    var body: some View {
        VStack {
                    HStack {
                        VStack {
                            Text("Little Lemon")
                                .foregroundColor(Color.primaryColor2)
                                .font(.displayFont())
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("Chicago")
                                .foregroundColor(.white)
                                .font(.subTitleFont())
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Spacer(minLength: 5)
                            Text("""
                             We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.
                             """)
                            .foregroundColor(.white)
                            .font(.leadText())
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
    }
}

#Preview {
    HeroView()
        .padding()
        .background(Color.primaryColor1)
        .frame(maxWidth: .infinity, maxHeight: 240)
}
