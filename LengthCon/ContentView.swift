//
//  ContentView.swift
//  LengthCon
//
//  Created by Harpuneet Singh on 2021-07-23.
//

import SwiftUI

struct ContentView: View {
    @State private var lengthIn1 = 0
    @State private var lengthIn2 = 0
    @State private var lengthUnit = 0
    @State private var width: CGFloat?
    
    let lengthUnits = ["meters", "inches", "feet"]
    
    var meterCalc: Double {
        let lengthInput = Double(lengthIn1) + Double(lengthIn2)/100
        
        if lengthUnit == 0 {
            return lengthInput
        } else if lengthUnit == 1 {
            return lengthInput / 39.37
        } else {
            return lengthInput / 3.281
        }
    }
    
    var inchCalc: Double {
        let lengthInput = Double(lengthIn1) + Double(lengthIn2)/100
        
        if lengthUnit == 0 {
            return lengthInput * 39.37
        } else if lengthUnit == 1 {
            return lengthInput
        } else {
            return lengthInput * 12
        }
    }
    
    var feetCalc: Double {
        let lengthInput = Double(lengthIn1) + Double(lengthIn2)/100
        
        if lengthUnit == 0 {
            return lengthInput * 3.281
        } else if lengthUnit == 1 {
            return lengthInput / 12
        } else {
            return lengthInput
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack() {
                        Picker("Length:", selection: $lengthIn1) {
                                ForEach(0..<101) {
                                    Text("\($0)")
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(minWidth: 0)
                        .clipped()
                        .compositingGroup()

                        Picker("Length:", selection: $lengthIn2) {
                                ForEach(0..<100) {
                                    Text("\($0)")
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(minWidth: 0)
                        .clipped()
                        .compositingGroup()
                    }
                    
                    Picker("Input Unit", selection: $lengthUnit) {
                        ForEach(0..<lengthUnits.count) {
                            Text("\(self.lengthUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Result")) {
                    HStack {
                        Text("Meters")
                            .frame(width: width, alignment: .leading)
                        Text("\(meterCalc, specifier: "%.2f")")
                            .font(.largeTitle)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    }
                    HStack {
                        Text("Inches")
                            .frame(width: width, alignment: .leading)
                        Text("\(inchCalc, specifier: "%.2f")")
                            .font(.largeTitle)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    }
                    HStack {
                        Text("Feet")
                            .frame(width: width, alignment: .leading)
                        Text("\(feetCalc, specifier: "%.2f")")
                            .font(.largeTitle)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
            .navigationBarTitle("Length Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
