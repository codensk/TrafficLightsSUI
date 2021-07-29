//
//  SignalCircle.swift
//  TrafficLightsSUI
//
//  Created by SERGEY VOROBEV on 29.07.2021.
//

import SwiftUI

struct SignalCircle: View {
    var color: Color = .red
    var opacity: Double = 1
    
    var body: some View {
        Circle()
            .stroke(color.opacity(0.4), lineWidth: 1)
            .background(
                Circle().fill(RadialGradient(gradient: Gradient(colors: [.white, color]), center: .center, startRadius: 0, endRadius: 100))
                    .opacity(opacity))
            .frame(width: 130, height: 130)
            .shadow(color: color, radius: 36)
    }
}

struct SignalCircle_Previews: PreviewProvider {
    static var previews: some View {
        SignalCircle().previewLayout(.sizeThatFits)
    }
}
