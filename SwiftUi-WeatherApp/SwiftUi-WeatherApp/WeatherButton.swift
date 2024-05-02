//
//  WeatherButton.swift
//  SwiftUi-WeatherApp
//
//  Created by Sonu Martin on 2024-04-30.
//

import Foundation
import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var backGroundColor: Color
    var foreGroundColor: Color
    
    var body: some View {
        Text (title)
            .frame(width: 250, height: 50)
            .background(backGroundColor)
            .foregroundColor(foreGroundColor)
            .font(.system(size: 20, weight: .bold,design: .default))
            .cornerRadius(10)
    }
    
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(title: "Test Title", backGroundColor: .blue, foreGroundColor: .white)
    }
}
