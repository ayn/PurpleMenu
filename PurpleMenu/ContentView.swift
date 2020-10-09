//
//  ContentView.swift
//  PurpleMenu
//
//  Created by Andrew Ng on 10/6/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var sensor = SensorViewModel()

    var body: some View {
        GeometryReader { g in
            VStack {
                Spacer()
                HStack {
                    Text("Sensor ID")
                        .frame(alignment: .trailing)
                    TextField("Sensor ID", text: $sensor.sensorId, onCommit:  {
                        sensor.update()
                    })
                    .frame(width: 80)
                }
                .frame(width: g.size.width / 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Picker("Conversion", selection: $sensor.conversion) {
                    ForEach(Conversion.allCases) { conversion in
                        Text(conversion.rawValue)
                    }
                }
                .frame(width: 180)
                .pickerStyle(PopUpButtonPickerStyle())
                HStack {
                    Button("Update") {
                        sensor.update()
                    }
                    Button("Quit") {
                        exit(0)
                    }
                }
                Spacer()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
