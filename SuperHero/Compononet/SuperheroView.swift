//
//  SuperheroView.swift
//  SuperHero
//
//  Created by MOHAMED ABD ELHAMED AHMED on 07/05/2022.
//

import SwiftUI

struct SuperheroView: View {
    
    var superH: Superhero
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    @State var isScaling: Bool = false
    @State var isSliding: Bool = false
    @State var isAlertPresented: Bool = false
    
    
    
    var body: some View {
        ZStack {
            Image(superH.image)
                .resizable()
                .scaledToFill()
                .scaleEffect(isScaling ? 1 : 0.8)
                .animation(.easeOut(duration: 5), value: isScaling)
            VStack {
                Text(superH.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Button {
                    isAlertPresented.toggle()
                    hapticImpact.impactOccurred()
                    playSound(sound: "chimeup", type: "mp3")
                } label: {
                    HStack {
                        Text("Start")
                        Image(systemName: "arrow.right.circle")
                    } //:HStack
                    .padding()
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: superH.gradientColors), startPoint: .bottomTrailing, endPoint: .topLeading))
                    .clipShape(Capsule())
                    .shadow(radius: 10)
                    .alert(isPresented: $isAlertPresented) {
                        Alert(title: Text(superH.title), message:Text(superH.message), dismissButton: .default(Text("Ok")))
                    }
                }//: Button Label
            } //:VStack
            .offset(x: 0, y: isSliding ? 150 : 300)
            .animation(.easeOut(duration: 5), value: isSliding)
        } //: ZStack
        .frame(width: 335, height: 545, alignment: Alignment.center)
        .background(LinearGradient(gradient: Gradient(colors: superH.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(16)
        .shadow(color: .black, radius: 2, x: 2, y: 2)
        .onAppear {
            isScaling = true
            isSliding = true
        }
    }
}

struct SuperheroView_Previews: PreviewProvider {
    static var previews: some View {
        SuperheroView(superH: superherosData[2])
    }
}
