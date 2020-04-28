//
//  DetailView.swift
//  SwiftUI_Navigation_Tutorial
//
//  Created by алтынпончик on 4/22/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @State private var showMap = false
    
    let artwork: Artwork
    
    var body: some View {
        VStack {
            Image(artwork.imageName)
                .resizable()
                .frame(maxWidth: 300, maxHeight: 600)
                .aspectRatio(contentMode: .fit)
            Text("\(artwork.reaction)  \(artwork.title)")
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(3)
            HStack {
                Button(action: { self.showMap = true }) {
                    Image(systemName: "mappin.and.ellipse")
                }
                .sheet(isPresented: $showMap) {
                  LocationMap(showModal: self.$showMap, artwork: self.artwork)
                }
                Text(artwork.locationName)
                    .font(.subheadline)
            }
            Text("Artist: \(artwork.artist)")
                .font(.subheadline)
            Divider()
            Text(artwork.description)
                .multilineTextAlignment(.leading)
                .lineLimit(20)
        }
        .padding()
        .navigationBarTitle(Text(artwork.title), displayMode: .inline)
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(artwork: artData[5])
    }
}
