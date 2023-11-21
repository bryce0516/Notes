//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Hye Sung Park on 11/21/23.
//

import SwiftUI

struct DetailView: View {
  let note: Note
  let count: Int
  let index: Int
  
  var body: some View {
    VStack(alignment: .center, spacing: 3) {
      
      HStack {
        Capsule()
          .frame(height: 1)
        
        Image(systemName: "note.text")
        
        Capsule()
          .frame(height: 1)
      }
      .foregroundStyle(.accent)
      Spacer()
      
      ScrollView(.vertical) {
        Text(note.text)
          .font(.title3)
          .fontWeight(.semibold)
          .multilineTextAlignment(.center)
      }
      
      Spacer()
      
      HStack(alignment:.center) {
        Image(systemName: "gear")
          .imageScale(.large)
        
        Spacer()
        
        Text("\(count) / \(index + 1)")
        
        Spacer()
        
        Image(systemName: "info.circle")
          .imageScale(.large)
        
        
      }
      .foregroundStyle(.secondary)
    }
    .padding(3)
  }
}

#Preview {
  DetailView(note: Note(id: UUID(), text: "hello world"), count: 5, index: 1)
}
