//
//  AirControllView.swift
//  TeslaApp
//
//  Created by Олег Коваленко on 05.02.2023.
//

import SwiftUI

struct AirControllView: View {
    @Environment(\.colorScheme) var colorScheme
    //MARK: Variables
    // Variable Guage Temperature
    @State private var tempSelect = false
    @State private var currentTemperature = 18.0
    @State private var conditionOn = false
    private let minValueTemp = 18.0
    private let maxValueTemp = 32.0
    
    
    // Variable Guage Air Force
    @State private var airSelected = false
    @State private var currentAirForce = 1.0
    @State private var airOn = false
    private let minValueAirForce = 1.0
    private let maxValueAirForce = 5.0
    
    // Variable Guage Gradient
    private var gradientGuage = Gradient(colors: [.blue, .cyan, .orange, .red])
    private var gradientDefault = Gradient(colors: [.gray.opacity(0.4), .gray.opacity(0.4)])
    private var gradientButtons: LinearGradient {
        LinearGradient(colors: [Color("GradientTop"), Color("GradientBottom")], startPoint: .bottom, endPoint: .top)
    }
    
    // Variable Controlls State
    
    @State var airCirculate = false
    @State var windowHeat = false
    @State var steeringWheelHeat = false
    @State var autoCondition = false
    @State var airDirection = 0
    
