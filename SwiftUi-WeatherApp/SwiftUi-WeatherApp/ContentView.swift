//
//  ContentView.swift
//  SwiftUi-WeatherApp
//
//  Created by Sonu Martin on 2024-04-30.
//

import SwiftUI

struct ContentView: View {
    
    //If the user interacts with the toggle, the isToggleOn property will change, but the UI won't reflect this change because SwiftUI doesn't know that it needs to re-render the view.
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill", tempreature: 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 76)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 54)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 67)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "snow", temperature: 88)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.rain.fill", temperature: 76)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                }  label: {
                    WeatherButton(title: "Change Day Time", backGroundColor: .white, foreGroundColor: .blue)
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

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack {
            Text (dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(
//            gradient: Gradient(colors: [isNight ? .black : .blue,isNight ? .gray : Color("lightBlue")]),
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing)
//
//        .edgesIgnoringSafeArea(.all)
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight:.medium, design: .default))
            .foregroundColor(.white)
            .padding()
        
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var tempreature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)// to get multi colour
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(tempreature)")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
        }
        .padding(.bottom, 40)
    }
}


