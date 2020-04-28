//
//  ContentView.swift
//  SwiftUI_Navigation_Tutorial
//
//  Created by алтынпончик on 4/22/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    private func setReaction(_ reaction: String, for item: Artwork) {
        if let index = self.artworks.firstIndex(
            where: { $0.id == item.id }) {
            artworks[index].reaction = reaction
        }
    }
    
    
    @State private var hideVisited = false
    var showArt: [Artwork] {
        hideVisited ? artworks.filter { $0.reaction == "" } : artworks
    }
    
    @State var artworks = artData
    
    var body: some View {
        NavigationView {
            List(showArt) { artwork in
                NavigationLink(
                destination: DetailView(artwork: artwork)) {
                    Text("\(artwork.reaction)  \(artwork.title)")
                        .onAppear() { artwork.load() }
                        .contextMenu {
                            Button("Love it: 💕") {
                                self.setReaction("💕", for: artwork)
                            }
                            Button("Thoughtful: 🙏") {
                                self.setReaction("🙏", for: artwork)
                            }
                            Button("Wow!: 🌟") {
                                self.setReaction("🌟", for: artwork)
                            }
                    }
                }
            }
            .navigationBarTitle("Artworks")
            .navigationBarItems(trailing:
                Toggle(isOn: $hideVisited, label: { Text("Hide Visited") }))
            
            DetailView(artwork: artworks[0])
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
