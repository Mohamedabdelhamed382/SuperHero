//
//  ContentView.swift
//  SuperHero
//
//  Created by MOHAMED ABD ELHAMED AHMED on 07/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    var superheros: [Superhero] = superherosData
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(superheros) { item in
                   SuperheroView(superH: item)
                }
            }//:HStack
            .padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
