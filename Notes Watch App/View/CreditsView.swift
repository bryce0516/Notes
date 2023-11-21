//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by Hye Sung Park on 11/21/23.
//

import SwiftUI

struct CreditsView: View {
  
  @State private var randomNumber: Int = Int.random(in: 1..<4 )
  
  private var randomImage: String {
    return "developer-no\(randomNumber)"
  }
  
    var body: some View {
      VStack(spacing:3) {
        Image(randomImage)
          .resizable()
          .scaledToFit()
          .layoutPriority(1)
        
        HeaderView(title: "Credits")
        
        Text("Robert Petras")
          .foregroundStyle(.primary)
          .fontWeight(.bold)
        
        Text("Developer")
          .font(.footnote)
          .foregroundStyle(.secondary)
          .fontWeight(.light)
      }
    }
}

#Preview {
    CreditsView()
}
