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
    @State var alphaValue = CGFloat(0)
    var randomValue = Int.random(in: 0...100)
    var body: some View {
        // Text("Hello, World!")
        
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(randomValue)")
            HStack {
                Text("0")
                SliderUiKit(alphaValue: $alphaValue, value: $value)
                    
                    .frame(width: 300)
                Text("100")
            }
            Button(action: {}) {
                Text("Проверь меня!")
            }.padding()
           
            Button(action: {}) {
                Text("Начать заново!")
            }
        }
        
    }
    
    private func computeScore() -> Int {
        let difference = abs(randomValue - lround(value))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
