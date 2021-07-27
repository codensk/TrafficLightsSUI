//
//  Signal.swift
//  TrafficLightsSUI
//
//  Created by SERGEY VOROBEV on 27.07.2021.
//

import SwiftUI

struct Signal: View {
    var color: TrafficLightsColor = .red
    var state: TrafficLightsState = .off
    var lineWidth: CGFloat = 1
    
    private let circleSize: CGFloat = 130
    
    var body: some View {
        switch color {
        case .red:
            signalCircle(color: .red, opacity: state.rawValue, circleSize: circleSize)
        case .yellow:
            signalCircle(color: .yellow, opacity: state.rawValue, circleSize: circleSize)
        case .green:
            signalCircle(color: .green, opacity: state.rawValue, circleSize: circleSize)
        }
    }
    
    private func signalCircle(color: Color, opacity: Double, circleSize: CGFloat) -> some View {
        
        Circle()
            .stroke(color.opacity(0.4), lineWidth: lineWidth)
            .background(
                Circle().fill(RadialGradient(gradient: Gradient(colors: [.white, color]), center: .center, startRadius: 0, endRadius: 100))
                    .opacity(opacity))
            .frame(width: circleSize, height: circleSize)
            .shadow(color: color, radius: 36)
    }
}

struct Signal_Previews: PreviewProvider {
    static var previews: some View {
        Signal().previewLayout(.sizeThatFits)
    }
}
