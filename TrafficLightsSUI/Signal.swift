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
   
    private let lineWidth: CGFloat = 1
    private let circleSize: CGFloat = 130
    
    var body: some View {
        switch color {
        case .red:
            SignalCircle(color: .red, opacity: state.rawValue)
        case .yellow:
            SignalCircle(color: .yellow, opacity: state.rawValue)
        case .green:
            SignalCircle(color: .green, opacity: state.rawValue)
        }
    }
   
}

struct Signal_Previews: PreviewProvider {
    static var previews: some View {
        Signal().previewLayout(.sizeThatFits)
    }
}
