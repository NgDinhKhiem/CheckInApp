//
//  GradientButtonStyle.swift
//  CheckInApp
//
//  Created by Nguyễn  Khiêm on 24/04/2023.
//

import Foundation
import SwiftUI


struct GradientButtonStyle: ButtonStyle{
    func makeBody(configuration: Self.Configuration) -> some View{
        configuration.label
            .foregroundColor(Color.white)
            .background(LinearGradient(gradient: Gradient(colors: [.red,.orange]), startPoint: .leading, endPoint: .trailing))
            .padding()
            .cornerRadius(15)
    }
}