    //MARK: Body
    var body: some View {
        airCounditionView
    }
    //MARK: Air Condition View
    var airCounditionView: some View {
        VStack{
            HStack(spacing: 50){
                VStack(spacing: 35){
                    Spacer()
                    //Guage Presentation
                    Gauge(value: currentTemperature, in: minValueTemp...maxValueTemp) {
                    } currentValueLabel: {
                        Label("Temperature (°C)", systemImage: "thermometer.medium")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    } minimumValueLabel: {
                        Text("\(Int(minValueTemp))")
                            .foregroundColor(Color.green.opacity(conditionOn ? 1.0 : 0.0))
                            .font(.system(size: 8))
                    } maximumValueLabel: {
                        Text("\(Int(maxValueTemp))")
                            .foregroundColor(Color.red.opacity(conditionOn ? 1.0 : 0.0))
                            .font(.system(size: 8))
                            
                    }
                    .padding(.top,5)
                    .scaleEffect(2)
                    .tint(conditionOn ? gradientGuage : gradientDefault)
                    .gaugeStyle(.accessoryCircular)
                    //Guage Controll
                    Button{
                        conditionOn.toggle()
                    } label: {
                        Text(conditionOn ? "On" : "Off")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    .frame(width: 70,height: 30)
                    .overlay {
                        RoundedRectangle(cornerRadius:50)
                            .stroke(gradientButtons, lineWidth: 2)
                            .opacity(conditionOn ? 1 : 0)
                    }
                    .background(RoundedRectangle(cornerRadius:50).fill(Color("Background")))
                    .neumorphismSelectedStyle()
                    
                }
                .onTapGesture {
                    tempSelect.toggle()
                    airSelected = false
                }
                .frame(width: 120,height: 120)
                
                
                
                VStack(spacing: 35){
                    Spacer()
                    Gauge(value: currentAirForce, in: minValueAirForce...maxValueAirForce) {
                    } currentValueLabel: {
                        Image(airOn ? "airOn" : "airOff" )
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                    } minimumValueLabel: {
                        Text("\(Int(minValueAirForce))")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    } maximumValueLabel: {
                        Text("\(Int(maxValueAirForce))")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    .padding(.top,5)
                    .scaleEffect(2)

                    .tint(colorScheme == .dark ? .white : .black)
                    .gaugeStyle(.accessoryCircular)
                    Button{
                        airOn.toggle()
                    } label: {
                        Text(airOn ? "On" : "Off")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    .frame(width: 70,height: 30)
                    .overlay {
                        RoundedRectangle(cornerRadius:50)
                            .stroke(gradientButtons, lineWidth: 2)
                            .opacity(airOn ? 1 : 0)
                    }
                    .background(RoundedRectangle(cornerRadius:50).fill(Color("Background")))
                    .neumorphismSelectedStyle()
                    
                    
                    
                    
                }
                .onTapGesture {
                    airSelected.toggle()
                    tempSelect = false
                }
                .frame(width: 120,height: 120)
                
                
            }
            Spacer()
            HStack(spacing: 25) {
                if tempSelect == true {
                    withAnimation {
                        Slider(value: $currentTemperature, in: minValueTemp...maxValueTemp)
                            .padding()
                            .frame(height: 50)
                            .neumorphismSelectedStyle()
                    }
                    
                } else if airSelected == true {
                    HStack(spacing: 20){
                        ForEach(1..<6){ index in
                            Button{
                                currentAirForce = Double(index)
                            } label: {
                                Text("\(index)")
                            }
                            .frame(width: 30,height: 30)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .neumorphismSelectedCircleStyle()
                            .overlay {
                                Circle()
                                    .stroke(gradientButtons, lineWidth: 2)
                                    .opacity(currentAirForce == Double(index) ? 1 : 0)
                            }
                        }
                    }
                    //.padding()
                    
                    
                } else {
                    withAnimation{
                        HStack(spacing: 20){
                            
                            //MARK: Window Heat Button
                            Button{
                                windowHeat.toggle()
                            }label: {
                                Image(systemName: "windshield.front.and.heat.waves")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                
                            }
                            .frame(width: 30,height: 30)
                            .neumorphismSelectedCircleStyle()
                            .overlay {
                                Circle()
                                    .stroke(gradientButtons, lineWidth: 2)
                                    .opacity(windowHeat ? 1 : 0)
                            }
                            
                            //MARK: Steeringwheel Button
                            Button{
                                steeringWheelHeat.toggle()
                            }label: {
                                Image(systemName: "steeringwheel.and.heat.waves")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                            .frame(width: 30,height: 30)
                            .neumorphismSelectedCircleStyle()
                            .overlay {
                                Circle()
                                    .stroke(gradientButtons, lineWidth: 2)
                                    .opacity(steeringWheelHeat ? 1 : 0)
                            }
                            
                            //MARK: Automatic Climat Button
                            Button{
                                autoCondition.toggle()
                            }label: {
                                Text("AUTO")
                                    .minimumScaleFactor(0.3)
                                    .fontWeight(.black)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                            .frame(width: 30,height: 30)
                            .neumorphismSelectedCircleStyle()
                            .overlay {
                                Circle()
                                    .stroke(gradientButtons, lineWidth: 2)
                                    .opacity(autoCondition ? 1 : 0)
                            }
                            
                            //MARK: Air Direction Button
                            Button{
                                airDirection += 1
                                if airDirection > 3 { airDirection = 0 }
                            }label: {
                                switch airDirection {
                                case 0:
                                    Image(systemName: "figure.seated.side.air.upper")
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                case 1:
                                    Image(systemName: "figure.seated.side.air.upper")
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                case 2:
                                    Image(systemName: "figure.seated.side.air.lower")
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                case 3:
                                    Image(systemName: "figure.seated.side.air.upper.and.lower")
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                default:
                                    Image(systemName: "figure.seated.side.air.upper")
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                }
                            }
                            .frame(width: 30,height: 30)
                            .neumorphismSelectedCircleStyle()
                            .overlay {
                                Circle()
                                    .stroke(gradientButtons, lineWidth: 2)
                                    .opacity(airDirection > 0 ? 1 : 0)
                            }
                            
                            //MARK: Air Circulation Button
                            Button{
                                airCirculate.toggle()
                            }label: {
                                Image(systemName: airCirculate ? "car.side.air.circulate" : "car.side.air.fresh")
                                    .resizable()
                                    .frame(width: 30, height: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                            
                            .frame(width: 30,height: 30)
                            .neumorphismSelectedCircleStyle()
                            .overlay {
                                Circle()
                                    .stroke(gradientButtons, lineWidth: 2)
                                    .opacity(airCirculate ? 1 : 0)
                            }
                            
                        }
                    }
                }
            }
            Spacer()
                .frame(height: 10)
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 25, height: 250)
        .background(RoundedRectangle(cornerRadius:50).fill(Color("Background")))
        .neumorphismUnSelectedStyle()
        
    }
}
struct AirControllView_Previews: PreviewProvider {
    static var previews: some View {
        AirControllView()
    }
}
