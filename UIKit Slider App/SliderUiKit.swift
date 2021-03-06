//
//  SliderUiKit.swift
//  UIKit Slider App
//
//  Created by Борис Крисько on 01.08.2020.
//  Copyright © 2020 Borys Krisko. All rights reserved.
//

import SwiftUI

struct SliderUiKit: UIViewRepresentable {
    
    @Binding var value: Double
    @Binding var randomValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(value)
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChanged(_:)) ,
                         for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.alpha = CGFloat(computeScore()) / 100
    }
    
    func makeCoordinator() -> SliderUiKit.Coordinator {
        Coordinator(value: $value)
    }
    
    private func computeScore() -> Int {
        let difference = abs(randomValue - lround(value))
        return 100 - difference
    }
    
    typealias UIViewType = UISlider
    
}

extension SliderUiKit {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderUiKit_Previews: PreviewProvider {
    static var previews: some View {
        SliderUiKit(value: .constant(0), randomValue: .constant(50))
    }
}
