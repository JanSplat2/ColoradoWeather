//
//  ContentView.swift
//  ColoradoWeather
//
//  Created by Dittrich, Jan - Student on 9/26/25.
//

import SwiftUI

struct ContentView: View {
    @State private var ButtonPressed = false
    @State private var temp: Int  = Int.random(in: -25...45)
    @State private var humid: Int  = Int.random(in: 0...100)
    @State private var message: String  = ""
    @State private var icon: String  = ""
    @State private var color1: Color  = .white
    @State private var color2: Color  = .blue
    @State private var message2: String  = ""
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 100))
                .foregroundStyle(.white)
            Text("Colorado Weather")
                .font(.largeTitle)
                .foregroundStyle(.white)
            Button("Get Weather") {
                temp = Int.random(in: -25...45)
                humid = Int.random(in: 0...100)
                makeMessage()
                changeIcon()
                changeColor()
                humidMessage()
                print("\(ButtonPressed)")
                ButtonPressed.toggle( )
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .fontWeight(.heavy)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [color1, color2], startPoint: .topLeading, endPoint: .bottomTrailing))
        .sheet(isPresented: $ButtonPressed) { [temp, message, icon, humid, message2] in
            NavigationStack {
                VStack {
                    Image(systemName: icon)
                        .font(.system(size: 100))
                        .foregroundStyle(.black)
                    Text("\(temp)")
                        .font(.system(size: 200))
                    Text(message)
                        .font(.largeTitle)
                    Text("The humidity is: \(humid)%")
                        .font(.largeTitle)
                    Text(message2)
                        .font(.largeTitle)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(LinearGradient(colors: [color1, color2], startPoint: .topLeading, endPoint: .bottomTrailing))
                .navigationTitle("Weather")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Dismiss") {
                            ButtonPressed.toggle()
                        }
                    }
                }
            }
        }
    }
    func makeMessage() {
        if temp > 28 {
            message = "It's very hot!"
        } else if temp > 25 {
            message = "It's pleasant"
        } else if temp > 15 {
            message = "It's a bit chilly"
        } else if temp > 5 {
            message = "It's cold!"
        } else if temp > 0 {
            message = "Brrr!"
        } else {
            message = "You should consider moving to warmer places!"
        }
    }
    func changeIcon() {
        if temp > 28 {
            icon = "thermometer.sun"
        } else if temp > 25 {
            icon = "cloud.sun"
        } else if temp > 15 {
            icon = "cloud"
        } else if temp > 5 {
            icon = "cloud.rain"
        } else if temp > 0 {
            icon = "snowflake"
        } else {
            icon = "truck.box.badge.clock"
        }
    }
    func changeColor() {
        if temp > 28 {
            color1 = .red
            color2 = .orange
        } else if temp > 25 {
            color1 = .orange
            color2 = .yellow
        } else if temp > 18 {
            color1 = .yellow
            color2 = .pink
        } else if temp > 15 {
            color1 = .pink
            color2 = .purple
        } else if temp > 3 {
            color1 = .purple
            color2 = .blue
        } else {
            color1 = .blue
            color2 = .white
        }
    }
    func humidMessage() {
        if humid > 100 && temp > 1 {
            message2 = "It's gonna rain!"
        } else if humid > 80 && temp > 1 {
            message2 = "There is a chance of rain"
        } else if humid > 60 && temp > 1{
            message2 = "There is a lower chance to rain"
        } else if humid > 40  && temp > 1{
            message2 = "If you are very lucky, it's gonna be raining"
        } else if humid > 20 && temp > 18{
            message2 = "It probably won't rain"
        } else if humid < 20 && temp > 30{
            message2 = "Everything will dry out!"
        } else if humid > 100 && temp < 1 {
            message2 = "It's gonna snow!"
        } else if humid > 80 && temp < 1{
            message2 = "There is a chance of snow"
        } else if humid > 60 && temp < 1{
            message2 = "There is a lower chance to snow"
        } else if humid > 40 && temp < 1{
            message2 = "If you are very lucky, it's gonna be snowing"
        } else if humid > 20 && temp < 1{
            message2 = "It probably won't snow"
        } else  {
            message2 = "It won't snow, but it's very cold!"
        }
    }
}

#Preview {
    ContentView()
}
