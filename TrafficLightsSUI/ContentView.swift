//
//  ContentView.swift
//  TrafficLightsSUI
//
//  Created by SERGEY VOROBEV on 27.07.2021.
//

import SwiftUI

enum TrafficLightsColor {
    case red, yellow, green
}

enum TrafficLightsState: Double {
    case on = 1.0
    case off = 0.2
}

struct ContentView: View {
    @State private var currentLight: TrafficLightsColor?
    @State private var isStarted = false
    
    private let signals: [TrafficLightsColor] = [.red, .yellow, .green]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                ForEach(signals, id: \.self) { signalColor in
                    Signal(color: signalColor, state: currentLight == signalColor ? .on : .off)
                        .padding(.bottom, 10)
                }
                
                Spacer()
                
                VStack {
                    Button(action: {
                        isStarted = true
                        
                        switch currentLight {
                        case .red:
                            currentLight = .yellow
                        case .yellow:
                            currentLight = .green
                        case .green, .none:
                            currentLight = .red
                        }
                    }, label: {
                        Text(isStarted ? "Next" : "Start")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6))
                            .frame(width: 200)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 2))
                    }).padding(.bottom, 20)
                }
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
