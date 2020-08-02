//
//  ContentView.swift
//  UIKit Slider App
//
//  Created by Борис Крисько on 01.08.2020.
//  Copyright © 2020 Borys Krisko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var value = 0.0
    @State var randomValue = Int.random(in: 0...100)
    @State var alertIsShowing = false
    var body: some View {
        
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(randomValue)")
            HStack {
                Text("0")
                SliderUiKit(value: $value,
                            randomValue: $randomValue)
                    
                    .frame(width: 300)
                Text("100")
            }
            Button(action: {self.alertIsShowing = true}) {
                Text("Проверь меня!")
            }.padding()
                .alert(isPresented: $alertIsShowing, content: {
                    Alert(title: Text("Your score is"),
                          message: Text("\(computeScore())"),
                        dismissButton: .default(Text("Ok")))
                })
            
            Button(action: {self.randomValue = Int.random(in: 0...100)}) {
                Text("Начать заново!")
            }
        }
        
    }
    public func computeScore() -> Int {
        let difference = abs(randomValue - lround(value))
        return 100 - difference
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
