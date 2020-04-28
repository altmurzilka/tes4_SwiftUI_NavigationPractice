//
//  LocationMap.swift
//  SwiftUI_Navigation_Tutorial
//
//  Created by алтынпончик on 4/28/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct LocationMap: View {
    @Binding var showModal: Bool
    var artwork: Artwork
    var body: some View {
      VStack {
        MapView(coordinate: artwork.coordinate)
        HStack {
          Text(self.artwork.locationName)
          Spacer()
          Button("Done") { self.showModal = false }
        }
        .padding()
      }
    }
}

struct LocationMap_Previews: PreviewProvider {
    static var previews: some View {
        LocationMap(showModal: .constant(true), artwork: artData[0])
    }
}
