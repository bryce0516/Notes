//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Hye Sung Park on 11/20/23.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  
  @State private var notes: [Note] = [Note]()
  @State private var text: String = ""
  
  // MARK: - FUNCTION
  
  func getDocumentDirectory() -> URL {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return path[0]
  }
  
  func save() {
    //    dump(notes)
    do {
      let data = try JSONEncoder().encode(notes)
      
      let url = getDocumentDirectory().appendingPathComponent("notes")
      
      try data.write(to: url)
    } catch {
      print("Saving data has failed!")
    }
  }
  
  func load() {
    DispatchQueue.main.async {
      do {
        let url = getDocumentDirectory().appendingPathComponent("notes")
        
        let data = try Data(contentsOf: url)
        
        notes = try JSONDecoder().decode([Note].self, from: data)
      } catch {
        print("Loading data has failed!")
      }
    }
  }
  
  // MARK: - BODY
    var body: some View {
        VStack {
          HStack(alignment: .center, spacing: 6) {
            TextField("Add New Note", text: $text)
            
            Button {
              // ACTION
              // 1. Only run the button's action when the text field is not empty
              guard text.isEmpty == false else { return }
              
              let note = Note(id: UUID(), text: text)
              
              notes.append(note)
              
              text = ""
              
              save()
            } label: {
              Image(systemName: "plus.circle")
                .font(.system(size: 42, weight: .semibold))
            }
            .fixedSize()
            .buttonStyle(PlainButtonStyle())
            .foregroundColor(.accentColor)
//
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//            .padding()
          }
          Spacer()
          
          Text("\(notes.count)")
        }
        .navigationTitle("Notes")
        .padding()
        .onAppear() {
          load()
        }
    }
}

#Preview {
    ContentView()
}
